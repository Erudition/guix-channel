(define-module (monit)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages crypto)) ; for libxcrypt

(define-public monit
  (package
    (name "monit")
    (version "5.35.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://bitbucket.org/tildeslash/monit.git")
               (commit (string-append "release-" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0nxmvfsbsin6pfq5iy80fx11k8rz576xvdz2c2j07h9nw3306rj6"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--without-pam"
                   (string-append "--with-ssl-incl-dir="
                                  #$(this-package-input "openssl") "/include")
                   (string-append "--with-ssl-lib-dir="
                                  #$(this-package-input "openssl") "/lib"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'patch-bootstrap
                 (lambda _
                   (substitute* "bootstrap"
                     (("./bootstrap") "sh ./bootstrap")))))))
    (inputs
     (list zlib openssl libxcrypt))
    (native-inputs
     (list autoconf automake libtool pkg-config bison flex perl))
    (home-page "https://mmonit.com")
    (synopsis "Pro-active monitoring utility")
    (description "Monit is a small Open Source utility for managing and monitoring
Unix systems. Monit conducts automatic maintenance and repair and can execute
meaningful causal actions in error situations.")
    (license license:agpl3+)))
