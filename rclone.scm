(define-module (rclone)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages)
  #:use-module (guix build-system go)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp))

(define-public rclone-deps
    (hidden-package
        (package
            (name "rclone-deps")
            (version "1.69.1")
            (source
                (origin
                    (method url-fetch)
                    (uri (string-append "https://github.com/rclone/rclone/releases/download/"
                                "v" version "/rclone-v" version "-vendor.tar.gz"))
                    (sha256
                        (base32 "0fj8ym5rrwidzb4lkkxlz76nx95cvwxrapf0apmwbnd6lzcwb7qh"))))
            (build-system copy-build-system)
            (arguments
                '(#:install-plan
                    '( ("vendor" "src") )
                )
            )
            (synopsis "rclone dependencies (vendor)")
            (description "This package provides the vendored dependencies for rclone.")
            (home-page "https://rclone.org/")
            (license license:expat)
        )
    )
)

(define-public rclone
    (package
        (name "rclone")
        (version "1.69.1")
        (source
        (origin
        (method url-fetch)
        (uri (string-append "https://github.com/rclone/rclone/releases/download/"
                            "v" version "/rclone-v" version ".tar.gz"))
        (sha256
            (base32 "08h7drw4hsin1avfwv9fg3228ci7l6qzgym7ad0v3588bjkhzsh2"))))
        (build-system go-build-system)
        (arguments
            (list
            #:import-path "github.com/rclone/rclone"
            #:install-source? #f
            #:test-subdirs #~(list ".")
            #:phases
                #~(modify-phases %standard-phases
                    (add-before 'build 'add-vendor
                        (lambda* (#:key inputs #:allow-other-keys)
                          (let ((vendor (search-input-directory inputs "src")))
                            (setenv "GOPATH" (string-append vendor ":" (getenv "GOPATH"))))
                        )
                    )
                )
            )
        )
        (native-inputs
            (list rclone-deps))
        (synopsis "@code{rsync} for cloud storage")
        (description "@code{Rclone} is a command line program to sync files and
    directories to and from different cloud storage providers.

    Features include:
    @itemize
    @item MD5/SHA1 hashes checked at all times for file integrity
    @item Timestamps preserved on files
    @item Partial syncs supported on a whole file basis
    @item Copy mode to just copy new/changed files
    @item Sync (one way) mode to make a directory identical
    @item Check mode to check for file hash equality
    @item Can sync to and from network, e.g., two different cloud accounts
    @item Optional encryption (Crypt)
    @item Optional cache (Cache)
    @item Optional FUSE mount (rclone mount)
    @end itemize")
        (home-page "https://rclone.org/")
        (license license:expat)
    )
)
