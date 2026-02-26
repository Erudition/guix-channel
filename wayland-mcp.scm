(define-module (wayland-mcp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages image)
  #:use-module (gnu packages python-crypto))

(define-public python-typing-inspection
  (package
    (name "python-typing-inspection")
    (version "0.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pydantic/typing-inspection")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dqib4arxxaxwyapw6y4pcvm38l8djkhd8cfr149w42bw4xrqr38"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-typing-extensions))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/pydantic/typing-inspection")
    (synopsis "Runtime typing introspection tools")
    (description "Runtime typing introspection tools.")
    (license license:expat)))

(define-public python-httpx-sse
  (package
    (name "python-httpx-sse")
    (version "0.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/florimondmanca/httpx-sse")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zliqd1rkvc0mjppscvqmg8j17hsiwvxn439yhn6qbjvk5ydncz8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-httpx))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (home-page "https://github.com/florimondmanca/httpx-sse")
    (synopsis "Consume Server-Sent Event (SSE) messages with HTTPX")
    (description "Consume Server-Sent Event (SSE) messages with HTTPX.")
    (license license:expat)))

(define-public python-sse-starlette
  (package
    (name "python-sse-starlette")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sysid/sse-starlette")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jph555v31mgv8yjbiv4087cay1km7zjvnvagfk86a6jb2rh86c0"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-anyio python-starlette python-uvicorn))
    (native-inputs (list python-pdm-backend))
    (home-page "https://github.com/sysid/sse-starlette")
    (synopsis "SSE plugin for Starlette")
    (description "SSE plugin for Starlette.")
    (license license:bsd-3)))

(define-public python-mcp
  (package
    (name "python-mcp")
    (version "1.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mcp" version))
       (sha256
        (base32 "00k87bl4jvnh7hrmicwb2m715fwccvvlanwf8cnlwdphxdhh6can"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-pydantic-requirement
            (lambda _
              (substitute* "pyproject.toml"
                (("pydantic>=2.11.0") "pydantic>=2.10.4")))))))
    (propagated-inputs
     (list python-httpx
           python-pydantic-2
           python-anyio
           python-httpx-sse
           python-jsonschema
           python-sse-starlette
           python-typing-inspection
           python-pyjwt
           python-cryptography))
    (native-inputs (list python-hatchling))
    (home-page "https://modelcontextprotocol.io")
    (synopsis "Model Context Protocol SDK")
    (description "Model Context Protocol SDK.")
    (license license:expat)))

(define-public python-atproto
  (package
    (name "python-atproto")
    (version "0.0.65")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "atproto" version))
       (sha256
        (base32 "0f29vpixq9zrkspz77vh6xh3h2xqhkdiig14pgqydaa6hzcnwz02"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-httpx python-pydantic-2 python-typing-extensions python-dnspython))
    (native-inputs (list python-poetry-core python-poetry-dynamic-versioning))
    (home-page "https://atproto.blue")
    (synopsis "The AT Protocol SDK")
    (description "The AT Protocol SDK.")
    (license license:expat)))

(define-public python-fastmcp
  (package
    (name "python-fastmcp")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "fastmcp" version))
       (sha256
        (base32 "0r5y3krmcyxfd46svzyfhsi8knrs0lmh5jpkwb4l2j70wjwd6fki"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-rich-usage
            (lambda _
              (substitute* "src/fastmcp/utilities/logging.py"
                (("\"tracebacks_max_frames\": [0-9]+,") "")))))))
    (propagated-inputs (list python-httpx
                             python-mcp
                             python-pydantic-2
                             python-pydantic-settings
                             python-dotenv
                             python-typer
                             python-anyio))
    (native-inputs (list python-hatch-vcs python-hatchling))
    (home-page "https://gofastmcp.com")
    (synopsis "The fast, Pythonic way to build MCP servers and clients")
    (description "The fast, Pythonic way to build MCP servers and clients.")
    (license license:expat)))

(define-public wayland-mcp
  (package
    (name "wayland-mcp")
    (version "0.4.0-23")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kurojs/wayland-mcp")
             (commit "b6f20b260585cdf8e80e37395331de4bdf07447f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05c1qm31yiy679q15xyjqvzvp4p07szidpmbja8wq5fw1fi65nwy"))
       (patches (list (local-file "patches/wayland-mcp-remove-cloud-vlm.patch")))))
    (build-system python-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build)
          (add-after 'unpack 'patch-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((grim (search-input-file inputs "/bin/grim"))
                    (slurp (search-input-file inputs "/bin/slurp"))
                    (evemu (search-input-file inputs "/bin/evemu-event")))
                (substitute* "wayland_mcp/app.py"
                  (("shutil\\.which\\(\"slurp\"\\)") (format #f "~s" slurp))
                  (("shutil\\.which\\(\"grim\"\\)") (format #f "~s" grim))
                  (("\\[\"slurp\"\\]") (format #f "[~s]" slurp))
                  (("\\[\"grim\"") (format #f "[~s" grim)))
                (substitute* '("wayland_mcp/keyboard_utils.py"
                               "wayland_mcp/mouse_utils.py")
                  (("\"evemu-event\"") (format #f "~s" evemu))))))
          (replace 'install
            (lambda* (#:key outputs inputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (python-bin (string-append (assoc-ref inputs "python") "/bin/python3"))
                     (site-packages (string-append out "/lib/python"
                                                   #$(version-major+minor (package-version python))
                                                   "/site-packages"))
                     (bin (string-append out "/bin")))
                (mkdir-p site-packages)
                (copy-recursively "wayland_mcp"
                                  (string-append site-packages "/wayland_mcp"))
                (mkdir-p bin)
                (with-output-to-file (string-append bin "/wayland-mcp")
                  (lambda _
                    (format #t "#!~a~%import sys~%from wayland_mcp.server_mcp import main~%if __name__ == '__main__':~%    sys.exit(main())~%"
                            python-bin)))
                (chmod (string-append bin "/wayland-mcp") #o755))))
          (add-after 'install 'wrap-program
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/wayland-mcp"))
                     (pythonpath (getenv "GUIX_PYTHONPATH"))
                     (path (string-join
                            (list (string-append (assoc-ref inputs "grim") "/bin")
                                  (string-append (assoc-ref inputs "slurp") "/bin")
                                  (string-append (assoc-ref inputs "python-evemu") "/bin"))
                            ":")))
                (wrap-program bin
                  `("GUIX_PYTHONPATH" ":" prefix (,pythonpath))
                  `("PATH" ":" prefix (,path)))))))))
    (inputs
     (list python-requests
           python-fastmcp
           python-pillow
           python-evemu
           grim
           slurp))
    (native-inputs
     (list bash-minimal))
    (home-page "https://github.com/kurojs/wayland-mcp")
    (synopsis "MCP server for Wayland automation")
    (description "Model Context Protocol server for Wayland desktop automation.")
    (license license:gpl3)))
