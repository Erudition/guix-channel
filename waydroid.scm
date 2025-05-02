;;; Copyright © 2021 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2024 Murilo <murilo@disroot.org>
;;;
;;; I took some parts of this, mostly the waydroid dependencies,
;;; from phodina's patch series, see https://issues.guix.gnu.org/51737
;;;
;;; This file is NOT part of GNU Guix.
;;;

(define-module (waydroid)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (waydroid))

(define libglibutil
  (package
    (name "libglibutil")
    (version "1.0.79")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sailfishos.org/mer-core/libglibutil")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1zn0h9f8bd4kwqz33b8719r1wwbx790qvwl05w1yqrm0z270m6sh"))))
    (build-system gnu-build-system)
    (arguments
     (list #:make-flags #~(list (string-append "CC="
                                               #$(cc-for-target))
                                (string-append "DESTDIR="
                                               #$output))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (add-after 'unpack 'remove-usr-prefix
                          (lambda* _
                            (substitute* "libglibutil.pc.in"
                              (("/usr/include") (string-append #$output
                                                               "/include")))
                            (substitute* "Makefile"
                              (("usr/") ""))))
                        (add-after 'install 'install-dev
                          (lambda* _
                            (invoke "make" "install-dev"
                                    (string-append "DESTDIR="
                                                   #$output))))
                        (replace 'check
                          (lambda* (#:key tests? #:allow-other-keys)
                            (when tests?
                              (chdir "test")
                              (invoke "make"
                                      (string-append "CC="
                                                     #$(cc-for-target)))
                              (chdir "..")))))))
    (native-inputs (list pkg-config))
    (inputs (list glib))
    (home-page "https://git.sailfishos.org/mer-core/libglibutil")
    (synopsis "GLib utilites")
    (description "This package provides library of glib utilities.")
    (license license:bsd-3)))

(define libgbinder
  (package
    (name "libgbinder")
    (version "1.1.42")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mer-hybris/libgbinder")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1in95drgr647q785ljiyi2wqp5fws1iqi0bjs49qx359c019z73z"))))
    (build-system gnu-build-system)
    (arguments
     (list #:make-flags #~(list (string-append "CC="
                                               #$(cc-for-target))
                                (string-append "DESTDIR="
                                               #$output))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (add-after 'unpack 'fix-pkg-config-in
                          (lambda* _
                            (substitute* "Makefile"
                              (("usr/") ""))
                            (substitute* "libgbinder.pc.in"
                              (("@libdir@") (string-append #$output "/lib"))
                              (("/usr/include") (string-append #$output
                                                               "/include")))))
                        (add-after 'install 'install-dev
                          (lambda* _
                            (invoke "make" "install-dev"
                                    (string-append "DESTDIR="
                                                   #$output))))
                        (replace 'check
                          (lambda* (#:key tests? #:allow-other-keys)
                            (when tests?
                              (chdir "test")
                              (invoke "make"
                                      (string-append "CC="
                                                     #$(cc-for-target)))
                              (chdir "..")))))))
    (native-inputs (list bison flex pkg-config))
    (inputs (list glib libglibutil))
    (home-page "https://github.com/mer-hybris/libgbinder")
    (synopsis "GLib-style interface to binder")
    (description
     "This package provides GLib-style interface to binder:
@enumerate
@item Integration with GLib event loop
@item Detection of 32 vs 64 bit kernel at runtime
@item Asynchronous transactions that don't block the event thread
@item Stable service manager and low-level transation APIs
@end enumerate")
    (license license:bsd-3)))

(define python-gbinder
  (package
    (name "python-gbinder")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/erfanoabdi/gbinder-python")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0wdpf6b6b3cmd42j1qkfp19y9bdymy5dv12r261gkhvxxh160zym"))))
    (build-system python-build-system)
    (arguments
     (list #:phases #~(modify-phases %standard-phases
                        (replace 'build
                          (lambda* _
                            (invoke "python" "setup.py" "build_ext"
                                    "--inplace" "--cython"))))))
    (native-inputs (list python-cython pkg-config))
    (inputs (list glib libgbinder libglibutil))
    (home-page "https://github.com/erfanoabdi/gbinder-python")
    (synopsis "Python bindings for libgbinder")
    (description "This package provides Python bindings for libgbinder.")
    (license license:gpl3+)))

(define waydroid
  (package
    (name "waydroid")
    (version "1.4.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/waydroid/waydroid")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0j90h3wr2pjz0b30ry151pxx0pbkjvml8myyzfz8wnr0cswg5s1d"))))
    (build-system gnu-build-system)
    (arguments
      (list #:make-flags
            #~(list "USE_SYSTEMD=0"
                    (string-append "PREFIX=" #$output)
                    (string-append "SYSCONFDIR=" #$output "/etc"))
            #:phases
            #~(modify-phases %standard-phases
                (delete 'configure)
                (delete 'check)
                (add-after 'unpack 'unpack-fixes
                  (lambda _
                    (substitute* '("tools/helpers/run.py"
                                   "tools/helpers/lxc.py")
                      (("\"sh\"") (string-append "\"" #$bash-minimal "/bin/sh" "\""))
                      (("\"lxc-info\"") (string-append "\"" #$lxc "/bin/lxc-info" "\""))
                      (("\"lxc-start\"") (string-append "\"" #$lxc "/bin/lxc-start" "\""))
                      (("\"lxc-stop\"") (string-append "\"" #$lxc "/bin/lxc-stop" "\""))
                      (("\"lxc-freeze\"") (string-append "\"" #$lxc "/bin/lxc-freeze" "\""))
                      (("\"lxc-unfreeze\"") (string-append "\"" #$lxc "/bin/lxc-unfreeze" "\""))
                      (("\"lxc-attach\"") (string-append "\"" #$lxc "/bin/lxc-attach" "\"")))))
                (add-after 'install 'install-fixes
                  (lambda _
                    (let* ((paths (list (string-append #$iptables "/bin")
                                        (string-append #$iptables "/sbin")
                                        (string-append #$iproute "/bin")
                                        (string-append #$dnsmasq "/bin")
                                        (string-append #$glibc "/bin")
                                        (string-append #$lxc "/bin")
                                        (string-append #$wl-clipboard "/bin")
                                        (string-append #$dnsmasq "/sbin")
                                        ))
                           (python-path (map (lambda (i)
                                               (string-append i "/lib/python3.11/site-packages"))
                                             (list #$(this-package-input "python-dbus")
                                                   #$(this-package-input "python-gbinder")
                                                   #$(this-package-input "python-pygobject")
                                                   #$(this-package-input "python-pyclip")))))
                      (wrap-program (string-append #$output "/lib/waydroid/data/scripts/waydroid-net.sh")
                                    `("PATH" prefix ,paths))
                      (wrap-program (string-append #$output "/bin/waydroid")
                                    `("PYTHONPATH" prefix ,python-path))
                      (wrap-program (string-append #$output "/bin/waydroid")
                                    `("GI_TYPELIB_PATH" prefix (list "/lib/girepository-1.0")))
                    ))))))
    (native-inputs (list gobject-introspection))
    (propagated-inputs
      (list gawk
            gtk
            kmod
            lxc
            python
            python-dbus
            python-gbinder
            python-pyclip
            python-pygobject
            util-linux
            wl-clipboard
            gobject-introspection
            glib))
    (home-page "https://waydro.id")
    (synopsis "Container-based approach to boot a full Android system")
    (description
     "Waydroid uses Linux namespaces @code{(user, pid, uts, net,
mount, ipc)} to run a full Android system in a container and provide Android
applications.  The Android inside the container has direct access to needed
underlying hardware.  The Android runtime environment ships with a minimal
customized Android system image based on LineageOS.  The used image is
currently based on Android 11.")
    (license license:gpl3)))

waydroid