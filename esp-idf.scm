(define-module (esp-idf)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages python))

(define-public esp-idf-source
  (package
    (name "esp-idf")
    (version "6.1-dev")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/espressif/esp-idf.git")
                    (commit "b90730f433f60b62e7d3a418db7ed0b0ac621406")
                    (recursive? #t)))
              (sha256
               (base32
                "0rchbksf5k5phh5p3ij59wmwi4ngi8yfby91dzhl1w026ca23gr6")))) ; Updated hash
    (build-system copy-build-system)
    (arguments
     `(#:install-plan
       '(("." "share/esp-idf"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'symlink-bin
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (mkdir-p bin)
               (symlink (string-append out "/share/esp-idf/tools/idf.py")
                        (string-append bin "/idf.py"))
               #t))))))
    (native-search-paths
     (list (search-path-specification
            (variable "IDF_PATH")
            (files '("share/esp-idf")))))
    (home-page "https://github.com/espressif/esp-idf")
    (synopsis "Development framework for Espressif SoCs")
    (description "ESP-IDF is the official development framework for the ESP32 series of SoCs. This package provides the source and idf.py tool.")
    (license license:asl2.0)))
