(define-module (netdata service)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base) ; for coreutils
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (ice-9 match)
  #:use-module (netdata netdata)
  #:export (netdata-configuration
            netdata-configuration?
            netdata-service-type))

;; The standard Guix System log format: YYYY-MM-DD HH:MM:SS host service[pid]: message
(define %guix-syslog-pattern
  "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2} [^\\s]+ (?:(?P<SYSLOG_IDENTIFIER>[^:\\[\\s]+)(?:\\[\\d+\\])?: )?(?P<MESSAGE>.*)")

(define %default-netdata-log-inputs
  `(("syslog" . ("/var/log/messages" . ,%guix-syslog-pattern))))

(define-record-type* <netdata-configuration>
  netdata-configuration make-netdata-configuration
  netdata-configuration?
  (netdata netdata-configuration-netdata
           (default netdata))
  (user    netdata-configuration-user
           (default "netdata"))
  (group   netdata-configuration-group
           (default "netdata"))
  (plugins netdata-configuration-plugins
           (default '()))
  (configs netdata-configuration-configs
           (default '()))
  (log-inputs netdata-configuration-log-inputs
              (default %default-netdata-log-inputs)))

(define %netdata-accounts
  (list (user-group (name "netdata") (system? #t))
        (user-account
         (name "netdata")
         (group "netdata")
         (system? #t)
         (comment "Netdata monitoring user")
         (home-directory "/var/lib/netdata")
         (shell (file-append shadow "/sbin/nologin"))
         (supplementary-groups '("adm" "audio" "video" "docker" "plugdev")))))

(define (netdata-activation config)
  (let ((configs (netdata-configuration-configs config))
        (plugins (netdata-configuration-plugins config))
        (log-inputs (netdata-configuration-log-inputs config)))
    #~(begin
        (use-modules (guix build utils)
                     (ice-9 match))
        (let ((user (getpwnam #$(netdata-configuration-user config))))
          (for-each (lambda (dir)
                      (mkdir-p dir)
                      (chown dir (passwd:uid user) (passwd:gid user)))
                    '("/var/cache/netdata"
                      "/var/lib/netdata"
                      "/var/lib/netdata/registry"
                      "/var/lib/netdata/lock"
                      "/var/log/netdata"
                      "/var/log/netdata/journal"
                      "/etc/netdata"
                      "/etc/netdata/python.d"
                      "/etc/netdata/go.d"
                      "/etc/netdata/log2journal.d"
                      "/var/lib/netdata/plugins.d"
                      "/run/systemd/journal"))
          
          (for-each (match-lambda
                      ((file . content)
                       (let ((path (string-append "/etc/netdata/" file)))
                         (mkdir-p (dirname path))
                         (with-output-to-file path
                           (lambda () (display content)))
                         (chown path (passwd:uid user) (passwd:gid user)))))
                    '#$configs)

          ;; Create log2journal config files
          (for-each (match-lambda
                      ((name . (path . pattern))
                       (let ((cfg-path (string-append "/etc/netdata/log2journal.d/" name ".yaml")))
                         (with-output-to-file cfg-path
                           (lambda ()
                             (format #t "pattern: '~a'\nunmatched:\n  key: MESSAGE\n" pattern)))
                         (chown cfg-path (passwd:uid user) (passwd:gid user)))))
                    '#$log-inputs)

          (for-each (lambda (pkg)
                      (let ((plugin-dir (string-append pkg "/usr/libexec/netdata/plugins.d")))
                        (when (file-exists? plugin-dir)
                          (for-each (lambda (file)
                                      (let ((target (string-append "/var/lib/netdata/plugins.d/" (basename file))))
                                        (false-if-exception (delete-file target))
                                        (symlink file target)))
                                    (find-files plugin-dir)))))
                    '#$plugins)))))

(define (netdata-shepherd-service config)
  (let* ((netdata (netdata-configuration-netdata config))
         (user    (netdata-configuration-user config))
         (group   (netdata-configuration-group config))
         (log-inputs (netdata-configuration-log-inputs config)))
    
    (cons (shepherd-service
           (provision '(netdata))
           (documentation "Netdata performance monitoring daemon.")
           (requirement '(networking syslogd))
           (start #~(make-forkexec-constructor
                     (list #$(file-append netdata "/usr/sbin/netdata")
                           "-D" "-u" #$user
                           "-W" "set" "global" "plugins directory" 
                           (string-append #$(file-append netdata "/usr/libexec/netdata/plugins.d") 
                                          " /var/lib/netdata/plugins.d"))
                     #:user #$user
                     #:group #$group
                     #:log-file "/var/log/netdata/daemon.log"))
           (stop #~(make-kill-destructor)))
          
          (map (match-lambda
                 ((name . (path . pattern))
                  (shepherd-service
                   (provision (list (symbol-append 'netdata-log- (string->symbol name))))
                   (requirement '(netdata))
                   (documentation (string-append "Netdata log ingestion sidecar for " name))
                   (start #~(make-forkexec-constructor
                             (list "/bin/sh" "-c"
                                   (string-append #$(file-append coreutils "/bin/tail") " -F " #$path " | "
                                                  #$(file-append netdata "/usr/sbin/log2journal")
                                                  " -f /etc/netdata/log2journal.d/" #$name ".yaml 2>/dev/null | "
                                                  #$(file-append netdata "/usr/sbin/guix-journal-writer")
                                                  " /var/log/netdata/journal/guix.journal"))
                             #:user #$user
                             #:group #$group
                             #:supplementary-groups '("adm")))
                   (stop #~(make-kill-destructor)))))
               log-inputs))))

(define netdata-service-type
  (service-type
   (name 'netdata)
   (description "Netdata monitoring service.")
   (extensions
    (list (service-extension shepherd-root-service-type
                             netdata-shepherd-service)
          (service-extension account-service-type
                             (const %netdata-accounts))
          (service-extension activation-service-type
                             netdata-activation)))))
