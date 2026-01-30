(define-module (gnome-shell-extension-hibernate-status)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext))

(define-public gnome-shell-extension-hibernate-status
  (package
    (name "gnome-shell-extension-hibernate-status")
    (version "1.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arelange/gnome-shell-extension-hibernate-status")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0rd170v718ilyviyqvnlkm4winrwnwzmhsylvqgy4yfziq0hh0w5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gnome-shell/extensions/hibernate-status@dromi"
           #:include-regexp (".js$" ".json$" ".css$" ".xml$" ".mo$" ".compiled$")))
      #:phases
      #~ (modify-phases %standard-phases
          (add-before 'install 'compile-schemas
            (lambda _
              (with-directory-excursion "schemas"
                (invoke "glib-compile-schemas" ".")))))))
    (native-inputs
     (list (list glib "bin")
           gettext-minimal))
    (home-page "https://github.com/arelange/gnome-shell-extension-hibernate-status")
    (synopsis "Add a hibernate button to the GNOME power menu")
    (description "This extension adds a hibernate button to the GNOME Shell status menu.")
    (license license:gpl2+)))