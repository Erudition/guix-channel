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
           #~(modify-phases %standard-phases
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
                      (string-append #$output "/bin/opencode-desktop")))))
               (add-after 'install 'symlink-binary-file
                 (lambda _
                   (mkdir-p (string-append #$output "/bin"))
                   (symlink (string-append #$output "/lib/OpenCode/ai.opencode")
                            (string-append #$output "/bin/opencode-desktop")))))))
    (home-page "https://opencode.ai")
    (synopsis "Desktop client for the OpenCode AI coding agent")
    (description "OpenCode Desktop is an Electron-based desktop client for the
OpenCode AI coding agent.")
    (license license:expat)))
