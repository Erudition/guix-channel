(define-module (terosubtitler)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pascal)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages hunspell)
  #:use-module (gnu packages ocr)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages base)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public lazarus-bgrabitmap
  (package
    (name "lazarus-bgrabitmap")
    (version "11.6.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bgrabitmap/bgrabitmap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
                  (sha256
                   (base32
                    "0l0nbq67bspw5yr1qb7vlqfyl27s6r05imcl45j6xbnjisz2s3vc"))))
              
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/bgrabitmap")))
                (copy-recursively "." out)))))))
    (native-inputs (list lazarus fpc))
    (home-page "https://github.com/bgrabitmap/bgrabitmap")
    (synopsis "Drawing library for Lazarus")
    (description "BGRABitmap is a library to modify and create images with
transparency (alpha channel).")
    (license license:bsd-3)))

(define-public lazarus-encconv
  (package
    (name "lazarus-encconv")
    (version "8caaa6b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Alexey-T/EncConv")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0w6bch17x0n99yynw98v4fj16ln37vghwn70qi7jnw9f3qxdr7kp"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/encconv")))
                (copy-recursively "." out)))))))
    (native-inputs (list lazarus fpc))
    (home-page "https://github.com/Alexey-T/EncConv")
    (synopsis "Encoding conversion library for Lazarus")
    (description "EncConv is a library for converting text between different encodings.")
    (license license:mpl2.0)))

(define-public lazarus-atflatcontrols
  (package
    (name "lazarus-atflatcontrols")
    (version "fef6bbc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Alexey-T/ATFlatControls")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0l1qfky1nmymmhyrwwm7ym6i21p55z6iijwv5wddsscxbl3hy624"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/atflatcontrols")))
                (copy-recursively "." out)))))))
    (native-inputs (list lazarus fpc))
    (home-page "https://github.com/Alexey-T/ATFlatControls")
    (synopsis "Flat UI controls for Lazarus")
    (description "ATFlatControls contains various flat UI components for Lazarus.")
    (license license:mpl2.0)))

(define-public lazarus-atsynedit
  (package
    (name "lazarus-atsynedit")
    (version "2026.01.05")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Alexey-T/ATSynEdit")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "06f67rzhfrcmw2gc4yh9rfvr7g291nqnvx6ladp6phkar4116jfw"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-after 'unpack 'patch-gtk2-im
            (lambda _
              (substitute* "atsynedit/atsynedit_adapter_ime_gtk2.pas"
                (("IM_Context_Set_Cursor_Pos")
                 "//IM_Context_Set_Cursor_Pos"))))
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/atsynedit")))
                (copy-recursively "." out)))))))
    (native-inputs (list lazarus fpc))
    (propagated-inputs (list lazarus-bgrabitmap lazarus-encconv lazarus-atflatcontrols))
    (home-page "https://github.com/Alexey-T/ATSynEdit")
    (synopsis "Advanced SynEdit component for Lazarus")
    (description "ATSynEdit is a control to edit text, with syntax highlighting.")
    (license license:mpl1.1)))

(define-public lazarus-fpspreadsheet
  (package
    (name "lazarus-fpspreadsheet")
    (version "2025.02.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/veb86/fpspreadsheet")
                    (commit "77ea2a5ee83f61e1bb0206a5863156a458608992")))
              (file-name (git-file-name name version))
                  (sha256
                   (base32
                    "1lamq1l36bm9kiysx805kp11i3w4nvb8sy4ymckhsdlh4dfr0yp0"))))
              
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/fpspreadsheet")))
                (copy-recursively "." out)))))))
    (native-inputs (list lazarus fpc))
    (home-page "https://github.com/veb86/fpspreadsheet")
    (synopsis "Spreadsheet library for Lazarus")
    (description "fpSpreadsheet is a library for reading and writing spreadsheet
files.")
    (license license:lgpl2.1+)))

(define %terosubtitler-source
  (local-file "../../Gemini_Projects/TeroSubtitler"
              "terosubtitler-checkout"
              #:recursive? #t))

(define-public lazarus-uw-bluray-pgs-parser
  (package
    (name "lazarus-uw-bluray-pgs-parser")
    (version "1.0.2.0-commit-7417e00")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/URUWorks/UW_BlurayPGSParser")
                    (commit "7417e00faf5dd19332755a1cf0e3f00a13c6ef6c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0vvgss75b2d5qh24xcwayjix1fphds5dyz5is2k8nzcmiazfinlv"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/uw-bluray-pgs-parser")))
                (copy-recursively "." out)))))))
    (native-inputs (list lazarus fpc))
    (propagated-inputs (list lazarus-bgrabitmap))
    (home-page "https://github.com/URUWorks/UW_BlurayPGSParser")
    (synopsis "Blu-ray PGS subtitle parser")
    (description "UW_BlurayPGSParser is a library to parse Blu-ray PGS subtitles.")
    (license license:mpl2.0)))

(define-public lazarus-uw-mpv-player
  (package
    (name "lazarus-uw-mpv-player")
    (version "1.0.2.0-commit-6aecabb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/URUWorks/UW_MPVPlayer")
                    (commit "6aecabb9a68938e57905cbbafc2becf7ecfc54ca")))
              (file-name (git-file-name name version))
                  (sha256
                   (base32
                    "1ywwj6shp37ynrlbfdvqb5mbcc0xr1911s1z9dc3qr3h2a07zpfg"))))
              
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/uw-mpv-player")))
                (copy-recursively "." out)))))))
    (native-inputs (list lazarus fpc))
    (inputs (list mpv))
    (home-page "https://github.com/URUWorks/UW_MPVPlayer")
    (synopsis "MPV player component for Lazarus")
    (description "UW_MPVPlayer is a component to integrate MPV player into
Lazarus applications.")
    (license license:mpl2.0)))

(define-public lazarus-uw-common
  (package
    (name "lazarus-uw-common")
    (version "1.0.2.0")
    (source %terosubtitler-source)
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/uw-common")))
                (copy-recursively "TeroSubtitler/common" out)))))))
    (native-inputs (list lazarus fpc))
    (home-page "https://github.com/URUWorks/TeroSubtitler")
    (synopsis "Common units for URUWorks projects")
    (description "UWCommon contains shared Pascal units used by various URUWorks projects.")
    (license license:mpl2.0)))

(define-public lazarus-uw-subtitle-api
  (package
    (name "lazarus-uw-subtitle-api")
    (version "1.0.2.0")
    (source %terosubtitler-source)
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/subtitle-api")))
                (copy-recursively "TeroSubtitler/subtitleapi" out)))))))
    (native-inputs (list lazarus fpc))
    (propagated-inputs (list lazarus-fpspreadsheet lazarus-uw-common))
    (home-page "https://github.com/URUWorks/TeroSubtitler")
    (synopsis "Subtitle API for Lazarus")
    (description "SubtitleAPI is a library for handling various subtitle formats.")
    (license license:mpl2.0)))

(define-public lazarus-uw-tero-controls
  (package
    (name "lazarus-uw-tero-controls")
    (version "1.0.2.0")
    (source %terosubtitler-source)
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (string-append #$output "/share/lazarus/components/tero-controls")))
                (copy-recursively "TeroSubtitler/controls" out)))))))
    (native-inputs (list lazarus fpc))
    (propagated-inputs (list lazarus-bgrabitmap lazarus-uw-common lazarus-uw-subtitle-api))
    (home-page "https://github.com/URUWorks/TeroSubtitler")
    (synopsis "UI controls for TeroSubtitler")
    (description "TeroControls contains custom UI components for TeroSubtitler.")
    (license license:mpl2.0)))

(define-public terosubtitler
  (package
    (name "terosubtitler")
    (version "1.0.2.0")
    (source %terosubtitler-source)
    (build-system gnu-build-system)
    (arguments
     (list
      #:modules `((srfi srfi-1)
                  ,@%default-gnu-imported-modules)
      #:tests? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (add-after 'unpack 'unpack-submodules
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-recursively (assoc-ref inputs "uw-bluray-pgs-parser-src")
                                "use/UW_BlurayPGSParser")
              (copy-recursively (assoc-ref inputs "uw-mpv-player-src")
                                "use/UW_MPVPlayer")))
          (add-after 'unpack-submodules 'patch-lfm
            (lambda _
              (for-each (lambda (lfm)
                          (format #t "Patching ~a...~%" lfm)
                          (substitute* lfm
                            (("^.*SnapOptions.*$") "")))
                        (find-files "." "\\.lfm$"))))
          (add-before 'build 'setup-lazarus
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "HOME" (getcwd))
              (let ((lazarus-dir (search-input-directory inputs "share/lazarus")))
                ;; Prepare library paths for the linker and inject into the main project
                (let* ((lib-dirs (filter-map (lambda (input)
                                               (let ((path (cdr input)))
                                                 (let ((lib (string-append path "/lib")))
                                                   (if (and (string? path) (file-exists? lib)) lib #f))))
                                             inputs))
                       (lib-path (string-join lib-dirs ";")))
                  (substitute* "TeroSubtitler/src/tero.lpi"
                    (("<SearchPaths>")
                     (string-append "<SearchPaths>\n        <Libraries Value=\"" lib-path "\"/>"))))

                (mkdir-p "lib-src")
                (for-each (lambda (label)
                            (let ((path (assoc-ref inputs label)))
                              (when path
                                (let ((dest (string-append "lib-src/" label)))
                                  (copy-recursively path dest)
                                  ;; Clean old build artifacts to force consistent source build
                                  (for-each (lambda (f) (when (file-exists? f) (delete-file f)))
                                            (find-files dest "\\.(ppu|o|a)$"))))))
                          '("lazarus-bgrabitmap" "lazarus-atsynedit" "lazarus-fpspreadsheet"
                            "lazarus-encconv" "lazarus-atflatcontrols"))

                ;; Robust search path injection for all project and package files
                (let* ((all-pas-dirs (delete-duplicates (map dirname (find-files (getcwd) "\\.pas$"))))
                       (all-inc-dirs (delete-duplicates (map dirname (find-files (getcwd) "\\.inc$"))))
                       (pas-path (string-join all-pas-dirs ";"))
                       (inc-path (string-join (append all-inc-dirs all-pas-dirs) ";")))
                  (for-each (lambda (file)
                              (substitute* file
                                (("<SearchPaths>")
                                 (string-append "<SearchPaths>\n"
                                                "        <OtherUnitFiles Value=\"" pas-path "\"/>\n"
                                                "        <IncludeFiles Value=\"$(ProjOutDir);" inc-path "\"/>"))))
                            (find-files (getcwd) "\\.lp[ki]$")))

                ;; Register all components
                (for-each (lambda (lpk)
                            (invoke "lazbuild" (string-append "--lazarusdir=" lazarus-dir)
                                    "--add-package-link" lpk))
                          (append
                           (find-files "lib-src" "\\.lpk$")
                           (find-files "use" "\\.lpk$")
                           (list "TeroSubtitler/common/uwcommon.lpk"
                                 "TeroSubtitler/subtitleapi/subtitleapi.lpk"
                                 "TeroSubtitler/controls/terocontrols.lpk")))

                ;; Tiered build in correct dependency order
                (let ((build-lpk (lambda (lpk)
                                   (invoke "lazbuild" (string-append "--lazarusdir=" lazarus-dir) lpk))))
                  (for-each build-lpk (find-files "lib-src/lazarus-bgrabitmap" "bgrabitmappack\\.lpk$"))
                  (for-each build-lpk (find-files "lib-src/lazarus-bgrabitmap" "bglcontrols\\.lpk$"))
                  (for-each build-lpk (find-files "lib-src/lazarus-encconv" "encconv_package\\.lpk$"))
                  (for-each build-lpk (find-files "lib-src/lazarus-atflatcontrols" "atflatcontrols_package\\.lpk$"))
                  (for-each build-lpk (find-files "lib-src/lazarus-fpspreadsheet" "laz_fpspreadsheet\\.lpk$"))
                  (build-lpk "TeroSubtitler/common/uwcommon.lpk")
                  (for-each build-lpk (find-files "lib-src/lazarus-atsynedit" "atsynedit_package\\.lpk$"))
                  (build-lpk "TeroSubtitler/subtitleapi/subtitleapi.lpk")
                  (build-lpk "TeroSubtitler/controls/terocontrols.lpk")
                  (for-each build-lpk (find-files "use" "\\.lpk$"))))))
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((lazarus-dir (search-input-directory inputs "share/lazarus")))
                (invoke "lazbuild" (string-append "--lazarusdir=" lazarus-dir)
                        "--build-mode=Release"
                        "TeroSubtitler/src/tero.lpi"))))
          (replace 'install
            (lambda* (#:key outputs inputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (share (string-append out "/share/terosubtitler")))
                (mkdir-p bin)
                (copy-file "TeroSubtitler/bin/tero" (string-append bin "/terosubtitler"))
                (chmod (string-append bin "/terosubtitler") #o755)
                (mkdir-p share)
                (copy-recursively "TeroSubtitler/bin/CustomFormat" (string-append share "/CustomFormat"))
                (copy-recursively "TeroSubtitler/bin/Languages" (string-append share "/Languages"))
                (copy-recursively "TeroSubtitler/bin/OCR" (string-append share "/OCR"))
                (copy-recursively "TeroSubtitler/bin/ShortCuts" (string-append share "/ShortCuts")))))
          (add-after 'install 'wrap
            (lambda* (#:key outputs inputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/terosubtitler"))
                     (lib-dirs (filter-map (lambda (input)
                                               (let ((path (cdr input)))
                                                 (let ((lib (string-append path "/lib")))
                                                   (if (and (string? path) (file-exists? lib)) lib #f))))
                                             inputs))
                     (ffmpeg (assoc-ref inputs "ffmpeg"))
                     (mpv (assoc-ref inputs "mpv"))
                     (tesseract-ocr (assoc-ref inputs "tesseract-ocr"))
                     (ytdlp (assoc-ref inputs "yt-dlp"))
                     (whisper-cpp (assoc-ref inputs "whisper-cpp")))
                (wrap-program bin
                  `("PATH" ":" prefix (,(string-append ffmpeg "/bin")
                                       ,(string-append mpv "/bin")
                                       ,(string-append tesseract-ocr "/bin")
                                       ,(string-append ytdlp "/bin")
                                       ,(string-append whisper-cpp "/bin")))
                  `("LD_LIBRARY_PATH" ":" prefix ,lib-dirs))))))))
    (native-inputs
     `(("lazarus" ,lazarus)
       ("fpc" ,fpc)
       ("pkg-config" ,pkg-config)
       ("uw-bluray-pgs-parser-src"
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/URUWorks/UW_BlurayPGSParser")
                 (commit "7417e00faf5dd19332755a1cf0e3f00a13c6ef6c")))
           (file-name "uw-bluray-pgs-parser-src-checkout")
           (sha256
            (base32
             "0vvgss75b2d5qh24xcwayjix1fphds5dyz5is2k8nzcmiazfinlv"))))
       ("uw-mpv-player-src"
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/URUWorks/UW_MPVPlayer")
                 (commit "6aecabb9a68938e57905cbbafc2becf7ecfc54ca")))
           (file-name "uw-mpv-player-src-checkout")
           (sha256
            (base32
             "1ywwj6shp37ynrlbfdvqb5mbcc0xr1911s1z9dc3qr3h2a07zpfg"))))))
    (inputs
     (list lazarus-bgrabitmap
           lazarus-atsynedit
           lazarus-encconv
           lazarus-atflatcontrols
           lazarus-fpspreadsheet
           mesa
           glu
           libx11
           gtk+-2
           gdk-pixbuf
           pango
           cairo
           atk
           glib
           mpv
           ffmpeg
           tesseract-ocr
           yt-dlp
           whisper-cpp
           hunspell
           openssl))
    (home-page "https://github.com/URUWorks/TeroSubtitler")
    (synopsis "Modern and open source subtitle editor")
    (description "Tero Subtitler is a modern subtitle editor with advanced features
like audio to text, translation, and more.")
    (license license:mpl2.0)))
