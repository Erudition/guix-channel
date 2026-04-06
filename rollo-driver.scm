(define-module (rollo-driver)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages pkg-config))

(define-public rollo-driver
  (package
    (name "rollo-driver")
    (version "1.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rollo-main.b-cdn.net/driver-dl/linux/rollo-cups-driver-"
                                  version ".tar.gz"))
              (sha256
               (base32 "0p8vq2j31fsc4jfgigkkjryw6siqrvazkidiaphwpr9nfvj7zbdz"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CUPS_SERVERBIN=" #$output "/lib/cups")
              (string-append "CUPS_DATADIR=" #$output "/share/cups"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-configure
            (lambda _
              (substitute* "configure"
                (("/usr/bin/rm") "rm"))))
          (add-after 'install 'patch-ppd
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (filter (string-append out "/lib/cups/filter/rastertorollo")))
                (substitute* (find-files (string-append out "/share/cups/model")
                                         "\\.ppd$")
                  (("rastertorollo")
                   filter))))))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list cups))
    (synopsis "CUPS printer driver for Rollo label printers")
    (description "This package provides the CUPS printer driver for the Rollo X1038
label printer.")
    (home-page "https://www.rollo.com/")
    (license license:gpl3+)))
