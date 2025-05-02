(use-modules (guix packages) (guix download) (guix build-system font) ((guix licenses) #:prefix license:))

(package
   (name "font-nerd-fonts-fira-code")
   (version "2.1.0")
   (source
    (origin
     (method url-fetch)
     (uri
      (string-append
       "https://github.com/ryanoasis/nerd-fonts/releases/download/v"
       version
       "/FiraCode.zip"))
     (sha256
      (base32
       "1rx7zrkq0584k6hrh6dx30xrnz5nq379xyw73pfd4gxaxnh9mpi1"))))
   (build-system font-build-system)
   (arguments
    `(#:phases
      (modify-phases %standard-phases
        (add-before 'install 'make-files-writable
          (lambda _
            (for-each
             make-file-writable
             (find-files "." ".*\\.(otf|otc|ttf|ttc)$"))
            #t)))))
   (home-page "https://www.nerdfonts.com/")
   (synopsis "Nerd fonts variant of FiraCode font")
   (description
    "Nerd fonts variant of FiraCode font.  Nerd Fonts is a project that patches
developer targeted fonts with a high number of glyphs (icons).  Specifically to
add a high number of extra glyphs from popular 'iconic fonts' such as Font
Awesome, Devicons, Octicons, and others.")
   (license license:silofl1.1))
