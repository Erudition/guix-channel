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
                  (add-after 'install 'install-completions
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((share (string-append (assoc-ref outputs "out")
                                                   "/share"))
                             (bash (string-append share
                                    "/bash-completion/completions"))
                             (zsh (string-append share
                                                 "/zsh/vendor_completions")))
                        (mkdir-p bash)
                        (mkdir-p zsh)
                        (copy-file "completions/ya.bash"
                                   (string-append bash "/ya"))
                        (copy-file "completions/yazi.bash"
                                   (string-append bash "/yazi"))
                        (copy-file "completions/_ya"
                                   (string-append zsh "/_ya"))
                        (copy-file "completions/_yazi"
                                   (string-append zsh "/_yazi"))))))
       #:patchelf-plan `(("ya" ("gcc:lib" "glibc"))
                         ("yazi" ("gcc:lib" "glibc")))
       #:install-plan `(("ya" "bin/")
                        ("yazi" "bin/"))))
    (native-inputs (list unzip))
    (inputs `(("gcc:lib" ,gcc "lib")
              ("glibc" ,glibc)))
    (supported-systems '("x86_64-linux"))
    (synopsis
     "Blazing fast terminal file manager written in Rust, based on async I/O")
    (description
     "Yazi is a terminal file manager written in Rust, based on non-blocking async I/O. It aims to provide an efficient, user-friendly, and customizable file management experience.")
    (home-page "https://yazi-rs.github.io/")
    (license license:expat)))