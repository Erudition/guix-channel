(define-module (cage)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages gl))

(define-public cage
  (package
    (name "cage")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cage-kiosk/cage/archive/v"
                                  version ".tar.gz"))
              (sha256
               (base32 "1hxn3hy49v01hj48jabybmqf5mv84b9g86wyiyanlqqr1yg6agwx"))
              (file-name (string-append name "-" version ".tar.gz"))))
    (build-system meson-build-system)
    (native-inputs
     (list pkg-config wayland-protocols))
    (inputs
     (list wlroots-0.19 wayland libxkbcommon mesa pixman))
    (synopsis "Wayland kiosk compositor")
    (description "Cage is a Wayland kiosk compositor, which displays a single
maximized application at a time.")
    (home-page "https://www.hjdskes.nl/projects/cage/")
    (license license:expat)))
