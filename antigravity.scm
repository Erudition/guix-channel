(define-module (antigravity)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages base)     ; glibc
  #:use-module (gnu packages bash)     ; bash-minimal
  #:use-module (gnu packages cups)
  #:use-module (gnu packages elf)      ; patchelf
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)       ; mesa
  #:use-module (gnu packages glib)     ; glib, dbus
  #:use-module (gnu packages gnome)    ; at-spi2-core
  #:use-module (gnu packages gtk)      ; gtk+, cairo, pango, gdk-pixbuf
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)    ; alsa-lib, eudev
  #:use-module (gnu packages nss)      ; nss, nspr
  #:use-module (gnu packages xdisorg)  ; libdrm, libxkbcommon
  #:use-module (gnu packages xorg)     ; libx..., libxkbfile
  #:use-module (gnu packages xml)      ; expat
  #:use-module (guix utils))

(define-public antigravity
  (package
    (name "antigravity")
    (version "1.13.3-4533425205018624")
    (source (origin
              (method url-fetch)
              (uri "https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/1.13.3-4533425205018624/linux-x64/Antigravity.tar.gz")
              (sha256
               (base32
                "0j004yxhx4dmj35sr1cmybm0zf68xrwscyxdlcx3d6q4y7nznk88"))))
    (build-system copy-build-system)
    (arguments
     `(#:install-plan
       '(("." "share/antigravity"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'cd-to-source
           (lambda _
             (let ((source-dir (car (find-files ".." (lambda (file stat)
                                                       (string-suffix? "/antigravity" file))
                                               #:directories? #f))))
               (chdir (dirname source-dir))
               #t)))
         (add-after 'install 'install-desktop-file
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (share (string-append out "/share"))
                    (applications (string-append share "/applications"))
                    (icons (string-append share "/icons/hicolor/scalable/apps"))
                    (icon-src (string-append share "/antigravity/resources/app/out/vs/platform/browserOnboarding/static/antigravity.svg")))
               (mkdir-p applications)
               (mkdir-p icons)
               (copy-file icon-src (string-append icons "/antigravity.svg"))
               (with-output-to-file (string-append applications "/antigravity.desktop")
                 (lambda _
                   (display "[Desktop Entry]\nName=Google Antigravity\nComment=Google Antigravity Desktop Application\nExec=antigravity\nIcon=antigravity\nType=Application\nCategories=Development;TextEditor;\n")))
               #t)))
         (add-after 'install-desktop-file 'create-wrapper
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (real-bin (string-append out "/share/antigravity/antigravity")))
               (mkdir-p bin)
               (with-output-to-file (string-append bin "/antigravity")
                 (lambda _
                   (display "#") (display "!")
                   (display (assoc-ref inputs "bash-minimal"))
                   (display "/bin/bash\n")
                   (display "exec \"") (display real-bin) (display "\" \"$@\" --disable-gpu\n")))
               (chmod (string-append bin "/antigravity") #o755)
               #t)))
         (add-after 'create-wrapper 'fix-keymapping-path
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (keymap-dir (string-append out "/share/antigravity/resources/app/node_modules/native-keymap/build")))
               (mkdir-p (string-append keymap-dir "/Debug"))
               (symlink (string-append keymap-dir "/Release/keymapping.node")
                        (string-append keymap-dir "/Debug/keymapping.node"))
               #t)))
         (add-after 'fix-keymapping-path 'manual-patch-all
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (share (string-append out "/share/antigravity"))
                    (patchelf (string-append (assoc-ref inputs "patchelf") "/bin/patchelf"))
                    (glibc (assoc-ref inputs "glibc"))
                    (ld.so (string-append glibc "/lib/ld-linux-x86-64.so.2"))
                    (rpath (string-join
                            (list "$ORIGIN"
                                  share
                                  (string-append (assoc-ref inputs "alsa-lib") "/lib")
                                  (string-append (assoc-ref inputs "at-spi2-core") "/lib")
                                  (string-append (assoc-ref inputs "cairo") "/lib")
                                  (string-append (assoc-ref inputs "cups") "/lib")
                                  (string-append (assoc-ref inputs "dbus") "/lib")
                                  (string-append (assoc-ref inputs "eudev") "/lib")
                                  (string-append (assoc-ref inputs "expat") "/lib")
                                  (string-append (assoc-ref inputs "gdk-pixbuf") "/lib")
                                  (string-append (assoc-ref inputs "glib") "/lib")
                                  (string-append (assoc-ref inputs "gtk+") "/lib")
                                  (string-append (assoc-ref inputs "libdrm") "/lib")
                                  (string-append (assoc-ref inputs "libx11") "/lib")
                                  (string-append (assoc-ref inputs "libxcb") "/lib")
                                  (string-append (assoc-ref inputs "libxcomposite") "/lib")
                                  (string-append (assoc-ref inputs "libxcursor") "/lib")
                                  (string-append (assoc-ref inputs "libxdamage") "/lib")
                                  (string-append (assoc-ref inputs "libxext") "/lib")
                                  (string-append (assoc-ref inputs "libxfixes") "/lib")
                                  (string-append (assoc-ref inputs "libxi") "/lib")
                                  (string-append (assoc-ref inputs "libxkbcommon") "/lib")
                                  (string-append (assoc-ref inputs "libxkbfile") "/lib")
                                  (string-append (assoc-ref inputs "libxrandr") "/lib")
                                  (string-append (assoc-ref inputs "libxrender") "/lib")
                                  (string-append (assoc-ref inputs "libxscrnsaver") "/lib")
                                  (string-append (assoc-ref inputs "libxtst") "/lib")
                                  (string-append (assoc-ref inputs "mesa") "/lib")
                                  (string-append (assoc-ref inputs "mesa") "/lib/dri")
                                  (string-append (assoc-ref inputs "mesa") "/lib/vulkan")
                                  (string-append (assoc-ref inputs "nspr") "/lib")
                                  (string-append (assoc-ref inputs "nss") "/lib")
                                  (string-append (assoc-ref inputs "nss") "/lib/nss")
                                  (string-append (assoc-ref inputs "pango") "/lib")
                                  (string-append (assoc-ref inputs "gcc-lib") "/lib")
                                  (string-append glibc "/lib"))
                            ":")))
               (for-each 
                 (lambda (file)
                   (when (elf-file? file)
                     (let ((has-interp? (zero? (system* patchelf "--print-interpreter" file))))
                       (when has-interp?
                         (invoke patchelf "--set-interpreter" ld.so file)))
                     (invoke patchelf "--set-rpath" rpath file)))
                 (find-files share))
               #t))))))
    (native-inputs
     `(("patchelf" ,patchelf)))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("at-spi2-core" ,at-spi2-core)
       ("bash-minimal" ,bash-minimal)
       ("cairo" ,cairo)
       ("cups" ,cups)
       ("dbus" ,dbus)
       ("eudev" ,eudev)
       ("expat" ,expat)
       ("gdk-pixbuf" ,gdk-pixbuf)
       ("glib" ,glib)
       ("glibc" ,glibc)
       ("gcc-lib" ,gcc "lib")
       ("gtk+" ,gtk+)
       ("libdrm" ,libdrm)
       ("libx11" ,libx11)
       ("libxcb" ,libxcb)
       ("libxcomposite" ,libxcomposite)
       ("libxcursor" ,libxcursor)
       ("libxdamage" ,libxdamage)
       ("libxext" ,libxext)
       ("libxfixes" ,libxfixes)
       ("libxi" ,libxi)
       ("libxkbcommon" ,libxkbcommon)
       ("libxkbfile" ,libxkbfile)
       ("libxrandr" ,libxrandr)
       ("libxrender" ,libxrender)
       ("libxscrnsaver" ,libxscrnsaver)
       ("libxtst" ,libxtst)
       ("mesa" ,mesa)
       ("nspr" ,nspr)
       ("nss" ,nss)
       ("pango" ,pango)))
    (home-page "https://google.com")
    (synopsis "Google Antigravity")
    (description "Google Antigravity Desktop Application.")
    (license license:expat)))