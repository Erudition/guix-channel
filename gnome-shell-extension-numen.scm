(define-module (gnome-shell-extension-numen)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext))

(define-public gnome-shell-extension-numen
  (package
    (name "gnome-shell-extension-numen")
    (version "0.1.8")
    (source (local-file "/home/adroit/Gemini_Projects/numen-gnome-extension"
                        #:recursive? #t))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gnome-shell/extensions/numen@erudition.github.com"
           #:include-regexp (".js$" ".json$" ".css$" ".xml$" ".mo$" ".compiled$" "ui/.*.ui$" "LICENSE$")))
      #:phases
      #~ (modify-phases %standard-phases
          (add-before 'install 'compile-schemas
            (lambda _
              (with-directory-excursion "schemas"
                (invoke "glib-compile-schemas" ".")))))))
    (native-inputs
     (list (list glib "bin")
           gettext-minimal))
    (home-page "https://github.com/Erudition/guix-channel")
    (synopsis "GNOME interface for Numen voice control")
    (description "This extension provides a status bar indicator and a graphical
configuration interface for the Numen voice control system.")
    (license license:gpl3+)))
