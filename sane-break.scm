(define-module (sane-break)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system qt)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages kde-frameworks))

(define-public sane-break
  (package
    (name "sane-break")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AllanChain/sane-break/archive/refs/tags/v" version
                                  ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1h25i2bafrjqjcaw6y9k8pwy8lj5swnwqwvsjffxi6iyqj74190g"))))
    (build-system qt-build-system)
    (inputs
     (list qtbase-5
           qtx11extras
           libxcb
           xcb-util-wm
           libxkbcommon
           kwindowsystem
           vulkan-loader))
    (native-inputs
     (list pkg-config))
    (home-page "https://github.com/AllanChain/sane-break")
    (synopsis "Take-a-break reminder tool")
    (description "Sane-break is a take-a-break reminder tool that is sane.
It has a simple UI and is highly customizable.")
    (license license:gpl3+)))
