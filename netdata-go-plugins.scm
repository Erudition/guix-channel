(define-module (netdata-go-plugins)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages golang)
  #:use-module (netdata))

(define-public netdata-go-plugins
  (package
    (name "netdata-go-plugins")
    (version "2.8.5")
    (source (package-source netdata))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/netdata/netdata/go/plugins"
      #:unpack-path "github.com/netdata/netdata"
      #:install-source? #f
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'setup-go-source
            (lambda* (#:key import-path #:allow-other-keys)
              (let ((go-src (car (find-files "src" "go.mod"))))
                (let ((go-dir (dirname go-src))
                      (target (string-append "src/" import-path)))
                  (mkdir-p (dirname target))
                  (copy-recursively go-dir target)
                  (delete-file-recursively go-dir)))))
          (add-after 'setup-go-source 'unpack-vendor
            (lambda* (#:key inputs import-path #:allow-other-keys)
              (let ((vendor-tarball (assoc-ref inputs "netdata-go-vendor"))
                    (target (string-append "src/" import-path)))
                (invoke "tar" "-C" target "-xvf" vendor-tarball))))
          (replace 'build
            (lambda* (#:key import-path #:allow-other-keys)
              (let ((build-dir (string-append "src/" import-path)))
                (with-directory-excursion build-dir
                  (setenv "CGO_ENABLED" "0")
                  (setenv "GO111MODULE" "on")
                  (invoke "go" "build" "-mod=vendor" "-o" "go.d.plugin" "./cmd/godplugin")))))
          (replace 'install
            (lambda* (#:key outputs import-path #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/usr/libexec/netdata/plugins.d"))
                     (conf (string-append out "/usr/lib/netdata/conf.d/go.d"))
                     (src-path (string-append "src/" import-path)))
                ;; Install binary
                (mkdir-p bin)
                (install-file (string-append src-path "/go.d.plugin") bin)
                ;; Install stock configurations
                (mkdir-p conf)
                (copy-recursively (string-append src-path "/config/go.d") conf)))))))
    (native-inputs
     `(("netdata-go-vendor" 
        ,(local-file "/home/adroit/guix-config-src/netdata-go-vendor.tar.gz"))
       ("go" ,go-1.24)))
    (home-page "https://www.netdata.cloud/")
    (synopsis "Go-based collectors for Netdata (Liberated)")
    (description
     "This package provides the high-performance Go-based collectors for Netdata,
including web_log, logstash, and many others. It is built offline using a 
pre-calculated vendor bundle.")
    (license license:gpl3+)))
