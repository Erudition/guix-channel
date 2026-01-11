(define-module (gnome-ext-hanabi)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module (guix utils)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages bash))

(define-public gnome-ext-hanabi
  (package
    (name "gnome-ext-hanabi")
    (version "0.1") ; No tags, using base version
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jeffshee/gnome-ext-hanabi")
                    (commit "227d3faf8d5725910eda094f5733656ceca3b26d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1kz3j237a2q1434vgliq5j4q1qcnppm7lhcfy27wx4swmvgvddp5"))
              (patches (list (local-file "patches/enable-graphics-offload.patch")))))
    (build-system meson-build-system)
    (native-inputs
     (list gettext-minimal
           (list glib "bin")
           gjs)) ; For glib-compile-schemas and shebang patching
    (inputs
     (list glib gtk gjs bash-minimal gst-plugins-base gst-plugins-good))
    (propagated-inputs
     (list gst-plugins-base
           gst-plugins-good
           gst-plugins-bad
           gst-plugins-ugly
           gst-libav))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-renderer
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (renderer (string-append out "/share/gnome-shell/extensions/hanabi-extension@jeffshee.github.io/renderer/renderer.js"))
                     (gi-typelib-path (getenv "GI_TYPELIB_PATH"))
                     (gst-plugin-path (getenv "GST_PLUGIN_SYSTEM_PATH")))
                (wrap-program renderer
                  `("GI_TYPELIB_PATH" = (,(or gi-typelib-path "")))
                  `("GST_PLUGIN_SYSTEM_PATH" = (,(or gst-plugin-path ""))))))))))
    (home-page "https://github.com/jeffshee/gnome-ext-hanabi")
    (synopsis "Live Wallpaper for GNOME")
    (description "Hanabi (fireworks) is a live wallpaper extension for GNOME Shell.
It supports playing video files as desktop wallpaper.")
    (license license:gpl3+)))