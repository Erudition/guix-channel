(define-module (curv)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages algebra) ; for eigen
  #:use-module (gnu packages graphics) ; for openexr
  #:use-module (gnu packages maths) ; for glm
  #:use-module (gnu packages gl) ; for mesa
  #:use-module (gnu packages image) ; for libpng
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages compression) ; for zlib
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg) ; for libxkbcommon
  #:use-module (gnu packages kde-frameworks) ; for extra-cmake-modules
  #:use-module (gnu packages freedesktop) ; for wayland
  #:use-module (gnu packages pkg-config))

(define curv-base
  (let ((commit "43387b6793d5e4950d348e4f82dc9d6496f68ae9")
        (revision "0"))
    (package
      (name "curv")
      (version (git-version "0.5" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://codeberg.org/doug-moen/curv")
               (commit commit)
               (recursive? #t)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1lrsbqdv3k8cv1pgd1lrrdanb6wp9y9hjjnjl5bmbr8gdcizrxci"))))
      (build-system cmake-build-system)
      (arguments
       (list
        #:configure-flags
        #~'("-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
            "-DLEAN_BUILD=1"
            "-DGLFW_BUILD_X11=ON"
            "-DGLFW_BUILD_WAYLAND=ON")
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'fix-boost-find
              (lambda _
                (substitute* "CMakeLists.txt"
                  ;; Remove system component as it is header-only in recent boost and causes issues
                  (("COMPONENTS iostreams system") "COMPONENTS iostreams")
                  ;; Remove target link
                  (("Boost::iostreams Boost::system") "Boost::iostreams")
                  ;; Fix tests working directory
                  (("WORKING_DIRECTORY ../tests") "WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/tests"))))
            (add-after 'unpack 'patch-glfw-libs
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((wayland (assoc-ref inputs "wayland"))
                      (xkb (assoc-ref inputs "libxkbcommon"))) 
                  (when (and wayland xkb)
                    (substitute* "extern/glfw/src/wl_init.c"
                      (("libwayland-client\\.so\\.0")
                       (string-append wayland "/lib/libwayland-client.so.0"))
                      (("libwayland-cursor\\.so\\.0")
                       (string-append wayland "/lib/libwayland-cursor.so.0"))
                      (("libwayland-egl\\.so\\.1")
                       (string-append wayland "/lib/libwayland-egl.so.1"))
                      (("libxkbcommon\\.so\\.0")
                       (string-append xkb "/lib/libxkbcommon.so.0"))))))))
        #:tests? #f))
      (native-inputs (list pkg-config))
      (inputs (list boost
                    eigen
                    glm
                    libpng
                    mesa
                    openexr
                    tbb
                    zlib
                    ;; X11
                    libx11
                    libxrandr
                    libxinerama
                    libxcursor
                    libxi
                    ;; Wayland
                    wayland
                    wayland-protocols
                    libxkbcommon
                    extra-cmake-modules))
      (home-page "https://codeberg.org/doug-moen/curv")
      (synopsis "2D and 3D geometric modelling language")
      (description
       "Curv is a programming language for creating art using mathematics.
It's a 2D and 3D geometric modelling tool that supports 3D printing.")
      (license license:asl2.0))))

(define-public curv-x11
  (package
    (inherit curv-base)
    (name "curv-x11")
    (arguments
     (substitute-keyword-arguments (package-arguments curv-base)
       ((#:configure-flags flags '())
        #~'("-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
            "-DLEAN_BUILD=1"
            "-DGLFW_BUILD_X11=ON"
            "-DGLFW_BUILD_WAYLAND=OFF"))))
    (inputs (modify-inputs (package-inputs curv-base)
              (delete "wayland" "wayland-protocols" "libxkbcommon" "extra-cmake-modules")))))

(define-public curv-wayland
  (package
    (inherit curv-base)
    (name "curv-wayland")
    (arguments
     (substitute-keyword-arguments (package-arguments curv-base)
       ((#:configure-flags flags '())
        #~'("-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
            "-DLEAN_BUILD=1"
            "-DGLFW_BUILD_X11=OFF"
            "-DGLFW_BUILD_WAYLAND=ON"))))
    (inputs (modify-inputs (package-inputs curv-base)
              (delete "libx11" "libxrandr" "libxinerama" "libxcursor" "libxi")))))

(define-public curv
  (package
    (inherit curv-base)
    (name "curv")))

curv