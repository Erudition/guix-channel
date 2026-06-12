(define-module (hollywood)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages tmux)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages base)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages image)
  #:use-module (gnu packages video)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages man)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages games)
  #:use-module (gnu packages figlet)
  #:use-module (gnu packages pv)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages syndication)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages moreutils)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages ncurses))

(define-public hollywood
  (package
    (name "hollywood")
    (version "1.25")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dustinkirkland/hollywood.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0r19glc86s9z0jz35v5dqaz4lxz3yxrfq79jcfcjdfkaqlwsx6xw"))))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("bin/" "bin/")
         ("lib/" "lib/")
         ("share/" "share/"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-paths
           (lambda _
             (substitute* "lib/hollywood/bat"
               (("batcat") "bat"))
             (substitute* "lib/hollywood/mplayer"
               (("command -v mplayer") "command -v mpv")
               (("mplayer -vo caca.*") "mpv -vo=caca --no-audio --loop-file=inf --start=$((RANDOM % 100)) --speed=100 $dir/soundwave.mp4"))
             #t))
         (add-after 'install 'wrap-programs
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (for-each
                (lambda (prog)
                  (wrap-program (string-append out "/bin/" prog)
                    `("PATH" ":" prefix
                      ,(map (lambda (dir)
                              (string-append dir "/bin"))
                            (map cdr inputs)))))
                '("hollywood" "wallstreet"))
               #t))))))
    (inputs
     `(("bash-minimal" ,bash-minimal)
       ("tmux" ,tmux)
       ("bat" ,bat)
       ("python-pygments" ,python-pygments)
       ("moreutils" ,moreutils)
       ("coreutils" ,coreutils)
       ("util-linux" ,util-linux)
       ("findutils" ,findutils)
       ("cmatrix" ,cmatrix)
       ("figlet" ,figlet)
       ("jp2a" ,jp2a)
       ("mpv" ,mpv)
       ("pv" ,pv)
       ("htop" ,htop)
       ("atop" ,atop)
       ("bmon" ,bmon)
       ("tree" ,tree)
       ("man-db" ,man-db)
       ("openssh" ,openssh)
       ("libcaca" ,libcaca)
       ("newsboat" ,newsboat)
       ("w3m" ,w3m)
       ("ncurses" ,ncurses)
       ("wget" ,wget)))
    (home-page "https://hollywood.computer/")
    (synopsis "Fill your console with Hollywood melodrama technobabble")
    (description "This utility splits your terminal into multiple panes of genuine
technobabble, perfectly suitable for any Hollywood geek melodrama.  It is particularly
suitable on any number of computer consoles in the background of any excellent schlock
technothriller.")
    (license license:asl2.0)))