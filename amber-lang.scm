(define-module (amber-lang)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-crates)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config))

(define base32-dummy "0000000000000000000000000000000000000000000000000000")

(define rust-proc-macro2-1 (crate-source "proc-macro2" "1.0.103" "1s29bz20xl2qk5ffs2mbdqknaj43ri673dz86axdbf47xz25psay"))
(define rust-quote-1 (crate-source "quote" "1.0.42" "0zq6yc7dhpap669m27rb4qfbiywxfah17z6fwvfccv3ys90wqf53"))
(define rust-syn-2 (crate-source "syn" "2.0.111" "11rf9l6435w525vhqmnngcnwsly7x4xx369fmaqvswdbjjicj31r"))
(define rust-chrono-0.4 (crate-source "chrono" "0.4.42" "1372k3n6g7m6p32p2lsq1idk8p8ndh96z6j7p4x9nclw198n5xay"))
(define rust-clap-4 (crate-source "clap" "4.5.31" "0ryp6xjbdc9cbjjkafjl35j91pvv0ykislwqhr537bi9hkcv0yq2"))
(define rust-colored-2 (crate-source "colored" "2.2.0" "0g6s7j2qayjd7i3sivmwiawfdg8c8ldy0g2kl4vwk1yk16hjaxqi"))
(define rust-glob-0.3 (crate-source "glob" "0.3.2" "1cm2w34b5w45fxr522h5b0fv1bxchfswcj560m3pnjbia7asvld8"))
(define rust-wildmatch-2 (crate-source "wildmatch" "2.5.0" "10nk5s864iczsdrxn38iypixp5mk36pwyv2k0xkfzfka4dxd1drr"))
(define rust-itertools-0.13 (crate-source "itertools" "0.13.0" "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1"))
(define rust-assert-cmd-2 (crate-source "assert_cmd" "2.0.16" "0gdj0710k3lnvyjmpv8a4dgwrk9ib85l2wfw4n2xwy3qyavka66w"))
(define rust-pretty-assertions-1 (crate-source "pretty_assertions" "1.4.1" "0v8iq35ca4rw3rza5is3wjxwsf88303ivys07anc5yviybi31q9s"))
(define rust-predicates-3 (crate-source "predicates" "3.1.3" "0wrm57acvagx0xmh5xffx5xspsr2kbggm698x0vks132fpjrxld5"))
(define rust-tempfile-3 (crate-source "tempfile" "3.23.0" "05igl2gml6z6i2va1bv49f9f1wb3f752c2i63lvlb9s2vxxwfc9d"))
(define rust-tiny-http-0.12 (crate-source "tiny_http" "0.12.0" "10nw9kk2i2aq4l4csy0825qkq0l66f9mz2c1n57yg8hkckgib69q"))
(define rust-build-helper-0.1 (crate-source "build-helper" "0.1.1" "0pxddbizzd3mvg3777hlg92la5qacjs8734cjk79ajgsycdikkmx"))
(define rust-include-dir-0.7 (crate-source "include_dir" "0.7.4" "1pfh3g45z88kwq93skng0n6g3r7zkhq9ldqs9y8rvr7i11s12gcj"))
(define rust-test-generator-0.3 (crate-source "test-generator" "0.3.1" "0fh7gaxlj48gg9l716084xcnll1p7v5lcr6bw4k348krvlmbw8sv"))
(define rust-pad-0.1 (crate-source "pad" "0.1.6" "1qy0r26r52gp034fv252mmg0s599a55h9nr4xswy04hvky49pbfj"))
(define rust-capitalize-0.3 (crate-source "capitalize" "0.3.4" "1gxmp8s740i1g6pqfmq9cbcv6v5x0dsfcbsqqzl5x0r2201p2lkb"))
(define rust-data-test-0.1 (crate-source "data-test" "0.1.2" "16v7n2c2wyz0xfd6w6ir7c3dzmaqx994d2mz885i2q1azkf08f9d"))
(define rust-serde-1 (crate-source "serde" "1.0.228" "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))
(define rust-serde-derive-1 (crate-source "serde_derive" "1.0.228" "0zshxky9v8m6940p936yyrsc8pivqksq29q680g9f23v0s07h8a1"))
(define rust-walkdir-2 (crate-source "walkdir" "2.5.0" "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))
(define rust-proc-macro2-0.4 (crate-source "proc-macro2" "0.4.30" "0nd71fl24sys066jrha6j7i34nfkjv44yzw8yww9742wmc8j0gfg"))
(define rust-quote-0.6 (crate-source "quote" "0.6.13" "1qgqq48jymp5h4y082aanf25hrw6bpb678xh3zw993qfhxmkpqkc"))
(define rust-syn-0.15 (crate-source "syn" "0.15.44" "1id5g6x6zihv3j7hwrw3m1jp636bg8dpi671r7zy3jvpkavb794w"))
(define rust-anstream-0.6 (crate-source "anstream" "0.6.18" "16sjk4x3ns2c3ya1x28a44kh6p47c7vhk27251i015hik1lm7k4a"))
(define rust-anstyle-1 (crate-source "anstyle" "1.0.10" "1yai2vppmd7zlvlrp9grwll60knrmscalf8l2qpfz8b7y5lkpk2m"))
(define rust-anstyle-parse-0.2 (crate-source "anstyle-parse" "0.2.6" "1acqayy22fwzsrvr6n0lz6a4zvjjcvgr5sm941m7m0b2fr81cb9v"))
(define rust-anstyle-query-1 (crate-source "anstyle-query" "1.1.2" "0m4bgpbcryfbg050p667v46p3p199r4m9y2ymhvgxhcl8scb3v1z"))
(define rust-libc-0.2 (crate-source "libc" "0.2.147" "1cwv2lkzk3p5lby79fm42qhsh29lvbqwayhjjkq1s746xaq8yrml"))
(define rust-bstr-1 (crate-source "bstr" "1.12.1" "1arc1v7h5l86vd6z76z3xykjzldqd5icldn7j9d3p7z6x0d4w133"))
(define rust-wait-timeout-0.2 (crate-source "wait-timeout" "0.2.0" "1xpkk0j5l9pfmjfh1pi0i89invlavfrd9av5xp0zhxgb29dhy84z"))
(define rust-doc-comment-0.3 (crate-source "doc-comment" "0.3.3" "043sprsf3wl926zmck1bm7gw0jq50mb76lkpk49vasfr6ax1p97y"))
(define rust-automod-1 (crate-source "automod" "1.0.15" "0w76lzg8vbrvx4cl8x63kdaxkwpbp17c4cg1bcgwmqmj3lqbvd7b"))
(define rust-escargot-0.5 (crate-source "escargot" "0.5.15" "1kyhkrxdbxlw839h3l838ck5ir96i9v2p9x6kh650yy95fisxhqi"))
(define rust-predicates-core-1 (crate-source "predicates-core" "1.0.9" "1yjz144yn3imq2r4mh7k9h0r8wv4yyjjj57bs0zwkscz24mlczkj"))
(define rust-predicates-tree-1 (crate-source "predicates-tree" "1.0.9" "1kyfq3r0s2vg94a9r59n7ar5gv66zvpa0s1fd6mm4l4czcas72rn"))
(define rust-diff-0.1 (crate-source "diff" "0.1.13" "1j0nzjxci2zqx63hdcihkp0a4dkdmzxd7my4m7zk6cjyfy34j9an"))
(define rust-difflib-0.4 (crate-source "difflib" "0.4.0" "1s7byq4d7jgf2hcp2lcqxi2piqwl8xqlharfbi8kf90n8csy7131"))
(define rust-anstyle-wincon-3 (crate-source "anstyle-wincon" "3.0.7" "0kmf0fq4c8yribdpdpylzz1zccpy84hizmcsac3wrac1f7kk8dfa"))
(define rust-yansi-1 (crate-source "yansi" "1.0.1" "0jdh55jyv0dpd38ij4qh60zglbw9aa8wafqai6m0wa7xaxk3mrfg"))
(define rust-float-cmp-0.10 (crate-source "float-cmp" "0.10.0" "1n760i3nxd2x0zc7fkxkg3vhvdyfbvzngna006cl9s9jacaz775h"))
(define rust-normalize-line-endings-0.3 (crate-source "normalize-line-endings" "0.3.0" "1gp52dfn2glz26a352zra8h04351icf0fkqzw1shkwrgh1vpz031"))
(define rust-regex-1 (crate-source "regex" "1.11.1" "148i41mzbx8bmq32hsj1q4karkzzx5m60qza6gdw4pdc9qdyyi5m"))
(define rust-num-traits-0.2 (crate-source "num-traits" "0.2.19" "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))
(define rust-once-cell-1 (crate-source "once_cell" "1.20.3" "0bp6rgrsri1vfdcahsimk08zdiilv14ppgcnpbiw8hqyp2j64m4l"))
(define rust-rayon-1 (crate-source "rayon" "1.10.0" "1ylgnzwgllajalr4v00y4kj22klq2jbwllm70aha232iah0sc65l"))
(define rust-tokio-1 (crate-source "tokio" "1.48.0" "0244qva5pksy8gam6llf7bd6wbk2vkab9lx26yyf08dix810wdpz"))
(define rust-smol-1 (crate-source "smol_str" "0.3.2" "039mj6lc1vkljj17ndlzzkak8kvlmw8ppi6yjdxsh433snfbhxln"))
(define rust-tinytemplate-1 (crate-source "tinytemplate" "1.2.1" "1g5n77cqkdh9hy75zdb01adxn45mkh9y40wdr7l68xpz35gnnkdy"))
(define rust-plotters-0.3 (crate-source "plotters" "0.3.7" "0ixpy9svpmr2rkzkxvvdpysjjky4gw104d73n7pi2jbs7m06zsss"))
(define rust-oorandom-11 (crate-source "oorandom" "11.1.4" "1sg4j19r5302a6jpn0kgfkbjnslrqr3ynxv8x2h2ddaaw7kvn45l"))
(define rust-cfg-if-1 (crate-source "cfg-if" "1.0.0" "1za0vb97n4brpzpv8lsbnzmq5r8f2b0cpqqr0sy8h5bn751xxwds"))
(define rust-fastrand-1 (crate-source "fastrand" "1.9.0" "1gh12m56265ihdbzh46bhh0jf74i197wm51jg1cw75q7ggi96475"))
(define rust-redox-syscall-0.3 (crate-source "redox_syscall" "0.4.1" "1aiifyz5dnybfvkk4cdab9p2kmphag1yad6iknc7aszlxxldf8j7"))
(define rust-rustix-0.37 (crate-source "rustix" "0.37.28" "1dn131z1vj1ani37acirby3rwh6ksm3m1qdv8k554xxrg39nb4ai"))
(define rust-windows-sys-0.45 (crate-source "windows-sys" "0.45.0" "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))
(define rust-windows-sys-0.59 (crate-source "windows-sys" "0.59.0" "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))
(define rust-compiler-builtins-0.1 (crate-source "compiler-builtins" "0.1.171" base32-dummy))
(define rust-rustc-std-workspace-core-1 (crate-source "rustc-std-workspace-core" "1.0.0" base32-dummy))
(define rust-rustc-std-workspace-alloc-1 (crate-source "rustc-std-workspace-alloc" "1.0.0" base32-dummy))
(define rust-colorchoice-1 (crate-source "colorchoice" "1.0.3" "0v7w49vshl5pzy46n0z76idq26w766y9mzyymhvgxhcl8scb3v1z"))
(define rust-is-terminal-0.4 (crate-source "is-terminal" "0.4.15" base32-dummy))
(define rust-fastrand-2 (crate-source "fastrand" "2.3.0" "1ghiahsw1jd68df895cy5h3gzwk30hndidn3b682zmshpgmrx41p"))
(define rust-rustix-1 (crate-source "rustix" "1.1.2" "0gpz343xfzx16x82s1x336n0kr49j02cvhgxdvaq86jmqnigh5fd"))
(define rust-windows-sys-0.52 (crate-source "windows-sys" "0.52.0" "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))
(define rust-bumpalo-3 (crate-source "bumpalo" "3.19.0" "0hsdndvcpqbjb85ghrhska2qxvp9i75q2vb70hma9fxqawdy9ia6"))
(define rust-rustversion-1 (crate-source "rustversion" "1.0.20" "1lhwjb16dsm8brd18bn2bh0ryzc7qi29bi2jjsc6ny2zbwn3ivgd"))
(define rust-ascii-1 (crate-source "ascii" "1.1.0" "05nyyp39x4wzc1959kv7ckwqpkdzjd9dw4slzyjh73qbhjcfqayr"))
(define rust-chunked-transfer-1 (crate-source "chunked_transfer" "1.5.0" "00a9h3csr1xwkqrzpz5kag4h92zdkrnxq4ppxidrhrx29syf6kbf"))
(define rust-httpdate-1 (crate-source "httpdate" "1.0.3" "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))
(define rust-openssl-0.10 (crate-source "openssl" "0.10.72" "1np54pm6hw512rmfjv3kc54h8yvf51mdlm8a8cc33xx1b1yympzy"))
(define rust-rustls-0.20 (crate-source "rustls" "0.23.34" base32-dummy))
(define rust-rustls-pemfile-0.2 (crate-source "rustls-pemfile" "2.2.0" "0l3f3mrfkgdjrava7ibwzgwc4h3dljw3pdkbsi9rkwz3zvji9qyw"))
(define rust-zeroize-1 (crate-source "zeroize" "1.8.1" "1pjdrmjwmszpxfd7r860jx54cyk94qk59x13sc307cvr5256glyf"))
(define rust-fdlimit-0.1 (crate-source "fdlimit" "0.1.4" base32-dummy))
(define rust-rustc-serialize-0.3 (crate-source "rustc-serialize" "0.3.25" base32-dummy))
(define rust-sha1-0.6 (crate-source "sha1" "0.10.6" "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))
(define rust-log-0.4 (crate-source "log" "0.4.22" "093vs0wkm1rgyykk7fjbqp2lwizbixac1w52gv109p5r4jh0p9x7"))
(define rust-criterion-0.5 (crate-source "criterion" "0.5.1" "0bv9ipygam3z8kk6k771gh9zi0j0lb9ir0xi1pc075ljg80jvcgj"))
(define rust-semver-parser-0.7 (crate-source "semver-parser" "0.7.0" "18vhypw6zgccnrlm5ps1pwa0khz7ry927iznpr88b87cagr1v2iq"))

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

(define-public amber-lang
  (package
    (name "amber-lang")
    (version "main")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amber-lang/amber")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0m2kharnr16zphm3wsw01jhgdrav42y5rfzjsxmvmgiydzcbzl9p"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f ;no test target
           #:cargo-inputs
           `(("rust-proc-macro2" ,rust-proc-macro2-1)
             ("rust-quote" ,rust-quote-1)
             ("rust-syn" ,rust-syn-2)
             ("rust-chrono" ,rust-chrono-0.4)
             ("rust-clap" ,rust-clap-4)
             ("rust-clap-complete" ,rust-clap-4)
             ("rust-colored" ,rust-colored-2)
             ("rust-glob" ,rust-glob-0.3)
             ("rust-heraclitus-compiler" ,rust-heraclitus-compiler-1)
             ("rust-include-dir" ,rust-include-dir-0.7)
             ("rust-itertools" ,rust-itertools-0.13)
             ("rust-similar-string" ,rust-similar-string-1)
             ("rust-test-generator" ,rust-test-generator-0.3)
             ("rust-wildmatch" ,rust-wildmatch-2)
             ("rust-assert-cmd" ,rust-assert-cmd-2)
             ("rust-pretty-assertions" ,rust-pretty-assertions-1)
             ("rust-predicates" ,rust-predicates-3)
             ("rust-tempfile" ,rust-tempfile-3)
             ("rust-tiny-http" ,rust-tiny-http-0.12)
             ("rust-build-helper" ,rust-build-helper-0.1))))
    (native-inputs
     (list pkg-config))
    (inputs
     (list openssl zlib))
    (home-page "https://amber-lang.com/")
    (synopsis "Amber programming language compiled to Bash")
    (description
     "Amber is a programming language that compiles to Bash.")
    (license gpl3+)))