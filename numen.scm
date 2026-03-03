(define-module (numen)
  #:use-module (ice-9 ftw)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages man)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages commencement)
  #:use-module (dotool)
  #:use-module (vosk)
  #:export (go-github-com-m7shapan-njson
            go-github-com-mjibson-go-dsp-dsputils
            go-github-com-mjibson-go-dsp-fft
            go-github-com-mjibson-go-dsp-spectral
            go-github-com-mjibson-go-dsp-wav
            go-github-com-mjibson-go-dsp-window
            numen))

(define-public go-github-com-m7shapan-njson
  (package
    (name "go-github-com-m7shapan-njson")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/m7shapan/njson")
                    (commit "24542c60f3d352259c29439ab0c40d6ff5d9fe35")))
              (sha256
               (base32 "1mrkkfxarqxb2q5hz5jwdklbbxa483zq7hymda66njjiy9z13kcl"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/m7shapan/njson"))
    (native-inputs
     (list
      go-github-com-google-go-cmp))
    (propagated-inputs
     (list
      go-github-com-tidwall-gjson
      go-github-com-tidwall-pretty
      go-github-com-tidwall-match))
    (synopsis "Parse and query JSON data in Go")
    (description "This package provides Go functions for querying and
parsing JSON data by specifying paths.")
    (home-page "https://github.com/m7shapan/njson?tab=readme-ov-file")
    (license license:asl2.0)))

(define* (make-mjibson-go-dsp-package subdirectory
                                      #:key
                                      synopsis
                                      description
                                      (propagated-inputs '()))
  (package
    (name (string-append "go-github-com-mjibson-go-dsp-" subdirectory))
    (version "v0.0.0-20180508042940-11479a337f12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mjibson/go-dsp")
                    (commit "11479a337f1259210b7c8f93f7bf2b0cc87b066e")))
              (sha256
               (base32 "1zjw042j7j7m0hsv1wdv39rlv1sr54z156b0nrh9cd4wzzy9hmpk"))
              (modules '((guix build utils)
                         (ice-9 ftw)
                         (srfi srfi-1)))
              (snippet
               `(begin
                  (for-each delete-file-recursively
                            (remove (lambda (file)
                                      (member file (list "." ".." ,subdirectory)))
                                    (scandir ".")))
                  (copy-recursively (string-append ,subdirectory "/.")
                                    ".")
                  (delete-file-recursively ,subdirectory)))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path (string-append "github.com/mjibson/go-dsp/" subdirectory)))
    (propagated-inputs propagated-inputs)
    (synopsis synopsis)
    (description description)
    (home-page "https://pkg.go.dev/github.com/mjibson/go-dsp")
    (license license:isc)))

(define-public go-github-com-mjibson-go-dsp-dsputils
  (make-mjibson-go-dsp-package
   "dsputils"
   #:synopsis "Utility functions for digital signal processing in go"
   #:description "This package provides go functions that can be
useful when working with digital signal processing.  This includes
basic matrix support, zero padding of arrays, and complex number
conversion functions."))

(define-public go-github-com-mjibson-go-dsp-fft
  (make-mjibson-go-dsp-package
   "fft"
   #:propagated-inputs (list go-github-com-mjibson-go-dsp-dsputils)
   #:synopsis "Fast Fourier Transform functions in go"
   #:description "This package provides go functions for performing
Fast Fourier Transform and inverse fast Fast Fourier Transform.  It
also provides a function for performing convolution.  The functions
utilize multiple cores."))

(define-public go-github-com-mjibson-go-dsp-spectral
  (make-mjibson-go-dsp-package
   "spectral"
   #:synopsis "Spectral analysis functions in go"
   #:description "This package provides a go function for calculating
the power spectral density of a signal using Welch's method.  It also
provides a function for segmenting a signal with overlap."))

(define-public go-github-com-mjibson-go-dsp-wav
  (make-mjibson-go-dsp-package
   "wav"
   #:synopsis "WAV audio file format reading in go"
   #:description "This package provides go functions for reading WAV audio files.
8-bit PCM, 16-bit PCM and IEEE float formats are supported."))

(define-public go-github-com-mjibson-go-dsp-window
  (make-mjibson-go-dsp-package
   "window"
   #:propagated-inputs (list go-github-com-mjibson-go-dsp-dsputils)
   #:synopsis "Window functions for digital signal processing in go"
   #:description "This package provides go functions for creating
window functions and applying them to functions.  Supported window
types are Bartlett, Blackman, flat top, Hamming, Hann and rectangular."))

(define-public numen
  (let ((commit "b5c3976beeb9bc07b668c76373be7af005d937f5")
        (revision "1"))
    (package
      (name "numen")
      (version (git-version "0.7" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://git.sr.ht/~geb/numen")
                      (commit commit)))
                (sha256
                 (base32 "04718h5d8v43yg36v9hlicpmnsv8mcg0bnyhfhcdlw4y61x1236w"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "git.sr.ht/~geb/numen"
      #:install-source? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (vosk-model (assoc-ref inputs "vosk-model-small-en-us")))
                (with-directory-excursion "src/git.sr.ht/~geb/numen"
                  (invoke "go" "build" "-ldflags"
                          (string-append "-X 'main.Version=0.7' "
                                         "-X 'main.DefaultModelPaths=" vosk-model "' "
                                         "-X 'main.DefaultPhrasesDir=" out "/share/numen/phrases'"))))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (phrases (string-append out "/share/numen/phrases"))
                     (scripts (string-append out "/share/numen/scripts"))
                     (man1 (string-append out "/share/man/man1")))
                (with-directory-excursion "src/git.sr.ht/~geb/numen"
                  (install-file "numen" bin)
                  ;; numenc might not be built by go build if it's a separate main
                  ;; but usually go-build-system handles multiple mains.
                  ;; If it's just a script, we install it differently.
                  (if (file-exists? "numenc")
                      (install-file "numenc" bin))
                  (copy-recursively "phrases" phrases)
                  (copy-recursively "scripts" scripts)
                  (mkdir-p man1)
                  (invoke "sh" "-c" (string-append "scdoc < doc/numen.1.scd > " man1 "/numen.1"))))))
          (add-after 'patch-paths 'patch-arecord
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((arecord (search-input-file inputs "/bin/arecord")))
                (with-directory-excursion "src/git.sr.ht/~geb/numen"
                  (substitute* '("numen.go" "audio.go")
                    (("\"arecord\"") (string-append "\"" arecord "\"")))))))
          (add-after 'unpack 'patch-opt-version ; TODO: Send patch upstream
            (lambda _
              (with-directory-excursion "src/git.sr.ht/~geb/numen"
                (substitute* "numen.go" ; bumps opt version
                  (("opt\\.NewOptionSet") "opt.NewOptSet")))))
          (add-after 'patch-opt-version 'patch-paths
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (with-directory-excursion "src/git.sr.ht/~geb/numen"
                  (substitute* (append (find-files "scripts" "")
                                       (find-files "phrases" ".*\\.phrases"))
                    (("/etc/numen") (string-append out "/share/numen"))))))))))
    (native-inputs (list
                    scdoc
                    go-git-sr-ht-gb-opt
                    go-github-com-alphacep-vosk-api
                    go-github-com-m7shapan-njson
                    go-github-com-mjibson-go-dsp-fft
                    go-github-com-mjibson-go-dsp-wav
                    go-github-com-mjibson-go-dsp-window
                    pkg-config))
    (inputs (list alsa-utils libxkbcommon))
    (propagated-inputs (list dotool vosk-model-small-en-us))
    (synopsis "Control your computer using your voice")
    (description "Numen is voice control software letting you have
full control of a Linux machine without needing to type.  It helps
people who otherwise couldn't use their computers, and helps more
avoid hand strain.  Numen runs locally.")
    (home-page "https://numenvoice.org/")
    (license license:agpl3))))
