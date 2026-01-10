(define-module (rclone-browser)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system qt)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sync)
  #:use-module (rclone))

(define-public rclone-browser
  (package
    (name "rclone-browser")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/totza2010/RcloneBrowser/archive/refs/tags/v"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0kmsqrihl1i11m4as2311qcqwx8wz18cwfhpj08byc81b4c9l933"))))
    (build-system qt-build-system)
    (arguments
     (list #:tests? #f
           #:qtbase qtbase))
    (inputs
     (list qtbase
           qtmultimedia
           rclone))
    (native-inputs
     (list cmake pkg-config))
    (home-page "https://github.com/totza2010/RcloneBrowser")
    (synopsis "GUI for rclone")
    (description "RcloneBrowser is a cross-platform GUI for rclone.
It allows you to browse and modify any rclone remote, including cloud storage services.")
    (license license:expat)))
