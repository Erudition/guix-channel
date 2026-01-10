(define-module (sane-break)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
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
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AllanChain/sane-break")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "017c4hxxqkpxs9qhw9xxz361hwbz0fmc5q51k01cavzf2m6xyjfz"))))
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
