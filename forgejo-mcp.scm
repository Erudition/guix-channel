(define-module (forgejo-mcp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system go)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages golang-xyz)
  #:use-module ((guix licenses) #:prefix license:))

(define-public go-github-com-bahlo-generic-list-go
  (package
    (name "go-github-com-bahlo-generic-list-go")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bahlo/generic-list-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nif01xg2y7ihhik65xkx74kszamgvz9ykknj81p71mmdv0fm304"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/bahlo/generic-list-go"))
    (home-page "https://github.com/bahlo/generic-list-go")
    (synopsis "Generic list implementation for Go")
    (description "This package provides a generic list implementation for Go.")
    (license license:expat)))

(define-public go-github-com-wk8-go-ordered-map-v2
  (package
    (name "go-github-com-wk8-go-ordered-map-v2")
    (version "2.1.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wk8/go-ordered-map")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vzl2j6m9pz8ckikf9z2da9zxdbi7fwhcwq8rmzpmf34zl8cjn1g"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/wk8/go-ordered-map/v2"))
    (propagated-inputs
     (list go-github-com-bahlo-generic-list-go
           go-github-com-buger-jsonparser
           go-github-com-mailru-easyjson
           go-gopkg-in-yaml-v3))
    (native-inputs
     (list go-github-com-stretchr-testify))
    (home-page "https://github.com/wk8/go-ordered-map")
    (synopsis "Ordered map implementation for Go")
    (description "This package provides an ordered map implementation for Go.")
    (license license:asl2.0)))

(define-public go-github-com-invopop-jsonschema
  (package
    (name "go-github-com-invopop-jsonschema")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/invopop/jsonschema")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0my5j2fycl0xf3vn02xzy6fr7dkf8nkn62f8y5i2xish69007vhm"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/invopop/jsonschema"))
    (propagated-inputs
     (list go-github-com-wk8-go-ordered-map-v2))
    (native-inputs
     (list go-github-com-stretchr-testify))
    (home-page "https://github.com/invopop/jsonschema")
    (synopsis "JSON Schema generator from Go types")
    (description "This package generates JSON Schemas from Go types using reflection.")
    (license license:asl2.0)))

(define-public go-github-com-yosida95-uritemplate-v3
  (package
    (name "go-github-com-yosida95-uritemplate-v3")
    (version "3.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yosida95/uritemplate")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0csrdr64hjhwxlkcbb8y7bz1ccnyzl9c87fva00gr078nw52qxff"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/yosida95/uritemplate/v3"))
    (home-page "https://github.com/yosida95/uritemplate")
    (synopsis "Go implementation of URI Template (RFC 6570)")
    (description "This package provides a Go implementation of URI Template (RFC 6570).")
    (license license:bsd-3)))

(define-public go-github-com-mark3labs-mcp-go
  (package
    (name "go-github-com-mark3labs-mcp-go")
    (version "0.43.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mark3labs/mcp-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1mq9fmyhw2q20jc6wzx7km17vjap2ryarzdi14vxmqg0bkwkwch6"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/mark3labs/mcp-go"
           #:unpack-path "github.com/mark3labs/mcp-go"
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda* (#:key import-path #:allow-other-keys)
                   (for-each
                    (lambda (pkg)
                      (invoke "go" "install" "-v" "-ldflags=-s -w" "-trimpath"
                              (string-append import-path "/" pkg)))
                    '("mcp" "server" "client")))))))
    (propagated-inputs
     (list go-github-com-google-uuid
           go-github-com-invopop-jsonschema
           go-github-com-spf13-cast
           go-github-com-yosida95-uritemplate-v3))
    (native-inputs
     (list go-github-com-stretchr-testify))
    (home-page "https://github.com/mark3labs/mcp-go")
    (synopsis "Go implementation of the Model Context Protocol")
    (description "This package provides a Go implementation of the Model Context Protocol (MCP).")
    (license license:asl2.0)))

(define-public go-github-com-davidmz-go-pageant
  (package
    (name "go-github-com-davidmz-go-pageant")
    (version "1.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/davidmz/go-pageant")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0b333bnzi8wncakff7b890gg4md9pcbhs9fdv5bhh68r5pm2dz41"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/davidmz/go-pageant"))
    (home-page "https://github.com/davidmz/go-pageant")
    (synopsis "Go implementation of the Pageant protocol")
    (description "This package provides a Go implementation of the Pageant protocol for interacting with SSH agents.")
    (license license:expat)))

(define-public go-codeberg-org-mvdkleijn-forgejo-sdk
  (package
    (name "go-codeberg-org-mvdkleijn-forgejo-sdk")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/mvdkleijn/forgejo-sdk")
             (commit (string-append "forgejo/v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nvvxdbqnnf78sy7mk2p6ag5381s0svivibi645r7w0yml42i3hh"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f ; Tests require live instance
           #:import-path "codeberg.org/mvdkleijn/forgejo-sdk/forgejo/v2"
           #:unpack-path "codeberg.org/mvdkleijn/forgejo-sdk"
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'fix-canonical-import
                 (lambda _
                   (with-directory-excursion "src/codeberg.org/mvdkleijn/forgejo-sdk/forgejo"
                     (substitute* '("attachment.go" "doc.go")
                       ((" // import \"code.codeberg.org/mvdkleijn/forgejo-sdk\"") "")))))
               (add-after 'fix-canonical-import 'fix-sdk-path
                 (lambda _
                   (with-directory-excursion "src/codeberg.org/mvdkleijn/forgejo-sdk"
                     (invoke "mv" "forgejo" "v2")
                     (mkdir-p "forgejo")
                     (invoke "mv" "v2" "forgejo/")))))))
    (propagated-inputs
     (list go-github-com-42wim-httpsig
           go-github-com-go-fed-httpsig
           go-github-com-hashicorp-go-version
           go-golang-org-x-crypto))
    (native-inputs
     (list go-github-com-stretchr-testify))
    (home-page "https://codeberg.org/mvdkleijn/forgejo-sdk")
    (synopsis "Forgejo SDK for Go")
    (description "This package provides a Forgejo SDK for the Go programming language.")
    (license license:asl2.0)))

(define-public forgejo-mcp
  (package
    (name "forgejo-mcp")
    (version "0.0.0-1.400c121")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/goern/forgejo-mcp")
             (commit "400c121b18cb70f5948b734ce7e5531313e9dcd3")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c5h68md0b95z9rrsah77r3s8aygiymjhp8y575xzd3ra7bz8ykf"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "codeberg.org/goern/forgejo-mcp"
       #:install-source? #f))
    (propagated-inputs
     (list go-codeberg-org-mvdkleijn-forgejo-sdk
           go-github-com-mark3labs-mcp-go
           go-go-uber-org-zap))
    (home-page "https://codeberg.org/goern/forgejo-mcp")
    (synopsis "Forgejo Model Context Protocol (MCP) server")
    (description
     "This package provides a Model Context Protocol (MCP) server for Forgejo,
allowing AI agents to interact with Forgejo instances.")
    (license license:asl2.0)))