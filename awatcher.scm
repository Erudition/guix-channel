(define-module (awatcher)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (ice-9 match)
  #:use-module (nonguix build-system binary)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages commencement)
  #:use-module (guix git-download)
  #:export (awatcher))

  ;; TODO finish with `gnome-extensions enable focused-window-dbus@flexagoon.com`

(define-public awatcher
  (package
    (name "awatcher")
    (version "0.3.1")
    (source (origin
      (method url-fetch)
        (uri
          (string-append "https://github.com/2e3s/awatcher/releases/download/v" version "/awatcher_" version "-1_amd64.deb"))
          (file-name (string-append "awatcher-bundle.deb"))
          (sha256 (base32 "0da96pr6gxa1p1imdl0gn6ifyzjm2zda467jhcmh0vnqj6g10w3z"))
          (modules '((guix build utils)))
          ; (snippet
          ;   '(begin
          ;     (invoke "ar" "x" "awatcher-bundle.deb")
          ;     (invoke "tar" "-xJf" "data.tar.xz")
          ;     (invoke "mv" "usr/*" ".")
          ;     (delete-file "data.tar.xz")
          ;     (delete-file-recursively "usr")
          ;     (delete-file "awatcher-bundle.deb")
          ;   ))
          ))
    (build-system binary-build-system)
    (arguments
     `(#:patchelf-plan
       `(("bin/awatcher"
            ("libxkbcommon" "xkeyboard-config" "libxcb" "glibc" "gcc-toolchain" "dbus" "openssl"))
         )
       #:phases
       (modify-phases %standard-phases
         (replace 'binary-unpack
           (lambda* (#:key inputs outputs #:allow-other-keys)
              (invoke "ar" "x" "awatcher-bundle.deb" "data.tar.xz")
              (invoke "tar" "--strip=1" "-xJf" "data.tar.xz")
              (invoke "ls")
              ; (invoke "mv" "usr/*" ".")
              (delete-file "data.tar.xz")
              ; (delete-file-recursively "usr")
              (delete-file "awatcher-bundle.deb")
              (substitute* '("share/applications/awatcher.desktop")
                  (("awatcher")  (string-append %output "/bin/awatcher")))
              (substitute* '("share/applications/awatcher.desktop")
                  (("/usr/")  (string-append %output "/")))
             ;; copy desktop file to autostart dir
             (mkdir-p "etc/xdg/autostart/")
             (invoke "cp" "share/applications/awatcher.desktop" "etc/xdg/autostart/")
             #t))
        (add-after 'install 'cleanup
           (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out")))
                     (invoke "rm" (string-append %output "/environment-variables")))
             #t))
          )))
    (native-inputs
     `(("binutils" ,binutils) ;; for "ar" command
     ("tar" ,tar)
    )) 
    (inputs
     `(("gcc-toolchain" ,gcc-toolchain)
       ("glibc" ,glibc)
       ("fontconfig" ,fontconfig)
       ("dbus" ,dbus)
       ("openssl" ,openssl)
       ("freetype" ,freetype)
       ("libxcb" ,libxcb)
       ("libxkbcommon" ,libxkbcommon)
       ("mesa" ,mesa)
       ("xkeyboard-config" ,xkeyboard-config)
       ("zlib" ,zlib)
       ("bash-minimal" ,bash-minimal)))
    (propagated-inputs `(("gnome-shell-extension-focused-window-d-bus" ,gnome-shell-extension-focused-window-d-bus)))
    (home-page "https://activitywatch.net/")
    (synopsis "Automatic time-tracking software with Wayland support")
    (description "Awatcher is a fork of ActivityWatch that supports Wayland.
It is an automatic time-tracking software that helps you keep track of what you
do.  ActivityWatch is about recording our digital lives, an evergrowing part of
our lives in general, and the new opportunities enabled by such a record.")
    (license license:mpl2.0)))


(define-public gnome-shell-extension-focused-window-d-bus
  (package
    (name "gnome-shell-extension-focused-window-d-bus")
    (version "48")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flexagoon/focused-window-dbus.git")
                    (commit "d2080edb7be8fbecf7fb581decab43c5b5d4e936")
                  ))
              (sha256
                (base32
                "1i37byrw3qr4ns4p8ahjr13mksjwy83qa6l6fz7s2nzdgkcl4qzm"))
              (file-name (git-file-name name version))))
    (build-system copy-build-system)
      (arguments
        (list
        #:install-plan
        #~'(("." "share/gnome-shell/extensions/focused-window-dbus@flexagoon.com"))))
      ; (native-inputs (list `(,glib "bin")))
        
    (synopsis "Focused window monitor for GNOME Shell")
    (description "Exposes a D-Bus method to get active window title and class ")
    (home-page "https://github.com/flexagoon/focused-window-dbus/")
    (license license:gpl3+)))