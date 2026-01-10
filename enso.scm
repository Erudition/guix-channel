(define-module (enso)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (nonguix build-system binary)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public enso
  (package
    (name "enso")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sxyazi/yazi/releases/download/v" version
             "/yazi-x86_64-unknown-linux-gnu.zip"))
       (file-name (string-append "yazi-" version ".zip"))
       (sha256
        (base32 "09mdfrlwx86k8fymxjjnxilxhwfp0g9vx452ybkqc8y4mjls2wxn"))))
    (build-system binary-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-before 'patchelf 'patchelf-writable
                    (lambda _
                      (for-each make-file-writable
                                '("ya" "yazi"))))
                  (replace 'install
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                        (install-file "yazi" bin)
                        (install-file "ya" bin)))))))
    (home-page "https://yazi-rs.github.io")
    (synopsis "Blazing fast terminal file manager written in Rust")
    (description "Yazi is a terminal file manager written in Rust,
based on async I/O. It aims to provide an efficient, user-friendly, and
customizable experience.")
    (license license:expat)))
