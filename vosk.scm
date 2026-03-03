(define-module (vosk)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system go)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages compression)
  #:export (go-github-com-alphacep-vosk-api
            vosk-model-small-en-us))

(define-public go-github-com-alphacep-vosk-api
  (package
    (inherit vosk-api)
    (name "go-github-com-alphacep-vosk-api")
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/alphacep/vosk-api/go"
      #:unpack-path "github.com/alphacep/vosk-api"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'from-api-to-abi
            (lambda* (#:key inputs #:allow-other-keys)
              (with-directory-excursion "src/github.com/alphacep/vosk-api/go"
                (substitute* "vosk.go"
                  (("\\$\\{SRCDIR\\}/\\.\\./src")
                   (string-append (assoc-ref inputs "vosk-api") "/src")))))))))
    (propagated-inputs (list vosk-api))))

(define-public vosk-model-small-en-us
  (package
    (name "vosk-model-small-en-us")
    (version "0.15")
    (source (origin
              (method url-fetch)
              (uri "https://alphacephei.com/vosk/models/vosk-model-small-en-us-0.15.zip")
              (file-name "vosk-model-small-en-us-0.15.zip")
              (sha256
               (base32 "1614jj01gx4zz5kq6fj2lclwp1m6swnk1js2isa9yi7bqi165wih"))))
    (build-system copy-build-system)
    (inputs (list unzip))
    (synopsis "Lightweight english speech recognition model for Vosk-API")
    (description "40 megabyte large english speech recognition model
that is compatible with Vosk-API.")
    (home-page "https://alphacephei.com")
    (license license:asl2.0)))
