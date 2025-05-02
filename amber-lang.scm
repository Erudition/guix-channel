(define-module (amber)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-io)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-windows)
  #:use-module (gnu packages crates-tls)
  #:use-module (gnu packages crates-crypto))


(define-public rust-semver-0.6
  (package
    (name "rust-semver")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0drmjiwkq0znj33q9x9hw7ld8f28n9diyjs3jlh1l1v5kvn8ccbs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-semver-parser" ,rust-semver-parser-0.7))))
    (home-page "https://github.com/dtolnay/semver")
    (synopsis "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (description
     "This package provides Parser and evaluator for Cargo's flavor of Semantic Versioning.")
    (license (list expat asl2.0))))

(define-public rust-build-helper-0.1
  (package
    (name "rust-build-helper")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "build-helper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0pxddbizzd3mvg3777hlg92la5qacjs8734cjk79ajgsycdikkmx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
        #:cargo-inputs (("rust-semver" ,rust-semver-0.6))))
    (home-page "https://github.com/DanielKeep/rust-build-helper")
    (synopsis "This crate contains convenience methods for build scripts")
    (description "This crate contains convenience methods for build scripts.")
    (license (list expat asl2.0))))


(define-public rust-heraclitus-compiler-1
  (package
    (name "rust-heraclitus-compiler")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heraclitus-compiler" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v3cgi7hl9a0jbh3dw8qnz7lz3cc8kdpl3gd59bxslq8qxdcrl8h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-capitalize" ,rust-capitalize-0.3)
                       ("rust-colored" ,rust-colored-2)
                       ("rust-pad" ,rust-pad-0.1)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Ph0enixKM/Heraclitus")
    (synopsis "Compiler frontend for developing great programming languages")
    (description
     "This package provides Compiler frontend for developing great programming languages.")
    (license expat)))

(define-public rust-similar-string-1
  (package
    (name "rust-similar-string")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "similar-string" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18vzij0c6jmvslsvnnhrmr8nyda3f5mp85m85kygkxr8bx2l5b6k"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/Ph0enixKM/similar-string")
    (synopsis "Find similar strings in Rust")
    (description "This package provides Find similar strings in Rust.")
    (license expat)))

(define-public rust-capitalize-0.3
  (package
    (name "rust-capitalize")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "capitalize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gxmp8s740i1g6pqfmq9cbcv6v5x0dsfcbsqqzl5x0r2201p2lkb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.5)
                                   ("rust-data-test" ,rust-data-test-0.1))))
    (home-page "https://github.com/jhg/capitalize-rs")
    (synopsis
     "Change first character to upper case and the rest to lower case, and other common alternatives")
    (description
     "This package provides Change first character to upper case and the rest to lower case, and other
common alternatives.")
    (license unlicense)))

    (define-public rust-tempfile-3
  (package
    (name "rust-tempfile")
    (version "3.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tempfile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "163rp254r3x7i5hisagrpxid2166pq94jvk511dpkmc1yf2fryxr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-fastrand" ,rust-fastrand-1)
                       ("rust-redox-syscall" ,rust-redox-syscall-0.3)
                       ("rust-rustix" ,rust-rustix-0.37)
                       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://stebalien.com/projects/tempfile-rs/")
    (synopsis "library for managing temporary files and directories.")
    (description
     "This package provides a library for managing temporary files and directories.")
    (license (list expat asl2.0))))

(define-public rust-criterion-0.5
  (package
    (name "rust-criterion")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bv9ipygam3z8kk6k771gh9zi0j0lb9ir0xi1pc075ljg80jvcgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anes" ,rust-anes-0.1)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-cast" ,rust-cast-0.3)
                       ("rust-ciborium" ,rust-ciborium-0.2)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-criterion-plot" ,rust-criterion-plot-0.5)
                       ("rust-csv" ,rust-csv-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-oorandom" ,rust-oorandom-11)
                       ("rust-plotters" ,rust-plotters-0.3)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-smol" ,rust-smol-1)
                       ("rust-tinytemplate" ,rust-tinytemplate-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-walkdir" ,rust-walkdir-2))
       #:cargo-development-inputs (("rust-approx" ,rust-approx-0.5)
                                   ("rust-futures" ,rust-futures-0.3)
                                   ("rust-quickcheck" ,rust-quickcheck-1)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis "Statistics-driven micro-benchmarking library")
    (description
     "This package provides Statistics-driven micro-benchmarking library.")
    (license (list asl2.0 expat))))


(define-public rust-data-test-0.1
  (package
    (name "rust-data-test")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "data-test" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16v7n2c2wyz0xfd6w6ir7c3dzmaqx994d2mz885i2q1azkf08f9d"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/jhg/data-test-rs")
    (synopsis
     "Simple data-test (aka table-test), without custom test to run with your test runner")
    (description
     "This package provides Simple data-test (aka table-test), without custom test to run with your test
runner.")
    (license unlicense)))

(define-public rust-include-dir-0.7
  (package
    (name "rust-include-dir")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "include_dir" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pfh3g45z88kwq93skng0n6g3r7zkhq9ldqs9y8rvr7i11s12gcj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs (("rust-glob" ,rust-glob-0.3)
                       ("rust-include-dir-macros" ,rust-include-dir-macros-0.7))
       #:cargo-development-inputs (("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/Michael-F-Bryan/include_dir")
    (synopsis "Embed the contents of a directory in your binary")
    (description
     "This package provides Embed the contents of a directory in your binary.")
    (license expat)))

(define-public rust-include-dir-macros-0.7
  (package
    (name "rust-include-dir-macros")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "include_dir_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0x8smnf6knd86g69p19z5lpfsaqp8w0nx14kdpkz1m8bxnkqbavw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1))))
    (home-page "https://github.com/Michael-F-Bryan/include_dir")
    (synopsis "The procedural macro used by include_dir")
    (description
     "This package provides The procedural macro used by include_dir.")
    (license expat)))


(define-public rust-test-generator-0.3
  (package
    (name "rust-test-generator")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "test-generator" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fh7gaxlj48gg9l716084xcnll1p7v5lcr6bw4k348krvlmbw8sv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-glob" ,rust-glob-0.3)
                       ("rust-proc-macro2" ,rust-proc-macro2-0.4)
                       ("rust-quote" ,rust-quote-0.6)
                       ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/frehberg/test-generator.git")
    (synopsis
     "Rust Test generator: enumerating entries according to file-system pattern and generating a test function for each entry")
    (description
     "This package provides Rust Test generator: enumerating entries according to file-system pattern and
generating a test function for each entry.")
    (license (list expat asl2.0))))

(define-public rust-assert-cmd-2
  (package
    (name "rust-assert-cmd")
    (version "2.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "assert_cmd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gdj0710k3lnvyjmpv8a4dgwrk9ib85l2wfw4n2xwy3qyavka66w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anstream" ,rust-anstream-0.6)
                       ("rust-anstyle" ,rust-anstyle-1)
                       ("rust-bstr" ,rust-bstr-1)
                       ("rust-doc-comment" ,rust-doc-comment-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-predicates" ,rust-predicates-3)
                       ("rust-predicates-core" ,rust-predicates-core-1)
                       ("rust-predicates-tree" ,rust-predicates-tree-1)
                       ("rust-wait-timeout" ,rust-wait-timeout-0.2))
       #:cargo-development-inputs (("rust-automod" ,rust-automod-1)
                                   ("rust-escargot" ,rust-escargot-0.5))))
    (home-page "https://github.com/assert-rs/assert_cmd")
    (synopsis "Test CLI Applications")
    (description "This package provides Test CLI Applications.")
    (license (list expat asl2.0))))

(define-public rust-pretty-assertions-1
  (package
    (name "rust-pretty-assertions")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pretty_assertions" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v8iq35ca4rw3rza5is3wjxwsf88303ivys07anc5yviybi31q9s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-diff" ,rust-diff-0.1)
                       ("rust-yansi" ,rust-yansi-1))))
    (home-page
     "https://github.com/rust-pretty-assertions/rust-pretty-assertions")
    (synopsis
     "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs")
    (description
     "This package provides Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding
colorful diffs.")
    (license (list expat asl2.0))))

(define-public rust-predicates-3
  (package
    (name "rust-predicates")
    (version "3.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "predicates" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wrm57acvagx0xmh5xffx5xspsr2kbggm698x0vks132fpjrxld5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs (("rust-anstyle" ,rust-anstyle-1)
                       ("rust-difflib" ,rust-difflib-0.4)
                       ("rust-float-cmp" ,rust-float-cmp-0.10)
                       ("rust-normalize-line-endings" ,rust-normalize-line-endings-0.3)
                       ("rust-predicates-core" ,rust-predicates-core-1)
                       ("rust-regex" ,rust-regex-1))
       #:cargo-development-inputs (("rust-predicates-tree" ,rust-predicates-tree-1))))
    (home-page "https://github.com/assert-rs/predicates-rs")
    (synopsis "An implementation of boolean-valued predicate functions")
    (description
     "This package provides An implementation of boolean-valued predicate functions.")
    (license (list expat asl2.0))))


(define-public rust-linux-raw-sys-0.9
  (package
    (name "rust-linux-raw-sys")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linux-raw-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s89d3ykla46h6i3z42972gnlm9xbdlyj1kmgdbxr1zhva1wdfbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/sunfishcode/linux-raw-sys")
    (synopsis "Generated bindings for Linux's userspace API")
    (description
     "This package provides Generated bindings for Linux's userspace API.")
    (license (list asl2.0  asl2.0
                   expat))))

(define-public rust-rustix-1
  (package
    (name "rust-rustix")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mznc6mzxgrm5b9aw0alji956mb2q7cgrrav8w8lff2wvw94ipns"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-errno" ,rust-errno-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-linux-raw-sys" ,rust-linux-raw-sys-0.9)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))))
    (home-page "https://github.com/bytecodealliance/rustix")
    (synopsis "Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls")
    (description
     "This package provides Safe Rust bindings to POSIX/Unix/Linux/Winsock-like syscalls.")
    (license (list asl2.0  asl2.0
                   expat))))

(define-public rust-wit-bindgen-rt-0.33
  (package
    (name "rust-wit-bindgen-rt")
    (version "0.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wit-bindgen-rt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g4lwfp9x6a2i1hgjn8k14nr4fsnpd5izxhc75zpi2s5cvcg6s1j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-2))))
    (home-page "https://github.com/bytecodealliance/wit-bindgen")
    (synopsis "Internal runtime support for the `wit-bindgen` crate.")
    (description
     "This package provides Internal runtime support for the `wit-bindgen` crate.")
    (license (list asl2.0  asl2.0
                   expat))))

(define-public rust-wasi-0.13
  (package
    (name "rust-wasi")
    (version "0.13.3+wasi-0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lnapbvdcvi3kc749wzqvwrpd483win2kicn1faa4dja38p6v096"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-wit-bindgen-rt" ,rust-wit-bindgen-rt-0.33))))
    (home-page "https://github.com/bytecodealliance/wasi-rs")
    (synopsis "WASI API bindings for Rust")
    (description "This package provides WASI API bindings for Rust.")
    (license (list asl2.0 expat))))

(define-public rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-shared" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gffxvqgbh9r9xl36gprkfnh3w9gl8wgia6xrin7v11sjcxxf18s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (description
     "This package provides Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (license (list expat asl2.0))))

(define-public rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-backend" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ihbf1hq3y81c4md9lyh6lcwbx6a5j0fw4fygd423g62lm8hc2ig"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bumpalo" ,rust-bumpalo-3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Backend code generation of the wasm-bindgen tool")
    (description
     "This package provides Backend code generation of the wasm-bindgen tool.")
    (license (list expat asl2.0))))

(define-public rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro-support" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1plm8dh20jg2id0320pbmrlsv6cazfv6b6907z19ys4z1jj7xs4a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2)
                       ("rust-wasm-bindgen-backend" ,rust-wasm-bindgen-backend-0.2)
                       ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate")
    (description
     "This package provides The part of the implementation of the `#[wasm_bindgen]` attribute that is not in
the shared backend crate.")
    (license (list expat asl2.0))))

(define-public rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01xls2dvzh38yj17jgrbiib1d3nyad7k2yw9s0mpklwys333zrkz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-quote" ,rust-quote-1)
                       ("rust-wasm-bindgen-macro-support" ,rust-wasm-bindgen-macro-support-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (description
     "This package provides Definition of the `#[wasm_bindgen]` attribute, an internal dependency.")
    (license (list expat asl2.0))))

(define-public rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.100")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x8ymcm6yi3i1rwj78myl1agqv2m86i648myy3lc97s9swlqkp0y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-wasm-bindgen-macro" ,rust-wasm-bindgen-macro-0.2))))
    (home-page "https://rustwasm.github.io/")
    (synopsis "Easy support for interacting between JS and Rust.")
    (description
     "This package provides Easy support for interacting between JS and Rust.")
    (license (list expat asl2.0))))

(define-public rust-js-sys-0.3
  (package
    (name "rust-js-sys")
    (version "0.3.77")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "js-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13x2qcky5l22z4xgivi59xhjjx4kxir1zg7gcj0f1ijzd4yg7yhw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-once-cell" ,rust-once-cell-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (description
     "This package provides Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.")
    (license (list expat asl2.0))))

(define-public rust-getrandom-0.3
  (package
    (name "rust-getrandom")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getrandom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y154yzby383p63ndw6zpfm0fz3vf6c0zdwc7df6vkl150wrr923"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
                       ("rust-js-sys" ,rust-js-sys-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
                       ("rust-wasi" ,rust-wasi-0.13)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-windows-targets" ,rust-windows-targets-0.52))))
    (home-page "https://github.com/rust-random/getrandom")
    (synopsis
     "small cross-platform library for retrieving random data from system source")
    (description
     "This package provides a small cross-platform library for retrieving random data
from system source.")
    (license (list expat asl2.0))))

(define-public rust-tempfile-3
  (package
    (name "rust-tempfile")
    (version "3.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tempfile" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rz5y2qjz3mwpca8j5kg9fr65jmdinf27bdbil6i5rkfa857wc9c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-fastrand" ,rust-fastrand-2)
                       ("rust-getrandom" ,rust-getrandom-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-rustix" ,rust-rustix-1)
                       ("rust-windows-sys" ,rust-windows-sys-0.59))
       #:cargo-development-inputs (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page "https://stebalien.com/projects/tempfile-rs/")
    (synopsis "library for managing temporary files and directories.")
    (description
     "This package provides a library for managing temporary files and directories.")
    (license (list expat asl2.0))))

(define-public rust-tiny-http-0.12
  (package
    (name "rust-tiny-http")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tiny_http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10nw9kk2i2aq4l4csy0825qkq0l66f9mz2c1n57yg8hkckgib69q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ascii" ,rust-ascii-1)
                       ("rust-chunked-transfer" ,rust-chunked-transfer-1)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-openssl" ,rust-openssl-0.10)
                       ("rust-rustls" ,rust-rustls-0.20)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-0.2)
                       ("rust-zeroize" ,rust-zeroize-1))
       #:cargo-development-inputs (("rust-fdlimit" ,rust-fdlimit-0.1)
                                   ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
                                   ("rust-sha1" ,rust-sha1-0.6))))
    (home-page "https://github.com/tiny-http/tiny-http")
    (synopsis "Low level HTTP server library")
    (description "This package provides Low level HTTP server library.")
    (license (list expat asl2.0))))


(define-public amber
  (package
    (name "amber")
    (version "main")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amber-lang/amber")
                    (commit version)))
;;               (file-name (git-file-name name version))
              (sha256
               (base32
                "0m2kharnr16zphm3wsw01jhgdrav42y5rfzjsxmvmgiydzcbzl9p"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f)) ;no test target
    (inputs
     (list rust-proc-macro2-1 rust-quote-1 rust-syn-2 rust-chrono-0.4 rust-clap-4 rust-clap-complete-4 rust-colored-2 rust-glob-0.3 rust-heraclitus-compiler-1 rust-include-dir-0.7 rust-itertools-0.13 rust-similar-string-1 rust-test-generator-0.3 rust-wildmatch-2 rust-include-dir-0.7 rust-assert-cmd-2 rust-pretty-assertions-1 rust-predicates-3 rust-tempfile-3 rust-tiny-http-0.12 rust-build-helper-0.1))
;;     (native-inputs
;;      (list gettext-minimal
;;            pkg-config))
    (home-page "https://amber-lang.com/")
    (synopsis "Amber the programming language compiled to Bash ")
    (description
     "Amber the programming language compiled to Bash")
     (license gpl3+)
  )
)
amber
