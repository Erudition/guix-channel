(define-module (opencode-desktop)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system chromium-binary))

(define-public opencode-desktop
  (package
    (name "opencode-desktop")
    (version "2.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/anomalyco/opencode/releases/download/v"
             version "/opencode-desktop-linux-amd64.deb"))
       (sha256
        (base32 "1s4xh6gqz5z0zl2skrv140vv256q1ra5bspx57449rqd48aff9y8"))))
    (supported-systems '("x86_64-linux"))
    (build-system chromium-binary-build-system)
    (arguments
     (list #:validate-runpath? #f ; TODO: fails on wrapped binary and included other files
           #:wrapper-plan
           #~'(("lib/OpenCode/ai.opencode" (("out" "/lib/OpenCode")))
               ("lib/OpenCode/chrome_crashpad_handler" (("out" "/lib/OpenCode")))
                ("lib/OpenCode/resources/opencode-cli" (("out" "/lib/OpenCode"))))
            #:phases
            #~(begin
                (use-modules (ice-9 textual-ports))
                (modify-phases %standard-phases
                (add-after 'binary-unpack 'setup-cwd
                  (lambda _
                    (copy-recursively "usr/" ".")
                    ;; Use the more standard lib directory for everything.
                    (rename-file "opt/" "lib")
                    ;; Remove unneeded files.
                    (delete-file-recursively "usr")
                    ;; Fix the .desktop files' binary location.  Both files
                    ;; ship "Exec=/opt/OpenCode/ai.opencode %U"; replace the
                    ;; path token only, preserving the trailing "%U".  Icon
                    ;; already reads "ai.opencode", matching the installed
                    ;; hicolor icons; upstream ships no TryExec= line.
                    (substitute* '("share/applications/ai.opencode.desktop.desktop"
                                   "share/applications/opencode-desktop.desktop")
                      (("/opt/OpenCode/ai.opencode")
                       (string-append #$output "/bin/opencode-desktop")))
                    ;; Disable the packaged auto-updater (smoke-test
                    ;; contingency): upstream gates it on
                    ;; "enabled = build.packaged" in
                    ;; packages/gui-plugins/src/updater/main.ts; compiled it
                    ;; reads "a=r.packaged" inside out/main/main-BLJMVnzQ.js
                    ;; in resources/app.asar.  Replace it with a
                    ;; byte-length-identical expression so the asar header's
                    ;; recorded file sizes and offsets stay valid.  Reading
                    ;; and writing through ISO-8859-1 ports is byte
                    ;; transparent (substitute* would corrupt every byte
                    ;; above 0x7F).  With the gate false the updater state
                    ;; machine stays at "disabled": no update checks, no
                    ;; .deb downloads, greyed-out menu entry.
                    (let ((asar "lib/OpenCode/resources/app.asar")
                          (gate "a=r.packaged")
                          (disabled "a=!1/*padd*/"))
                      (chmod asar #o644)
                      (let* ((contents (call-with-input-file asar
                                         (lambda (port)
                                           (get-string-all port))
                                         #:encoding "ISO-8859-1"))
                             (offset (string-contains contents gate)))
                        (unless offset
                          (error "updater gate not found in app.asar"))
                        (when (string-contains contents gate (+ offset 1))
                          (error "updater gate not unique in app.asar"))
                        (let loop ((i 0))
                          (unless (= i (string-length disabled))
                            (string-set! contents (+ offset i)
                                         (string-ref disabled i))
                            (loop (1+ i))))
                        (call-with-output-file asar
                          (lambda (port)
                            (put-string port contents))
                          #:encoding "ISO-8859-1")))))
               (add-after 'install 'symlink-binary-file
                 (lambda _
                   (mkdir-p (string-append #$output "/bin"))
                    (symlink (string-append #$output "/lib/OpenCode/ai.opencode")
                             (string-append #$output "/bin/opencode-desktop"))))))))
    (home-page "https://opencode.ai")
    (synopsis "Desktop client for the OpenCode AI coding agent")
    (description "OpenCode Desktop is an Electron-based desktop client for the
OpenCode AI coding agent.")
    (license license:expat)))
