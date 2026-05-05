(define-module (duckduckgo-mcp-server)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix licenses)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz))

(define-public python-duckduckgo-mcp-server
  (package
    (name "python-duckduckgo-mcp-server")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickclyde/duckduckgo-mcp-server")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1pixspis730zwv6fsglvl4ch5wx8r8fcl626h9bnc7501gm3y67w"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-beautifulsoup4 python-httpcore
                             python-httpx python-mcp))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/nickclyde/duckduckgo-mcp-server")
    (synopsis "MCP Server for searching via DuckDuckGo")
    (description "MCP Server for searching via @code{DuckDuckGo}.")
    (license expat)))
