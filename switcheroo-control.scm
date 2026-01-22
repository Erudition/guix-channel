(define-module (switcheroo-control)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system meson)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services dbus)
  #:use-module (gnu services shepherd)
  #:export (switcheroo-control
            switcheroo-control-service-type))

(define-public switcheroo-control
  (package
    (name "switcheroo-control")
    (version "2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.freedesktop.org/hadess/switcheroo-control/-/archive/"
                                  version "/switcheroo-control-" version ".tar.gz"))
              (sha256
               (base32
                "1dvqsjpqxfahzqg9jaml1mpfilv1024yxwbzn8pi7aj6ncq3chdn"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags
           #~(list (string-append "-Dsystemdsystemunitdir=" #$output "/lib/systemd/system"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-paths
                 (lambda _
                   (substitute* "data/meson.build"
                     (("install_dir: hwdb_dir")
                      (string-append "install_dir: '" #$output "/lib/udev/hwdb.d'")))
                   (substitute* "meson.build"
                     (("dbus_dep.get_pkgconfig_variable\\('system_bus_services_dir'\\)")
                      (string-append "'" #$output "/share/dbus-1/system-services'"))))))))
    (native-inputs
     (list pkg-config `(,glib "bin") python python-dbusmock))
    (inputs
     (list glib libgudev libdrm polkit))
    (home-page "https://gitlab.freedesktop.org/hadess/switcheroo-control")
    (synopsis "DBus service to check for availability of dual-GPU systems")
    (description "switcheroo-control is a DBus service to check for availability of dual-GPU systems and provide information about them.")
    (license license:gpl3+)))

(define (switcheroo-control-shepherd-service config)
  (list (shepherd-service
         (documentation "Run the switcheroo-control DBus service.")
         (provision '(switcheroo-control))
         (requirement '(dbus-system udev))
         (start #~(make-forkexec-constructor
                   (list #$(file-append switcheroo-control "/libexec/switcheroo-control"))))
         (stop #~(make-kill-destructor)))))

(define-public switcheroo-control-service-type
  (service-type
   (name 'switcheroo-control)
   (extensions
    (list (service-extension shepherd-root-service-type
                             switcheroo-control-shepherd-service)
          (service-extension dbus-root-service-type
                             (compose list (const switcheroo-control)))
          (service-extension udev-service-type
                             (compose list (const switcheroo-control)))))
   (default-value #f)
   (description "Provide a DBus service to check for availability of dual-GPU systems.")))