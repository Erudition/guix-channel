(define-module (gnome-shell-extension-just-perfection)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module ((guix licenses) #:prefix license:))

(define-public gnome-shell-extension-just-perfection
  (package
    (name "gnome-shell-extension-just-perfection")
    (version "30.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/jrahmatzadeh/just-perfection/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1y7m4y8zx7l6vl2f8w9nxac21x48ajcs5gf07r1k34adnf7wh8p2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src"
           "share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
           #:include-regexp ("\\.css$" "\\.compiled$" "\\.js(on)?$" "\\.ui$" "\\.gresource$"))
          ("locale"
           "share/gnome-shell/extensions/just-perfection-desktop@just-perfection/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'drop-executable-bits
            (lambda _
              (for-each
               (lambda (file)
                 (let ((stat (lstat file)))
                   (chmod file (logand (stat:mode stat) (lognot #o111)))))
               (find-files "." #:directories? #f))))
          (add-before 'install 'build
            (lambda _
              (invoke "glib-compile-schemas" "src/schemas")
              (invoke "glib-compile-resources" "--sourcedir=src/data"
                      "--target=src/resources.gresource"
                      "src/data/resources.gresource.xml")
              (for-each
               (lambda (file)
                 (let* ((base (basename file))
                        (noext (substring base 0 (- (string-length base) 3)))
                        (dest (string-append "locale/" noext "/LC_MESSAGES/"))
                        (out (string-append dest "just-perfection.mo")))
                   (mkdir-p dest)
                   (invoke "msgfmt" "-c" file "-o" out)))
               (find-files "po" "\\.po$")))))))
    (native-inputs
     (list `(,glib "bin") gettext-minimal))
    (home-page "https://gitlab.gnome.org/jrahmatzadeh/just-perfection")
    (synopsis "Customize GNOME Shell behaviour")
    (description "Just Perfection allows you to change various settings, that
GNOME Shell itself does not provide out of the box, such as the ability to hide
certain elements or change animation speeds.")
    (license license:gpl3)))
