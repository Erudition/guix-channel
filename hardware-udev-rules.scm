(define-module (hardware-udev-rules)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

(define-public zsa-udev-rules
  (package
    (name "zsa-udev-rules")
    (version "21")
    (source (local-file "udev-rules" #:recursive? #t))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("50-zsa.rules" "lib/udev/rules.d/"))))
    (home-page "https://zsa.io")
    (synopsis "udev rules for ZSA keyboards")
    (description "Provides udev rules for flashing and live training ZSA keyboards (ErgoDox EZ, Moonlander, Planck EZ, Voyager).")
    (license license:expat)))

(define-public linnstrument-udev-rules
  (package
    (name "linnstrument-udev-rules")
    (version "1.0")
    (source (local-file "udev-rules" #:recursive? #t))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("70-linnstrument.rules" "lib/udev/rules.d/"))))
    (home-page "https://www.rogerlinndesign.com/linnstrument")
    (synopsis "udev rules for Roger Linn Design LinnStrument")
    (description "Provides udev rules for LinnStrument Arduino compiling.")
    (license license:public-domain)))

(define-public oculus-udev-rules
  (package
    (name "oculus-udev-rules")
    (version "1.0")
    (source (local-file "udev-rules" #:recursive? #t))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("51-oculus.rules" "lib/udev/rules.d/"))))
    (home-page "https://www.meta.com/quest/")
    (synopsis "udev rules for Meta/Oculus Quest")
    (description "Provides udev rules for Oculus/Meta Quest WebUSB.")
    (license license:public-domain)))

(define-public nvme-scheduler-udev-rules
  (package
    (name "nvme-scheduler-udev-rules")
    (version "1.0")
    (source (local-file "udev-rules" #:recursive? #t))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("60-nvme-scheduler.rules" "lib/udev/rules.d/"))))
    (home-page "https://kernel.org")
    (synopsis "udev rule to set NVMe IO scheduler")
    (description "Sets the IO scheduler for NVMe drives to mq-deadline.")
    (license license:public-domain)))

(define-public 3d-scanner-udev-rules
  (package
    (name "3d-scanner-udev-rules")
    (version "1.0")
    (source (local-file "udev-rules" #:recursive? #t))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("99-3d-scanner.rules" "lib/udev/rules.d/"))))
    (home-page "")
    (synopsis "udev rules for 3DMatrix scanner and Sentinel dongle")
    (description "Provides udev rules for the 3DMatrix Cypress FX3 scanner and Aladdin Knowledge Systems Sentinel HL dongle.")
    (license license:public-domain)))

