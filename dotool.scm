(define-module (dotool)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system go)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages man)
  #:use-module (gnu packages commencement)
  #:export (go-git-sr-ht-gb-opt
            go-github-com-bendahl-uinput
            dotool))

(define-public go-git-sr-ht-gb-opt
  (package
    (name "go-git-sr-ht-gb-opt")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~geb/opt")
                    (commit "e72225a1933c18341e4bdd40a456c645b46dbf57")))
              (sha256
               (base32 "17jxw0f7vzszn0pcrmkcdl7qgspwqxx5a12vxp7lrcdicxmgxcdi"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "git.sr.ht/~geb/opt"))
    (synopsis "Command-line argument parsing for Go")
    (description "@code{opt} is a Go package for parsing arguments
sent to command-line programs.  opt provides the following features:
@itemize
@item long and short options: --help -h --number=7 -n 7 -n7
@item long options can be abbreviated: --version --ver
@item short options can be combined: -rf
@item positional arguments can be interspersed: -a file file2 -b
@item double dash forces positional arguments: --option -- --not --options
@end itemize")
    (home-page "https://git.sr.ht/~geb/opt")
    (license license:gpl3)))

(define-public go-github-com-bendahl-uinput
  (package
    (name "go-github-com-bendahl-uinput")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bendahl/uinput")
                    (commit "94f13ed012996a8692477f6d2d8b3195ad3aa5af")))
              (sha256
               (base32 "0p0adig1yg0r6ibvw7wsx05zcb5yaiy3ms0524myx4gbrbwvdldr"))))
    (build-system go-build-system)
    (arguments
     (list
      ;; TODO: Check why tests fail.  They depend upon uinput.
      #:tests? #f
      #:import-path "github.com/bendahl/uinput"))
    (synopsis "Go uinput wrapper")
    (description "This package is a go wrapper around uinput.  The
package provides a virtual keyboard, a mouse device, a gamepad, a touch
pad and a dial.")
    (home-page "https://github.com/bendahl/uinput")
    (license license:expat)))

(define-public dotool
  (package
    (name "dotool")
    (version "1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~geb/dotool")
                    (commit "4df1f7f0bcb5f0f1b0ab471a64c49296fd8e31a2")))
              (sha256
               (base32 "02lnbbinizj3r0aygas8vmi61mmdyj2z7azwbj0ncixcsxw3g981"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "git.sr.ht/~geb/dotool"
      #:install-source? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda _
              (with-directory-excursion "src/git.sr.ht/~geb/dotool"
                (invoke "sh" "./build.sh"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (with-directory-excursion "src/git.sr.ht/~geb/dotool"
                (setenv "DOTOOL_DESTDIR" (assoc-ref outputs "out"))
                (setenv "DOTOOL_BINDIR" "bin")
                (setenv "DOTOOL_UDEV_RULES_DIR" "lib/udev/rules.d")
                (invoke "sh" "./build.sh" "install")))))))
    (native-inputs (list
                    scdoc
                    go
                    pkg-config
                    gcc-toolchain
                    go-git-sr-ht-gb-opt
                    go-github-com-bendahl-uinput))
    (inputs (list libxkbcommon))
    (synopsis "Simulate mouse and keyboard input on X11, Wayland and TTY")
    (description "@code{dotool} reads actions from standard input and
simulates keyboard andmouse input using Linux's uinput module.  This
package also provides udev rules that allows users in the @code{input}
group to use the package.")
    (home-page "https://sr.ht/~geb/dotool")
    (license license:gpl3)))
