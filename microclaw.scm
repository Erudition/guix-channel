(define-module (microclaw)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages compression)
  #:export (microclaw lookup-cargo-inputs))

(define rust-accessory-2.1.0
  (crate-source "accessory" "2.1.0"
                "105x55d5crlksda2l9y5sardff6pi081pn5j5an8p0s5mfiidr18"))

(define rust-adler2-2.0.1
  (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-aead-0.5.2
  (crate-source "aead" "0.5.2"
                "1c32aviraqag7926xcb9sybdm36v5vh9gnxpn4pxdwjc50zl28ni"))

(define rust-aes-0.8.4
  (crate-source "aes" "0.8.4"
                "1853796anlwp4kqim0s6wm1srl4ib621nm0cl2h3c8klsjkgfsdi"))

(define rust-aho-corasick-1.1.4
  (crate-source "aho-corasick" "1.1.4"
                "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx"))

(define rust-allocator-api2-0.2.21
  (crate-source "allocator-api2" "0.2.21"
                "08zrzs022xwndihvzdn78yqarv2b9696y67i6h78nla3ww87jgb8"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-anstream-0.6.21
  (crate-source "anstream" "0.6.21"
                "0jjgixms4qjj58dzr846h2s29p8w7ynwr9b9x6246m1pwy0v5ma3"))

(define rust-anstyle-1.0.13
  (crate-source "anstyle" "1.0.13"
                "0y2ynjqajpny6q0amvfzzgw0gfw3l47z85km4gvx87vg02lcr4ji"))

(define rust-anstyle-parse-0.2.7
  (crate-source "anstyle-parse" "0.2.7"
                "1hhmkkfr95d462b3zf6yl2vfzdqfy5726ya572wwg8ha9y148xjf"))

(define rust-anstyle-query-1.1.5
  (crate-source "anstyle-query" "1.1.5"
                "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20"))

(define rust-anstyle-wincon-3.0.11
  (crate-source "anstyle-wincon" "3.0.11"
                "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9"))

(define rust-anyhow-1.0.101
  (crate-source "anyhow" "1.0.101"
                "1skmg90fnjnlgs3vl7bksw7036d3rqwqj20n2fxd2ppg67p0y3jz"))

(define rust-anymap2-0.13.0
  (crate-source "anymap2" "0.13.0"
                "031kw3bp0zh2pn9fcayaw0w0gydgpgfhm08pg4yz5cml9jwv60fk"))

(define rust-aquamarine-0.6.0
  (crate-source "aquamarine" "0.6.0"
                "1hnmqf274kbp2ggyimwh2qvdnkasm0m59fin93g440qkaijpfl0g"))

(define rust-ar-archive-writer-0.5.1
  (crate-source "ar_archive_writer" "0.5.1"
                "02rlgsw6k2dh3dk616qyrsl939fwznns1cvf9x0jghmrcfxkpfby"))

(define rust-arbitrary-1.4.2
  (crate-source "arbitrary" "1.4.2"
                "1wcbi4x7i3lzcrkjda4810nqv03lpmvfhb0a85xrq1mbqjikdl63"))

(define rust-archery-1.2.2
  (crate-source "archery" "1.2.2"
                "07a4wn09ad1q7qi1bfdv03hl4668jaxm63rd6jxqgfzykpwsbq3h"))

(define rust-argon2-0.5.3
  (crate-source "argon2" "0.5.3"
                "0wn0kk97k49wxidfigmz1pdqmygqzi4h6w72ib7cpq765s4i0diw"))

(define rust-arrayref-0.3.9
  (crate-source "arrayref" "0.3.9"
                "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-as-variant-1.3.0
  (crate-source "as_variant" "1.3.0"
                "12h7rv4drn20db9hk079aa0hrsjld7yyhv4gv6h7pcc2g983mg4x"))

(define rust-assign-1.1.1
  (crate-source "assign" "1.1.1"
                "00h0r04iyyhhnjr8fwkmw3fpvpd41bn9x1dz8s9j5kdyg3nkw2az"))

(define rust-async-channel-2.5.0
  (crate-source "async-channel" "2.5.0"
                "1ljq24ig8lgs2555myrrjighycpx2mbjgrm3q7lpa6rdsmnxjklj"))

(define rust-async-compression-0.4.40
  (crate-source "async-compression" "0.4.40"
                "1qn8jq2kzgrk7m9q21m83pc849555ha0qx6spiw0rlpl04rd8rvx"))

(define rust-async-stream-0.3.6
  (crate-source "async-stream" "0.3.6"
                "0xl4zqncrdmw2g6241wgr11dxdg4h7byy6bz3l6si03qyfk72nhb"))

(define rust-async-stream-impl-0.3.6
  (crate-source "async-stream-impl" "0.3.6"
                "0kaplfb5axsvf1gfs2gk6c4zx6zcsns0yf3ssk7iwni7bphlvhn7"))

(define rust-async-trait-0.1.89
  (crate-source "async-trait" "0.1.89"
                "1fsxxmz3rzx1prn1h3rs7kyjhkap60i7xvi0ldapkvbb14nssdch"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-autocfg-1.5.0
  (crate-source "autocfg" "1.5.0"
                "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0"))

(define rust-axum-0.7.9
  (crate-source "axum" "0.7.9"
                "07z7wqczi9i8xb4460rvn39p4wjqwr32hx907crd1vwb2fy8ijpd"))

(define rust-axum-core-0.4.5
  (crate-source "axum-core" "0.4.5"
                "16b1496c4gm387q20hkv5ic3k5bd6xmnvk50kwsy6ymr8rhvvwh9"))

(define rust-backon-1.6.0
  (crate-source "backon" "1.6.0"
                "1vzphngmym91xh29x7px6vw1xgcv5vjzw86b9zy6ddkm329hxyyg"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-base64ct-1.8.3
  (crate-source "base64ct" "1.8.3"
                "01nyyyx84bhwrcc168hn47d8gvz2pzpv3y3lmck7mq4hw5vh3x9a"))

(define rust-bitflags-2.10.0
  (crate-source "bitflags" "2.10.0"
                "1lqxwc3625lcjrjm5vygban9v8a6dlxisp1aqylibiaw52si4bl1"))

(define rust-bitmaps-3.2.1
  (crate-source "bitmaps" "3.2.1"
                "1mivd3wyyham6c8y21nq3ka29am6v8hqn7lzmwf91aks2fq89l51"))

(define rust-blake2-0.10.6
  (crate-source "blake2" "0.10.6"
                "1zlf7w7gql12v61d9jcbbswa3dw8qxsjglylsiljp9f9b3a2ll26"))

(define rust-blake3-1.8.3
  (crate-source "blake3" "1.8.3"
                "0b9ay320z90xs5hyk48l1v3208yyvdy3gs3nnlb7xyxkaxyyys14"))

(define rust-block-buffer-0.10.4
  (crate-source "block-buffer" "0.10.4"
                "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-block-padding-0.3.3
  (crate-source "block-padding" "0.3.3"
                "14wdad0r1qk5gmszxqd8cky6vx8qg7c153jv981mixzrpzmlz2d8"))

(define rust-bs58-0.5.1
  (crate-source "bs58" "0.5.1"
                "1x3v51n5n2s3l0rgrsn142akdf331n2qsa75pscw71fi848vm25z"))

(define rust-bumpalo-3.19.1
  (crate-source "bumpalo" "3.19.1"
                "044555i277xcinmqs7nnv8n5y4fqfi4l4lp1mp3i30vsidrxrnax"))

(define rust-bytemuck-1.25.0
  (crate-source "bytemuck" "1.25.0"
                "1v1z32igg9zq49phb3fra0ax5r2inf3aw473vldnm886sx5vdvy8"))

(define rust-byteorder-1.5.0
  (crate-source "byteorder" "1.5.0"
                "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z"))

(define rust-bytes-1.11.1
  (crate-source "bytes" "1.11.1"
                "0czwlhbq8z29wq0ia87yass2mzy1y0jcasjb8ghriiybnwrqfx0y"))

(define rust-bytesize-2.3.1
  (crate-source "bytesize" "2.3.1"
                "18vjp7wfik0xi54l3z2314s7zxjyywa4vvwhilawnas2nbkixnbb"))

(define rust-bzip2-0.5.2
  (crate-source "bzip2" "0.5.2"
                "0iya6nbj0p2y8jss0z05yncc5hadry164fw3zva01y06v4igpv29"))

(define rust-bzip2-sys-0.1.13+1.0.8
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "bzip2-sys" "0.1.13+1.0.8"
                "056c39pgjh4272bdslv445f5ry64xvb0f7nph3z7860ln8rzynr2"))

(define rust-cassowary-0.3.0
  (crate-source "cassowary" "0.3.0"
                "0lvanj0gsk6pc1chqrh4k5k0vi1rfbgzmsk46dwy3nmrqyw711nz"))

(define rust-castaway-0.2.4
  (crate-source "castaway" "0.2.4"
                "0nn5his5f8q20nkyg1nwb40xc19a08yaj4y76a8q2y3mdsmm3ify"))

(define rust-cbc-0.1.2
  (crate-source "cbc" "0.1.2"
                "19l9y9ccv1ffg6876hshd123f2f8v7zbkc4nkckqycxf8fajmd96"))

(define rust-cc-1.2.55
  (crate-source "cc" "1.2.55"
                "0adx36r84c7rscv853a71nd3d5gsb1jf438gnl4syd5fah4nmcj7"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-chacha20-0.9.1
  (crate-source "chacha20" "0.9.1"
                "0678wipx6kghp71hpzhl2qvx80q7caz3vm8vsvd07b1fpms3yqf3"))

(define rust-chacha20poly1305-0.10.1
  (crate-source "chacha20poly1305" "0.10.1"
                "0dfwq9ag7x7lnd0znafpcn8h7k4nfr9gkzm0w7sc1lcj451pkk8h"))

(define rust-chrono-0.4.43
  (crate-source "chrono" "0.4.43"
                "06312amlyys4kkjazl13mbxw0j2f7zxygzjkr1yk7s2sn57p9i7s"))

(define rust-chrono-tz-0.10.4
  (crate-source "chrono-tz" "0.10.4"
                "1hr6rmdvqwgk748g2f69mnk97fzhdkfzaczvdn0wz4pdjy2rl4x6"))

(define rust-cipher-0.4.4
  (crate-source "cipher" "0.4.4"
                "1b9x9agg67xq5nq879z66ni4l08m6m3hqcshk37d4is4ysd3ngvp"))

(define rust-clap-4.5.60
  (crate-source "clap" "4.5.60"
                "02h3nzznssjgp815nnbzk0r62y2iw03kdli75c233kirld6z75r7"))

(define rust-clap-builder-4.5.60
  (crate-source "clap_builder" "4.5.60"
                "0xk8mdizvmmn6w5ij5cwhy5pbgyac4w9pfvl6nqmjl7a5hql38i4"))

(define rust-clap-derive-4.5.55
  (crate-source "clap_derive" "4.5.55"
                "1r949xis3jmhzh387smd70vc8a3b9734ck3g5ahg59a63bd969x9"))

(define rust-clap-lex-1.0.0
  (crate-source "clap_lex" "1.0.0"
                "0c8888qi1l9sayqlv666h8s0yxn2qc6jr88v1zagk43mpjjjx0is"))

(define rust-colorchoice-1.0.4
  (crate-source "colorchoice" "1.0.4"
                "0x8ymkz1xr77rcj1cfanhf416pc4v681gmkc9dzb3jqja7f62nxh"))

(define rust-colored-3.1.1
  (crate-source "colored" "3.1.1"
                "0d5cpbgvyvmmky199s885s6385ykd75q6qg3d2kcxjxq563ldygs"))

(define rust-compact-str-0.8.1
  (crate-source "compact_str" "0.8.1"
                "0cmgp61hw4fwaakhilwznfgncw2p4wkbvz6dw3i7ibbckh3c8y9v"))

(define rust-compression-codecs-0.4.37
  (crate-source "compression-codecs" "0.4.37"
                "1dqrcv8myady3z5qgj351l6ca68g2n3blq9hfwkgqry9v6km2yzb"))

(define rust-compression-core-0.4.31
  (crate-source "compression-core" "0.4.31"
                "13cxnh46qvli55aqv04i3l6kiw2835ngp6mr5paa00nidvxlx63m"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-const-oid-0.9.6
  (crate-source "const-oid" "0.9.6"
                "1y0jnqaq7p2wvspnx7qj76m7hjcqpz73qzvr9l2p9n2s51vr6if2"))

(define rust-const-panic-0.2.15
  (crate-source "const_panic" "0.2.15"
                "0lp6i96dnbpal6k6zdmlpmwa2zgbrpwnjff46jpf7514qjmcsqp2"))

(define rust-constant-time-eq-0.3.1
  (crate-source "constant_time_eq" "0.3.1"
                "19nwwczii762pwlsm7bpizgjg8hkg1kqi32b2g4rglijklsbhx3w"))

(define rust-constant-time-eq-0.4.2
  (crate-source "constant_time_eq" "0.4.2"
                "16zamq60dq80k3rqlzh9j9cpjhishmh924lnwbplgrnmkkvfylix"))

(define rust-core-foundation-0.9.4
  (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-cpufeatures-0.2.17
  (crate-source "cpufeatures" "0.2.17"
                "10023dnnaghhdl70xcds12fsx2b966sxbxjq5sxs49mvxqw5ivar"))

(define rust-crc-3.4.0
  (crate-source "crc" "3.4.0"
                "03dsq5qsv86m35ikg84l80d00wnkjm8q4pjxgac0vaqjrnhs5f2y"))

(define rust-crc-catalog-2.4.0
  (crate-source "crc-catalog" "2.4.0"
                "1xg7sz82w3nxp1jfn425fvn1clvbzb3zgblmxsyqpys0dckp9lqr"))

(define rust-crc32fast-1.5.0
  (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-cron-0.13.0
  (crate-source "cron" "0.13.0"
                "0cl5jxsnsykmjqycdfsaw0bd6gd1njy3969w3l7vqf30a6sb5s7f"))

(define rust-crossbeam-utils-0.8.21
  (crate-source "crossbeam-utils" "0.8.21"
                "0a3aa2bmc8q35fb67432w16wvi54sfmb69rk9h5bhd18vw0c99fh"))

(define rust-crossterm-0.28.1
  (crate-source "crossterm" "0.28.1"
                "1im9vs6fvkql0sr378dfr4wdm1rrkrvr22v4i8byz05k1dd9b7c2"))

(define rust-crossterm-winapi-0.9.1
  (crate-source "crossterm_winapi" "0.9.1"
                "0axbfb2ykbwbpf1hmxwpawwfs8wvmkcka5m561l7yp36ldi7rpdc"))

(define rust-crypto-common-0.1.7
  (crate-source "crypto-common" "0.1.7"
                "02nn2rhfy7kvdkdjl457q2z0mklcvj9h662xrq6dzhfialh2kj3q"))

(define rust-ctr-0.9.2
  (crate-source "ctr" "0.9.2"
                "0d88b73waamgpfjdml78icxz45d95q7vi2aqa604b0visqdfws83"))

(define rust-curve25519-dalek-4.1.3
  (crate-source "curve25519-dalek" "4.1.3"
                "1gmjb9dsknrr8lypmhkyjd67p1arb8mbfamlwxm7vph38my8pywp"))

(define rust-curve25519-dalek-derive-0.1.1
  (crate-source "curve25519-dalek-derive" "0.1.1"
                "1cry71xxrr0mcy5my3fb502cwfxy6822k4pm19cwrilrg7hq4s7l"))

(define rust-darling-0.21.3
  (crate-source "darling" "0.21.3"
                "1h281ah78pz05450r71h3gwm2n24hy8yngbz58g426l4j1q37pww"))

(define rust-darling-0.23.0
  (crate-source "darling" "0.23.0"
                "179fj6p6ajw4dnkrik51wjhifxwy02x5zhligyymcb905zd17bi5"))

(define rust-darling-core-0.21.3
  (crate-source "darling_core" "0.21.3"
                "193ya45qgac0a4siwghk0bl8im8h89p3cald7kw8ag3yrmg1jiqj"))

(define rust-darling-core-0.23.0
  (crate-source "darling_core" "0.23.0"
                "1c033vrks38vpw8kwgd5w088dsr511kfz55n9db56prkgh7sarcq"))

(define rust-darling-macro-0.21.3
  (crate-source "darling_macro" "0.21.3"
                "10ac85n4lnx3rmf5rw8lijl2c0sbl6ghcpgfmzh0s26ihbghi0yk"))

(define rust-darling-macro-0.23.0
  (crate-source "darling_macro" "0.23.0"
                "13fvzji9xyp304mgq720z5l0xgm54qj68jibwscagkynggn88fdc"))

(define rust-dashmap-5.5.3
  (crate-source "dashmap" "5.5.3"
                "0miqnlxi501vfbv6mw5jbmzgnj0wjrch3p4abvpd59s9v30lg1wp"))

(define rust-data-encoding-2.10.0
  (crate-source "data-encoding" "2.10.0"
                "1shzipi8igi058fkx9wfiy6prd7d8rahz1lb7d4idw9nfvrf58fp"))

(define rust-date-header-1.0.5
  (crate-source "date_header" "1.0.5"
                "078zb823qrzxj8milpk7vbmf303gmfk4nj7g4yqgnc0sxlbc80qc"))

(define rust-deadpool-0.12.3
  (crate-source "deadpool" "0.12.3"
                "06wvsfyni5f04ia6jczgjnpkq4w91cnjjdz10mpq93gcsv8v3qhb"))

(define rust-deadpool-runtime-0.1.4
  (crate-source "deadpool-runtime" "0.1.4"
                "0arbchl5j887hcfvjy4gq38d32055s5cf7pkpmwn0lfw3ss6ca89"))

(define rust-deadpool-sync-0.1.4
  (crate-source "deadpool-sync" "0.1.4"
                "015bpi5apvps1r8w9g75sgkja9kc2qqvl89f0b6qxsap1pgw6jsj"))

(define rust-decancer-3.3.3
  (crate-source "decancer" "3.3.3"
                "07ca7frh5lwwvv8x1lq9kcdwindrrni63j0syj5ifiwn28il6959"))

(define rust-deflate64-0.1.10
  (crate-source "deflate64" "0.1.10"
                "012jmx4jrxwdk5d6fbnnxih4zdq9nb0vmjzhqasjkvf5a71qzgr6"))

(define rust-delegate-display-3.0.0
  (crate-source "delegate-display" "3.0.0"
                "0x3sssd2xxhvd2a8rd8081q6xggl318zcsx36d61d514hdn6h9lr"))

(define rust-der-0.7.10
  (crate-source "der" "0.7.10"
                "1jyxacyxdx6mxbkfw99jz59dzvcd9k17rq01a7xvn1dr6wl87hg7"))

(define rust-deranged-0.5.5
  (crate-source "deranged" "0.5.5"
                "11z5939gv2klp1r1lgrp4w5fnlkj18jqqf0h9zxmia3vkrjwpv7c"))

(define rust-derivative-2.2.0
  (crate-source "derivative" "2.2.0"
                "02vpb81wisk2zh1d5f44szzxamzinqgq2k8ydrfjj2wwkrgdvhzw"))

(define rust-derive-arbitrary-1.4.2
  (crate-source "derive_arbitrary" "1.4.2"
                "0annkmfwfavd978vwwrxvrpykjfdnc3w6q1ln3j7kyfg5pc7nmhy"))

(define rust-derive-more-1.0.0
  (crate-source "derive_more" "1.0.0"
                "01cd8pskdjg10dvfchi6b8a9pa1ja1ic0kbn45dl8jdyrfwrk6sa"))

(define rust-derive-more-2.1.1
  (crate-source "derive_more" "2.1.1"
                "0d5i10l4aff744jw7v4n8g6cv15rjk5mp0f1z522pc2nj7jfjlfp"))

(define rust-derive-more-impl-1.0.0
  (crate-source "derive_more-impl" "1.0.0"
                "08mxyd456ygk68v5nfn4dyisn82k647w9ri2jl19dqpvmnp30wyb"))

(define rust-derive-more-impl-2.1.1
  (crate-source "derive_more-impl" "2.1.1"
                "1jwdp836vymp35d7mfvvalplkdgk2683nv3zjlx65n1194k9g6kr"))

(define rust-digest-0.10.7
  (crate-source "digest" "0.10.7"
                "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))

(define rust-dirs-6.0.0
  (crate-source "dirs" "6.0.0"
                "0knfikii29761g22pwfrb8d0nqpbgw77sni9h2224haisyaams63"))

(define rust-dirs-sys-0.5.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "dirs-sys" "0.5.0"
                "1aqzpgq6ampza6v012gm2dppx9k35cdycbj54808ksbys9k366p0"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-dptree-0.5.1
  (crate-source "dptree" "0.5.1"
                "1l1ggrdidhc1vhpvfadfww2a7yxiyb8z2pf7k0x0dzjjry7rd5nv"))

(define rust-dyn-clone-1.0.20
  (crate-source "dyn-clone" "1.0.20"
                "0m956cxcg8v2n8kmz6xs5zl13k2fak3zkapzfzzp7pxih6hix26h"))

(define rust-ed25519-2.2.3
  (crate-source "ed25519" "2.2.3"
                "0lydzdf26zbn82g7xfczcac9d7mzm3qgx934ijjrd5hjpjx32m8i"))

(define rust-ed25519-dalek-2.2.0
  (crate-source "ed25519-dalek" "2.2.0"
                "1agcwij1z687hg26ngzwhnmpz29b2w56m8z1ap3pvrnfh709drvh"))

(define rust-either-1.15.0
  (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-encoding-rs-0.8.35
  (crate-source "encoding_rs" "0.8.35"
                "1wv64xdrr9v37rqqdjsyb8l8wzlcbab80ryxhrszvnj59wy0y0vm"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-erasable-1.3.0
  (crate-source "erasable" "1.3.0"
                "1i7i7a03pk2f1szs1ibwzd1swkkj2nhl2p38cn1fs6c1hxsznz23"))

(define rust-errno-0.3.14
  (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-event-listener-5.4.1
  (crate-source "event-listener" "5.4.1"
                "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1"))

(define rust-event-listener-strategy-0.5.4
  (crate-source "event-listener-strategy" "0.5.4"
                "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb"))

(define rust-eyeball-0.8.8
  (crate-source "eyeball" "0.8.8"
                "0grqzyxfc1nygfa4r9hr9sj6hncpjxpaj29w5lrxcq9xz7mx0fyr"))

(define rust-eyeball-im-0.8.0
  (crate-source "eyeball-im" "0.8.0"
                "0m3pxag0rq00mah1dzn2dsby7lsgq0c839f1cmkb9hl3y4yw1427"))

(define rust-fallible-iterator-0.3.0
  (crate-source "fallible-iterator" "0.3.0"
                "0ja6l56yka5vn4y4pk6hn88z0bpny7a8k1919aqjzp0j1yhy9k1a"))

(define rust-fallible-streaming-iterator-0.1.9
  (crate-source "fallible-streaming-iterator" "0.1.9"
                "0nj6j26p71bjy8h42x6jahx1hn0ng6mc2miwpgwnp8vnwqf4jq3k"))

(define rust-fancy-constructor-2.1.0
  (crate-source "fancy_constructor" "2.1.0"
                "161111wwpfc4ggwhcw4h6wnzjm73wv8f1mmgyli3lpyhlm1pd8i8"))

(define rust-fastrand-2.3.0
  (crate-source "fastrand" "2.3.0"
                "1ghiahsw1jd68df895cy5h3gzwk30hndidn3b682zmshpgmrx41p"))

(define rust-fiat-crypto-0.2.9
  (crate-source "fiat-crypto" "0.2.9"
                "07c1vknddv3ak7w89n85ik0g34nzzpms6yb845vrjnv9m4csbpi8"))

(define rust-find-msvc-tools-0.1.9
  (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-flate2-1.1.9
  (crate-source "flate2" "1.1.9"
                "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

(define rust-foreign-types-0.3.2
  (crate-source "foreign-types" "0.3.2"
                "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn"))

(define rust-foreign-types-shared-0.1.1
  (crate-source "foreign-types-shared" "0.1.1"
                "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00"))

(define rust-form-urlencoded-1.2.2
  (crate-source "form_urlencoded" "1.2.2"
                "1kqzb2qn608rxl3dws04zahcklpplkd5r1vpabwga5l50d2v4k6b"))

(define rust-futf-0.1.5
  (crate-source "futf" "0.1.5"
                "0hvqk2r7v4fnc34hvc3vkri89gn52d5m9ihygmwn75l1hhp0whnz"))

(define rust-futures-0.3.31
  (crate-source "futures" "0.3.31"
                "0xh8ddbkm9jy8kc5gbvjp9a4b6rqqxvc8471yb2qaz5wm2qhgg35"))

(define rust-futures-channel-0.3.31
  (crate-source "futures-channel" "0.3.31"
                "040vpqpqlbk099razq8lyn74m0f161zd0rp36hciqrwcg2zibzrd"))

(define rust-futures-core-0.3.31
  (crate-source "futures-core" "0.3.31"
                "0gk6yrxgi5ihfanm2y431jadrll00n5ifhnpx090c2f2q1cr1wh5"))

(define rust-futures-executor-0.3.31
  (crate-source "futures-executor" "0.3.31"
                "17vcci6mdfzx4gbk0wx64chr2f13wwwpvyf3xd5fb1gmjzcx2a0y"))

(define rust-futures-io-0.3.31
  (crate-source "futures-io" "0.3.31"
                "1ikmw1yfbgvsychmsihdkwa8a1knank2d9a8dk01mbjar9w1np4y"))

(define rust-futures-macro-0.3.31
  (crate-source "futures-macro" "0.3.31"
                "0l1n7kqzwwmgiznn0ywdc5i24z72zvh9q1dwps54mimppi7f6bhn"))

(define rust-futures-sink-0.3.31
  (crate-source "futures-sink" "0.3.31"
                "1xyly6naq6aqm52d5rh236snm08kw8zadydwqz8bip70s6vzlxg5"))

(define rust-futures-task-0.3.31
  (crate-source "futures-task" "0.3.31"
                "124rv4n90f5xwfsm9qw6y99755y021cmi5dhzh253s920z77s3zr"))

(define rust-futures-util-0.3.31
  (crate-source "futures-util" "0.3.31"
                "10aa1ar8bgkgbr4wzxlidkqkcxf77gffyj8j7768h831pcaq784z"))

(define rust-generic-array-0.14.7
  (crate-source "generic-array" "0.14.7"
                "16lyyrzrljfq424c3n8kfwkqihlimmsg5nhshbbp48np3yjrqr45"))

(define rust-getrandom-0.2.17
  (crate-source "getrandom" "0.2.17"
                "1l2ac6jfj9xhpjjgmcx6s1x89bbnw9x6j9258yy6xjkzpq0bqapz"))

(define rust-getrandom-0.3.4
  (crate-source "getrandom" "0.3.4"
                "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9"))

(define rust-glob-0.3.3
  (crate-source "glob" "0.3.3"
                "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc"))

(define rust-gloo-timers-0.3.0
  (crate-source "gloo-timers" "0.3.0"
                "1519157n7xppkk6pdw5w52vy1llzn5iljkqd7q1h5609jv7l7cdv"))

(define rust-gloo-utils-0.2.0
  (crate-source "gloo-utils" "0.2.0"
                "1am31cd6889shb7158bg9zzsjcpvyzxrhfhxgia8rc8k84smam8b"))

(define rust-growable-bloom-filter-2.1.1
  (crate-source "growable-bloom-filter" "2.1.1"
                "1wdnrz1bdsn5lfsc8gim6qg2i96hf1w7kw77549l63b6pascqx6i"))

(define rust-h2-0.4.13
  (crate-source "h2" "0.4.13"
                "0m6w5gg0n0m1m5915bxrv8n4rlazhx5icknkslz719jhh4xdli1g"))

(define rust-hashbrown-0.12.3
  (crate-source "hashbrown" "0.12.3"
                "1268ka4750pyg2pbgsr43f0289l5zah4arir2k4igx5a8c6fg7la"))

(define rust-hashbrown-0.14.5
  (crate-source "hashbrown" "0.14.5"
                "1wa1vy1xs3mp11bn3z9dv0jricgr6a2j0zkf1g19yz3vw4il89z5"))

(define rust-hashbrown-0.15.5
  (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.16.1
  (crate-source "hashbrown" "0.16.1"
                "004i3njw38ji3bzdp9z178ba9x3k0c1pgy8x69pj7yfppv4iq7c4"))

(define rust-hashlink-0.10.0
  (crate-source "hashlink" "0.10.0"
                "1h8lzvnl9qxi3zyagivzz2p1hp6shgddfmccyf6jv7s1cdicz0kk"))

(define rust-headers-0.4.1
  (crate-source "headers" "0.4.1"
                "1sr4zygaq1b2f0k7b5l8vx5vp05wvd82w7vpavgvr52xvdd4scdk"))

(define rust-headers-core-0.3.0
  (crate-source "headers-core" "0.3.0"
                "1r1w80i2bhmyh8s5mjr2dz6baqlrm6cak6yvzm4jq96lacjs5d2l"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.5.2
  (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-hex-0.4.3
  (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-hkdf-0.12.4
  (crate-source "hkdf" "0.12.4"
                "1xxxzcarz151p1b858yn5skmhyrvn8fs4ivx5km3i1kjmnr8wpvv"))

(define rust-hmac-0.12.1
  (crate-source "hmac" "0.12.1"
                "0pmbr069sfg76z7wsssfk5ddcqd9ncp79fyz6zcm6yn115yc6jbc"))

(define rust-html5ever-0.35.0
  (crate-source "html5ever" "0.35.0"
                "1m4yajw7slxqn0x3zdh3i9qlhb03vgdf2pq3la3l8rjbyz15inam"))

(define rust-http-1.4.0
  (crate-source "http" "1.4.0"
                "06iind4cwsj1d6q8c2xgq8i2wka4ps74kmws24gsi1bzdlw2mfp3"))

(define rust-http-auth-0.1.10
  (crate-source "http-auth" "0.1.10"
                "08l8z75cpda5y25cnd5fzgsahb35xn29qlgl9j12dy9f8sls83qm"))

(define rust-http-body-1.0.1
  (crate-source "http-body" "1.0.1"
                "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy"))

(define rust-http-body-util-0.1.3
  (crate-source "http-body-util" "0.1.3"
                "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))

(define rust-httparse-1.10.1
  (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-httpdate-1.0.3
  (crate-source "httpdate" "1.0.3"
                "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))

(define rust-hyper-1.8.1
  (crate-source "hyper" "1.8.1"
                "04cxr8j5y86bhxxlyqb8xkxjskpajk7cxwfzzk4v3my3a3rd9cia"))

(define rust-hyper-rustls-0.27.7
  (crate-source "hyper-rustls" "0.27.7"
                "0n6g8998szbzhnvcs1b7ibn745grxiqmlpg53xz206v826v3xjg3"))

(define rust-hyper-timeout-0.5.2
  (crate-source "hyper-timeout" "0.5.2"
                "1c431l5ckr698248yd6bnsmizjy2m1da02cbpmsnmkpvpxkdb41b"))

(define rust-hyper-tls-0.6.0
  (crate-source "hyper-tls" "0.6.0"
                "1q36x2yps6hhvxq5r7mc8ph9zz6xlb573gx0x3yskb0fi736y83h"))

(define rust-hyper-util-0.1.20
  (crate-source "hyper-util" "0.1.20"
                "186zdc58hmm663csmjvrzgkr6jdh93sfmi3q2pxi57gcaqjpqm4n"))

(define rust-iana-time-zone-0.1.65
  (crate-source "iana-time-zone" "0.1.65"
                "0w64khw5p8s4nzwcf36bwnsmqzf61vpwk9ca1920x82bk6nwj6z3"))

(define rust-iana-time-zone-haiku-0.1.2
  (crate-source "iana-time-zone-haiku" "0.1.2"
                "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k"))

(define rust-icu-collections-2.1.1
  (crate-source "icu_collections" "2.1.1"
                "0hsblchsdl64q21qwrs4hvc2672jrf466zivbj1bwyv606bn8ssc"))

(define rust-icu-locale-core-2.1.1
  (crate-source "icu_locale_core" "2.1.1"
                "1djvdc2f5ylmp1ymzv4gcnmq1s4hqfim9nxlcm173lsd01hpifpd"))

(define rust-icu-normalizer-2.1.1
  (crate-source "icu_normalizer" "2.1.1"
                "16dmn5596la2qm0r3vih0bzjfi0vx9a20yqjha6r1y3vnql8hv2z"))

(define rust-icu-normalizer-data-2.1.1
  (crate-source "icu_normalizer_data" "2.1.1"
                "02jnzizg6q75m41l6c13xc7nkc5q8yr1b728dcgfhpzw076wrvbs"))

(define rust-icu-properties-2.1.2
  (crate-source "icu_properties" "2.1.2"
                "1v3lbmhhi7i6jgw51ikjb1p50qh5rb67grlkdnkc63l7zq1gq2q2"))

(define rust-icu-properties-data-2.1.2
  (crate-source "icu_properties_data" "2.1.2"
                "1bvpkh939rgzrjfdb7hz47v4wijngk0snmcgrnpwc9fpz162jv31"))

(define rust-icu-provider-2.1.1
  (crate-source "icu_provider" "2.1.1"
                "0576b7dizgyhpfa74kacv86y4g1p7v5ffd6c56kf1q82rvq2r5l5"))

(define rust-ident-case-1.0.1
  (crate-source "ident_case" "1.0.1"
                "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-idna-1.1.0
  (crate-source "idna" "1.1.0"
                "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v"))

(define rust-idna-adapter-1.2.1
  (crate-source "idna_adapter" "1.2.1"
                "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis"))

(define rust-imbl-6.1.0
  (crate-source "imbl" "6.1.0"
                "00b53036vmj86q51jirh705ia9gvrhg8jjh9zb8plqi8d2pfib8g"))

(define rust-imbl-sized-chunks-0.1.3
  (crate-source "imbl-sized-chunks" "0.1.3"
                "0bf2abqdcpzw7ma2hirh6w0nxf8ga41bvzmjay6jz9hqaq042hlg"))

(define rust-impartial-ord-1.0.6
  (crate-source "impartial-ord" "1.0.6"
                "1mf6h6ky64djfxyisl6byspy6cwm1v5fpr35zipbmvw5f3p09dha"))

(define rust-include-dir-0.7.4
  (crate-source "include_dir" "0.7.4"
                "1pfh3g45z88kwq93skng0n6g3r7zkhq9ldqs9y8rvr7i11s12gcj"))

(define rust-include-dir-macros-0.7.4
  (crate-source "include_dir_macros" "0.7.4"
                "0x8smnf6knd86g69p19z5lpfsaqp8w0nx14kdpkz1m8bxnkqbavw"))

(define rust-indexmap-1.9.3
  (crate-source "indexmap" "1.9.3"
                "16dxmy7yvk51wvnih3a3im6fp5lmx0wx76i03n06wyak6cwhw1xx"))

(define rust-indexmap-2.13.0
  (crate-source "indexmap" "2.13.0"
                "05qh5c4h2hrnyypphxpwflk45syqbzvqsvvyxg43mp576w2ff53p"))

(define rust-indoc-2.0.7
  (crate-source "indoc" "2.0.7"
                "01np60qdq6lvgh8ww2caajn9j4dibx9n58rvzf7cya1jz69mrkvr"))

(define rust-inout-0.1.4
  (crate-source "inout" "0.1.4"
                "008xfl1jn9rxsq19phnhbimccf4p64880jmnpg59wqi07kk117w7"))

(define rust-instability-0.3.11
  (crate-source "instability" "0.3.11"
                "07f1apjp00nzkwmzfzlfm6p4klddf0g2scgdhqnds66dqq2p4yrm"))

(define rust-ipnet-2.11.0
  (crate-source "ipnet" "2.11.0"
                "0c5i9sfi2asai28m8xp48k5gvwkqrg5ffpi767py6mzsrswv17s6"))

(define rust-iri-string-0.7.10
  (crate-source "iri-string" "0.7.10"
                "06kk3a5jz576p7vrpf7zz9jv3lrgcyp7pczcblcxdnryg3q3h4y9"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-itertools-0.10.5
  (crate-source "itertools" "0.10.5"
                "0ww45h7nxx5kj6z2y6chlskxd1igvs4j507anr6dzg99x1h25zdh"))

(define rust-itertools-0.13.0
  (crate-source "itertools" "0.13.0"
                "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1"))

(define rust-itertools-0.14.0
  (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-itoa-1.0.17
  (crate-source "itoa" "1.0.17"
                "1lh93xydrdn1g9x547bd05g0d3hra7pd1k4jfd2z1pl1h5hwdv4j"))

(define rust-jobserver-0.1.34
  (crate-source "jobserver" "0.1.34"
                "0cwx0fllqzdycqn4d6nb277qx5qwnmjdxdl0lxkkwssx77j3vyws"))

(define rust-js-sys-0.3.85
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.85"
                "1csmb42fxjmzjdgc790bgw77sf1cb9ydm5rdsnh5qj4miszjx54c"))

(define rust-js-int-0.2.2
  (crate-source "js_int" "0.2.2"
                "02hn954yv5wksn26ck6lq19y3a0sswapf82hi65www5jf1agjdyr"))

(define rust-js-option-0.2.0
  (crate-source "js_option" "0.2.0"
                "0g1baplabbdk2yd525w13h6smc294aip9gvkyqy825nx38l3xpf7"))

(define rust-konst-0.3.16
  (crate-source "konst" "0.3.16"
                "1scld0y903rzpnrpq6pgin19czhigkpkliz9xgr53wjm1jqbk0a3"))

(define rust-konst-kernel-0.3.15
  (crate-source "konst_kernel" "0.3.15"
                "0g6c7l852g89f28gbgwf6n68jvhd0slsf5hikdi4r0pki1vypcg4"))

(define rust-language-tags-0.3.2
  (crate-source "language-tags" "0.3.2"
                "124k6w9nx33q4xs8rpa9f7klshrsa0x4f7qngdwq890lpdj5jd6l"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-libc-0.2.182
  (crate-source "libc" "0.2.182"
                "04k1w1mq9f4cxv520dbr5xw1i7xkbc9fcrvaggyjy25jdkdvl038"))

(define rust-libredox-0.1.14
  (crate-source "libredox" "0.1.14"
                "02p3pxlqf54znf1jhiyyjs0i4caf8ckrd5l8ygs4i6ba3nfy6i0p"))

(define rust-libsqlite3-sys-0.35.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libsqlite3-sys" "0.35.0"
                "0gy1m6j1l94fxsirzp4h4rkrksf78rz7jy3px57qd1rcd8m1hg0k"))

(define rust-linux-raw-sys-0.4.15
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.15"
                "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j"))

(define rust-linux-raw-sys-0.11.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "linux-raw-sys" "0.11.0"
                "0fghx0nn8nvbz5yzgizfcwd6ap2pislp68j8c1bwyr6sacxkq7fz"))

(define rust-litemap-0.8.1
  (crate-source "litemap" "0.8.1"
                "0xsy8pfp9s802rsj1bq2ys2kbk1g36w5dr3gkfip7gphb5x60wv3"))

(define rust-lock-api-0.4.14
  (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-log-0.4.29
  (crate-source "log" "0.4.29"
                "15q8j9c8g5zpkcw0hnd6cf2z7fxqnvsjh3rw5mv5q10r83i34l2y"))

(define rust-lru-0.12.5
  (crate-source "lru" "0.12.5"
                "0f1a7cgqxbyhrmgaqqa11m3azwhcc36w0v5r4izgbhadl3sg8k13"))

(define rust-lru-slab-0.1.2
  (crate-source "lru-slab" "0.1.2"
                "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi"))

(define rust-lzma-rs-0.3.0
  (crate-source "lzma-rs" "0.3.0"
                "0phif4pnjrn28zcxgz3a7z86hhx5gdajmkrndfw4vrkahd682zi9"))

(define rust-lzma-sys-0.1.20
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "lzma-sys" "0.1.20"
                "09sxp20waxyglgn3cjz8qjkspb3ryz2fwx4rigkwvrk46ymh9njz"))

(define rust-mac-0.1.1
  (crate-source "mac" "0.1.1"
                "194vc7vrshqff72rl56f9xgb0cazyl4jda7qsv31m5l6xx7hq7n4"))

(define rust-macroific-2.0.0
  (crate-source "macroific" "2.0.0"
                "1182ddahx48yj5p5xk5xnws13xw0153pjgf1y4dri3sbgd9pdwl9"))

(define rust-macroific-attr-parse-2.0.0
  (crate-source "macroific_attr_parse" "2.0.0"
                "1sbb4d55k6kxln4mxm82h6iv0mh4m3k7myyqprmd7z253dv26h5d"))

(define rust-macroific-core-2.0.0
  (crate-source "macroific_core" "2.0.0"
                "1qrkxkgbnxab3qjh8xfk1m0yvafsqlc9szpgbfjnz48l7i6mk9yh"))

(define rust-macroific-macro-2.0.0
  (crate-source "macroific_macro" "2.0.0"
                "0fsbhagnb4lmqj1a98zvxzhxxdivd4nb8lib9skv0qb2g7nz59jd"))

(define rust-maplit-1.0.2
  (crate-source "maplit" "1.0.2"
                "07b5kjnhrrmfhgqm9wprjw8adx6i225lqp49gasgqg74lahnabiy"))

(define rust-markup5ever-0.35.0
  (crate-source "markup5ever" "0.35.0"
                "1hy1xh07jkm13j7vdnsphynl3z7hfmh99csjjvqzhl26jfffc7ri"))

(define rust-match-token-0.35.0
  (crate-source "match_token" "0.35.0"
                "1ksqd8li4kdd463cb2qf10d7d4j1m416y62xbzf47k0g6qzzv15c"))

(define rust-matchers-0.2.0
  (crate-source "matchers" "0.2.0"
                "1sasssspdj2vwcwmbq3ra18d3qniapkimfcbr47zmx6750m5llni"))

(define rust-matchit-0.7.3
  (crate-source "matchit" "0.7.3"
                "156bgdmmlv4crib31qhgg49nsjk88dxkdqp80ha2pk2rk6n6ax0f"))

(define rust-matrix-pickle-0.2.2
  (crate-source "matrix-pickle" "0.2.2"
                "1gsxjfm85yhm2pcsgqps1w0fdm0cnhind99ckx2l0mqlcpdycd3c"))

(define rust-matrix-pickle-derive-0.2.2
  (crate-source "matrix-pickle-derive" "0.2.2"
                "0nr8wqz12l2imgn23vk7sw9a8z76kapb5p0naiazc8zqh6czqqm9"))

(define rust-matrix-sdk-0.16.0
  (crate-source "matrix-sdk" "0.16.0"
                "1q5c73w6r7dal6pyd6vlwramrnjl0v9zs88m2qjqwzyxbv29ngxk"))

(define rust-matrix-sdk-base-0.16.0
  (crate-source "matrix-sdk-base" "0.16.0"
                "1r65hj59g7ap9rk9lfkjjdmcwq5yd6qrc53b88yag67zj2ih9x3h"))

(define rust-matrix-sdk-common-0.16.0
  (crate-source "matrix-sdk-common" "0.16.0"
                "1ifcqi69ryz3350pkqyylgclhp6vnlv20vadm0hhsxixzjyy5yjl"))

(define rust-matrix-sdk-crypto-0.16.0
  (crate-source "matrix-sdk-crypto" "0.16.0"
                "17zrp3jcvqwnl54qlrkpyqjc93km7i0dcjhwhfxii5hah5vcakrh"))

(define rust-matrix-sdk-indexeddb-0.16.0
  (crate-source "matrix-sdk-indexeddb" "0.16.0"
                "1sf3grwi3hxqbqhmmhwp026yiwfh6ias57167v03kly89h49cq0v"))

(define rust-matrix-sdk-sqlite-0.16.0
  (crate-source "matrix-sdk-sqlite" "0.16.0"
                "0a6cpa7x00bvnqrd98bskfqa8vmh6bxyhfgc1v47azvbq0pp89a3"))

(define rust-matrix-sdk-store-encryption-0.16.0
  (crate-source "matrix-sdk-store-encryption" "0.16.0"
                "08v3q8gd0xgi8nps5i3fvwrz5f81m9rfmfhfbkrcxm8l67l96ahn"))

(define rust-matrix-indexed-db-futures-0.7.0
  (crate-source "matrix_indexed_db_futures" "0.7.0"
                "1r58zq4wpz07n3cbvs29imq14qdldrddv8nxj067ppxl4jigcpr4"))

(define rust-matrix-indexed-db-futures-macros-internal-1.0.0
  (crate-source "matrix_indexed_db_futures_macros_internal" "1.0.0"
                "1lb67wz6vzfi882ar6lq8k21hiznny4x56cysammp7pyq3jswa5l"))

(define rust-memchr-2.8.0
  (crate-source "memchr" "2.8.0"
                "0y9zzxcqxvdqg6wyag7vc3h0blhdn7hkq164bxyx2vph8zs5ijpq"))

(define rust-mime-0.3.17
  (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-mime2ext-0.1.54
  (crate-source "mime2ext" "0.1.54"
                "1z11pfc74s3sjlibqizx51l03yacw8ywsiiq4g2l5347f1hg7xnb"))

(define rust-mime-guess-2.0.5
  (crate-source "mime_guess" "2.0.5"
                "03jmg3yx6j39mg0kayf7w4a886dl3j15y8zs119zw01ccy74zi7p"))

(define rust-minimal-lexical-0.2.1
  (crate-source "minimal-lexical" "0.2.1"
                "16ppc5g84aijpri4jzv14rvcnslvlpphbszc7zzp6vfkddf4qdb8"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.1.1
  (crate-source "mio" "1.1.1"
                "1z2phpalqbdgihrcjp8y09l3kgq6309jnhnr6h11l9s7mnqcm6x6"))

(define rust-native-tls-0.2.14
  (crate-source "native-tls" "0.2.14"
                "03hga800x8bzkp8h7frnm7yp545dwwawgmaq673vx7byk1139pl7"))

(define rust-new-debug-unreachable-1.0.6
  (crate-source "new_debug_unreachable" "1.0.6"
                "11phpf1mjxq6khk91yzcbd3ympm78m3ivl7xg6lg2c0lf66fy3k5"))

(define rust-nix-0.31.2
  (crate-source "nix" "0.31.2"
                "1lzmcqcnb9z8l4aq5ympx71bcwc0y5yf7d8jv6hnn7hc682hfvax"))

(define rust-nom-7.1.3
  (crate-source "nom" "7.1.3"
                "0jha9901wxam390jcf5pfa0qqfrgh8li787jx2ip0yk5b8y9hwyj"))

(define rust-nu-ansi-term-0.50.3
  (crate-source "nu-ansi-term" "0.50.3"
                "1ra088d885lbd21q1bxgpqdlk1zlndblmarn948jz2a40xsbjmvr"))

(define rust-num-conv-0.2.0
  (crate-source "num-conv" "0.2.0"
                "0l4hj7lp8zbb9am4j3p7vlcv47y9bbazinvnxx9zjhiwkibyr5yg"))

(define rust-num-traits-0.2.19
  (crate-source "num-traits" "0.2.19"
                "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))

(define rust-num-cpus-1.17.0
  (crate-source "num_cpus" "1.17.0"
                "0fxjazlng4z8cgbmsvbzv411wrg7x3hyxdq8nxixgzjswyylppwi"))

(define rust-oauth2-5.0.0
  (crate-source "oauth2" "5.0.0"
                "0zfn67m93qfh9gyxxx1hj6yprk9dkr3hm1mi4ni23pqlj3kikqji"))

(define rust-object-0.37.3
  (crate-source "object" "0.37.3"
                "1zikiy9xhk6lfx1dn2gn2pxbnfpmlkn0byd7ib1n720x0cgj0xpz"))

(define rust-once-cell-1.21.3
  (crate-source "once_cell" "1.21.3"
                "0b9x77lb9f1j6nqgf5aka4s2qj0nly176bpbrv6f9iakk5ff3xa2"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-opaque-debug-0.3.1
  (crate-source "opaque-debug" "0.3.1"
                "10b3w0kydz5jf1ydyli5nv10gdfp97xh79bgz327d273bs46b3f0"))

(define rust-openssl-0.10.75
  (crate-source "openssl" "0.10.75"
                "0a238gvrzjq0r62a7472i685hi5jjzgfj72kp1xd32ir46qqv0q8"))

(define rust-openssl-macros-0.1.1
  (crate-source "openssl-macros" "0.1.1"
                "173xxvfc63rr5ybwqwylsir0vq6xsj4kxiv4hmg4c3vscdmncj59"))

(define rust-openssl-probe-0.1.6
  (crate-source "openssl-probe" "0.1.6"
                "0bl52x55laalqb707k009h8kfawliwp992rlsvkzy49n47p2fpnh"))

(define rust-openssl-sys-0.9.111
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "openssl-sys" "0.9.111"
                "08f3mpsabivfi3fd0qv9231qidqy68lr8a4qi32y6xda43av5jl2"))

(define rust-opentelemetry-0.28.0
  (crate-source "opentelemetry" "0.28.0"
                "09k43sgaarw3zx5j434ngq1canpcjibsbxaqqa8dyp0acxxncvi3"))

(define rust-opentelemetry-proto-0.28.0
  (crate-source "opentelemetry-proto" "0.28.0"
                "0vbl4si1mny87pmqxxg6wday45pcc8bvpcrf46cpwwi4606qgy2n"))

(define rust-opentelemetry-sdk-0.28.0
  (crate-source "opentelemetry_sdk" "0.28.0"
                "0w4mycm070f4knvi1x5v199apd1fvi0712qiyv0pz70889havpw4"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-parking-2.2.1
  (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.5
  (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-password-hash-0.5.0
  (crate-source "password-hash" "0.5.0"
                "0ri1mim11zk0a9s40zdi288dfqvmdiryc7lw8vl46b59ifa08vrl"))

(define rust-paste-1.0.15
  (crate-source "paste" "1.0.15"
                "02pxffpdqkapy292harq6asfjvadgp1s005fip9ljfsn9fvxgh2p"))

(define rust-pastey-0.2.1
  (crate-source "pastey" "0.2.1"
                "1v2vyc6gnk2qkwvrhzlkf67rwv4car122ix6mb9vp487gkcwlrxq"))

(define rust-pbkdf2-0.12.2
  (crate-source "pbkdf2" "0.12.2"
                "1wms79jh4flpy1zi8xdp4h8ccxv4d85adc6zjagknvppc5vnmvgq"))

(define rust-percent-encoding-2.3.2
  (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-phf-0.11.3
  (crate-source "phf" "0.11.3"
                "0y6hxp1d48rx2434wgi5g8j1pr8s5jja29ha2b65435fh057imhz"))

(define rust-phf-0.12.1
  (crate-source "phf" "0.12.1"
                "1dz85g1wshfca83mrq3va9rm9n8qcdjlpv1i3908y5zc9j4p6cli"))

(define rust-phf-codegen-0.11.3
  (crate-source "phf_codegen" "0.11.3"
                "0si1n6zr93kzjs3wah04ikw8z6npsr39jw4dam8yi9czg2609y5f"))

(define rust-phf-generator-0.11.3
  (crate-source "phf_generator" "0.11.3"
                "0gc4np7s91ynrgw73s2i7iakhb4lzdv1gcyx7yhlc0n214a2701w"))

(define rust-phf-shared-0.11.3
  (crate-source "phf_shared" "0.11.3"
                "1rallyvh28jqd9i916gk5gk2igdmzlgvv5q0l3xbf3m6y8pbrsk7"))

(define rust-phf-shared-0.12.1
  (crate-source "phf_shared" "0.12.1"
                "10cr16wpmbjxd7w6k98sxw9yw3zxnzscybl9jzyq3digi045a006"))

(define rust-pin-project-1.1.10
  (crate-source "pin-project" "1.1.10"
                "12kadbnfm1f43cyadw9gsbyln1cy7vj764wz5c8wxaiza3filzv7"))

(define rust-pin-project-internal-1.1.10
  (crate-source "pin-project-internal" "1.1.10"
                "0qgqzfl0f4lzaz7yl5llhbg97g68r15kljzihaw9wm64z17qx4bf"))

(define rust-pin-project-lite-0.2.16
  (crate-source "pin-project-lite" "0.2.16"
                "16wzc7z7dfkf9bmjin22f5282783f6mdksnr0nv0j5ym5f9gyg1v"))

(define rust-pin-utils-0.1.0
  (crate-source "pin-utils" "0.1.0"
                "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb"))

(define rust-pkcs8-0.10.2
  (crate-source "pkcs8" "0.10.2"
                "1dx7w21gvn07azszgqd3ryjhyphsrjrmq5mmz1fbxkj5g0vv4l7r"))

(define rust-pkg-config-0.3.32
  (crate-source "pkg-config" "0.3.32"
                "0k4h3gnzs94sjb2ix6jyksacs52cf1fanpwsmlhjnwrdnp8dppby"))

(define rust-poly1305-0.8.0
  (crate-source "poly1305" "0.8.0"
                "1grs77skh7d8vi61ji44i8gpzs3r9x7vay50i6cg8baxfa8bsnc1"))

(define rust-potential-utf-0.1.4
  (crate-source "potential_utf" "0.1.4"
                "0xxg0pkfpq299wvwln409z4fk80rbv55phh3f1jhjajy5x1ljfdp"))

(define rust-powerfmt-0.2.0
  (crate-source "powerfmt" "0.2.0"
                "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppv-lite86-0.2.21
  (crate-source "ppv-lite86" "0.2.21"
                "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5"))

(define rust-precomputed-hash-0.1.1
  (crate-source "precomputed-hash" "0.1.1"
                "075k9bfy39jhs53cb2fpb9klfakx2glxnf28zdw08ws6lgpq6lwj"))

(define rust-proc-macro-crate-3.4.0
  (crate-source "proc-macro-crate" "3.4.0"
                "10v9qi51n4phn1lrj5r94kjq7yhci9jrkqnn6wpan05yjsgb3711"))

(define rust-proc-macro-error-attr2-2.0.0
  (crate-source "proc-macro-error-attr2" "2.0.0"
                "1ifzi763l7swl258d8ar4wbpxj4c9c2im7zy89avm6xv6vgl5pln"))

(define rust-proc-macro-error2-2.0.1
  (crate-source "proc-macro-error2" "2.0.1"
                "00lq21vgh7mvyx51nwxwf822w2fpww1x0z8z0q47p8705g2hbv0i"))

(define rust-proc-macro2-1.0.106
  (crate-source "proc-macro2" "1.0.106"
                "0d09nczyaj67x4ihqr5p7gxbkz38gxhk4asc0k8q23g9n85hzl4g"))

(define rust-process-wrap-9.0.3
  (crate-source "process-wrap" "9.0.3"
                "0sjj0sfxmq5m63k4clcr5ifkcfg3knw332rqmj2kq769w8zp3nfc"))

(define rust-prost-0.13.5
  (crate-source "prost" "0.13.5"
                "1r8yi6zxxwv9gq5ia9p55nspgwmchs94sqpp64x33v5k3njgm5i7"))

(define rust-prost-derive-0.13.5
  (crate-source "prost-derive" "0.13.5"
                "0kgc9gbzsa998xixblfi3kfydka64zqf6rmpm53b761cjxbxfmla"))

(define rust-psm-0.1.29
  (crate-source "psm" "0.1.29"
                "0b8yhqrgz288k9ks23qqmhcv4khc693k961yvbb33vbm2awnra8z"))

(define rust-quinn-0.11.9
  (crate-source "quinn" "0.11.9"
                "086gzj666dr3slmlynkvxlndy28hahgl361d6bf93hk3i6ahmqmr"))

(define rust-quinn-proto-0.11.13
  (crate-source "quinn-proto" "0.11.13"
                "0cca3mgja9p4w66f6sl1kfhj8rdf4mwsg1jxzssh9g63n14np47i"))

(define rust-quinn-udp-0.5.14
  (crate-source "quinn-udp" "0.5.14"
                "1gacawr17a2zkyri0r3m0lc9spzmxbq1by3ilyb8v2mdvjhcdpmd"))

(define rust-quote-1.0.44
  (crate-source "quote" "1.0.44"
                "1r7c7hxl66vz3q9qizgjhy77pdrrypqgk4ghc7260xvvfb7ypci1"))

(define rust-r-efi-5.3.0
  (crate-source "r-efi" "5.3.0"
                "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9"))

(define rust-rand-0.8.5
  (crate-source "rand" "0.8.5"
                "013l6931nn7gkc23jz5mm3qdhf93jjf0fg64nz2lp4i51qd8vbrl"))

(define rust-rand-0.9.2
  (crate-source "rand" "0.9.2"
                "1lah73ainvrgl7brcxx0pwhpnqa3sm3qaj672034jz8i0q7pgckd"))

(define rust-rand-chacha-0.3.1
  (crate-source "rand_chacha" "0.3.1"
                "123x2adin558xbhvqb8w4f6syjsdkmqff8cxwhmjacpsl1ihmhg6"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.6.4
  (crate-source "rand_core" "0.6.4"
                "0b4j2v4cb5krak1pv6kakv4sz6xcwbrmy2zckc32hsigbrwy82zc"))

(define rust-rand-core-0.9.5
  (crate-source "rand_core" "0.9.5"
                "0g6qc5r3f0hdmz9b11nripyp9qqrzb0xqk9piip8w8qlvqkcibvn"))

(define rust-rand-xoshiro-0.7.0
  (crate-source "rand_xoshiro" "0.7.0"
                "0h9dv9mn703zb2z5dys7vc4rzy3az8xg99fc5m8zbnh0axkg80zp"))

(define rust-ratatui-0.29.0
  (crate-source "ratatui" "0.29.0"
                "0yqiccg1wmqqxpb2sz3q2v3nifmhsrfdsjgwhc2w40bqyg199gga"))

(define rust-rc-box-1.3.0
  (crate-source "rc-box" "1.3.0"
                "1l6siaf5nlsp0c762pk27c1b0fgpdpl3bsgr112bvzn6zb4yqzw9"))

(define rust-readlock-0.1.11
  (crate-source "readlock" "0.1.11"
                "0d1znmc3ykr65fkbrwgm5w0gi3mdw85mlrdgxpcysmimna8z59kd"))

(define rust-readlock-tokio-0.1.6
  (crate-source "readlock-tokio" "0.1.6"
                "1zyq7cyy3gq0gq5mgwvq6awg6p6bwzl19wp2x09d3wy4kr7jczpw"))

(define rust-redox-syscall-0.5.18
  (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-redox-users-0.5.2
  (crate-source "redox_users" "0.5.2"
                "1b17q7gf7w8b1vvl53bxna24xl983yn7bd00gfbii74bcg30irm4"))

(define rust-ref-cast-1.0.25
  (crate-source "ref-cast" "1.0.25"
                "0zdzc34qjva9xxgs889z5iz787g81hznk12zbk4g2xkgwq530m7k"))

(define rust-ref-cast-impl-1.0.25
  (crate-source "ref-cast-impl" "1.0.25"
                "1nkhn1fklmn342z5c4mzfzlxddv3x8yhxwwk02cj06djvh36065p"))

(define rust-regex-1.12.3
  (crate-source "regex" "1.12.3"
                "0xp2q0x7ybmpa5zlgaz00p8zswcirj9h8nry3rxxsdwi9fhm81z1"))

(define rust-regex-automata-0.4.14
  (crate-source "regex-automata" "0.4.14"
                "13xf7hhn4qmgfh784llcp2kzrvljd13lb2b1ca0mwnf15w9d87bf"))

(define rust-regex-syntax-0.8.9
  (crate-source "regex-syntax" "0.8.9"
                "0k0a47r1rcl794wj8a948niakbg081s5pp5nlgcbmmr2iy3qfs59"))

(define rust-reqwest-0.12.28
  (crate-source "reqwest" "0.12.28"
                "0iqidijghgqbzl3bjg5hb4zmigwa4r612bgi0yiq0c90b6jkrpgd"))

(define rust-reqwest-0.13.2
  (crate-source "reqwest" "0.13.2"
                "00d8xyrbcp0519rr9rhl685ymb6hi3lv0i2bca5lic9s53il6gxb"))

(define rust-rgb-0.8.52
  (crate-source "rgb" "0.8.52"
                "1km115a9lblf9pldvx51dmmg30y8ms4ka67hvas2ndcq556qhshc"))

(define rust-ring-0.17.14
  (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-rmcp-1.1.0
  (crate-source "rmcp" "1.1.0"
                "147hjpnspmx14ij2048j6s7w4b6azq63r7sci2p2x8bqjb5i9jyj"))

(define rust-rmcp-macros-1.1.0
  (crate-source "rmcp-macros" "1.1.0"
                "1m8sqgpb9jz1llv1jlw4zd8kv0mnk37wfshmzvhhfas8v60yl0ka"))

(define rust-rmp-0.8.15
  (crate-source "rmp" "0.8.15"
                "033rwyzxyj5f7iviacvcz1y2wmlbadw1cma2anrwkckjsdrbxa2b"))

(define rust-rmp-serde-1.3.1
  (crate-source "rmp-serde" "1.3.1"
                "0md1cx5w0hwc40nb55z3c4j26b4npkmp06k8s5vvbycfikp1py3j"))

(define rust-ruma-0.14.1
  (crate-source "ruma" "0.14.1"
                "1fzsl72hx8n8z79bjsrzdlkfrwk7vzf62vi5z61303bd26i21xm9"))

(define rust-ruma-client-api-0.22.1
  (crate-source "ruma-client-api" "0.22.1"
                "1rskxvmgr7qhk24n6cw88s23f9aaxl2p1gbci77mv88ym78pgjfv"))

(define rust-ruma-common-0.17.1
  (crate-source "ruma-common" "0.17.1"
                "0nqp2dgfvhy8w8kgb7r6jmg7g5bkbrkng4kw1cr93li27ych2yjr"))

(define rust-ruma-events-0.32.1
  (crate-source "ruma-events" "0.32.1"
                "01wrrfwzvys1f8dz38vqgk7gvh6b52xfhp9jh8rgwkybcb5yrg9d"))

(define rust-ruma-federation-api-0.13.1
  (crate-source "ruma-federation-api" "0.13.1"
                "01c3ndb4n5140a7bssvmpvnn9jz7yc6vk9hkc6f2kx6vp8amrd6w"))

(define rust-ruma-html-0.6.0
  (crate-source "ruma-html" "0.6.0"
                "1zsld76ha700l6n2c7rqxaza4f1z84xcvlv0ak8pgq93k1pcsvbs"))

(define rust-ruma-identifiers-validation-0.12.0
  (crate-source "ruma-identifiers-validation" "0.12.0"
                "1zimgkkpilb14gv0yi6vj4aixnf5s90zpb6pr47yrgk061jbbin9"))

(define rust-ruma-macros-0.17.1
  (crate-source "ruma-macros" "0.17.1"
                "09jlzlix85zb78s16vzzascbmdi6wgr2nx715m3aqxym58qm61qa"))

(define rust-ruma-signatures-0.19.0
  (crate-source "ruma-signatures" "0.19.0"
                "024fddma2z7ajvcgba8q3phf74bagr7ah0g8sf0fqq4vslncwshl"))

(define rust-rusqlite-0.37.0
  (crate-source "rusqlite" "0.37.0"
                "0gqzwykyfaaddq5rg1jk0940wby6ifarnwp3fcakbq90ggjscp0n"))

(define rust-rustc-hash-2.1.1
  (crate-source "rustc-hash" "2.1.1"
                "03gz5lvd9ghcwsal022cgkq67dmimcgdjghfb5yb5d352ga06xrm"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustix-0.38.44
  (crate-source "rustix" "0.38.44"
                "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx"))

(define rust-rustix-1.1.3
  (crate-source "rustix" "1.1.3"
                "0d0z2zcw4rwzni1hm8snw8xdxwwrij336m31c4ghq66cghj9wv0l"))

(define rust-rustls-0.22.4
  (crate-source "rustls" "0.22.4"
                "0cl4q6w0x1cl5ldjsgbbiiqhkz6qg5vxl5dkn9wwsyxc44vzfkmz"))

(define rust-rustls-0.23.36
  (crate-source "rustls" "0.23.36"
                "06w0077ssk3blpp93613lkny046mwj0nhxjgc7cmg9nf70yz6rf6"))

(define rust-rustls-pki-types-1.14.0
  (crate-source "rustls-pki-types" "1.14.0"
                "1p9zsgslvwzzkzhm6bqicffqndr4jpx67992b0vl0pi21a5hy15y"))

(define rust-rustls-webpki-0.102.8
  (crate-source "rustls-webpki" "0.102.8"
                "1sdy8ks86b7jpabpnb2px2s7f1sq8v0nqf6fnlvwzm4vfk41pjk4"))

(define rust-rustls-webpki-0.103.9
  (crate-source "rustls-webpki" "0.103.9"
                "0lwg1nnyv7pp2lfwwjhy81bxm233am99jnsp3iymdhd6k8827pyp"))

(define rust-rustversion-1.0.22
  (crate-source "rustversion" "1.0.22"
                "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k"))

(define rust-ryu-1.0.22
  (crate-source "ryu" "1.0.22"
                "1139acr2kd4n8p36bp1n42xrpaphn6dhwklnazh8hpdnfps4q3x5"))

(define rust-schannel-0.1.28
  (crate-source "schannel" "0.1.28"
                "1qb6s5gyxfz2inz753a4z3mc1d266mwvz0c5w7ppd3h44swq27c9"))

(define rust-schemars-0.9.0
  (crate-source "schemars" "0.9.0"
                "0pqncln5hqbzbl2r3yayyr4a82jjf93h2cfxrn0xamvx77wr3lac"))

(define rust-schemars-1.2.1
  (crate-source "schemars" "1.2.1"
                "1k16qzpdpy6p9hrh18q2l6cwawxzyqi25f8masa13l0wm8v2zd52"))

(define rust-schemars-derive-1.2.1
  (crate-source "schemars_derive" "1.2.1"
                "0zrh1ckcc63sqy5hyhnh2lbxh4vmbij2z4f1g5za1vmayi85n4bx"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-sealed-0.6.0
  (crate-source "sealed" "0.6.0"
                "01y1mf4f4j6d2x5307gcvagkkz5jwz2w2jdlf3k5bm93xb2niy92"))

(define rust-secrecy-0.8.0
  (crate-source "secrecy" "0.8.0"
                "07p9h2bpkkg61f1fzzdqqbf74kwv1gg095r1cdmjzzbcl17cblcv"))

(define rust-security-framework-2.11.1
  (crate-source "security-framework" "2.11.1"
                "00ldclwx78dm61v7wkach9lcx76awlrv0fdgjdwch4dmy12j4yw9"))

(define rust-security-framework-sys-2.15.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "security-framework-sys" "2.15.0"
                "1h6mijxnfrwvl1y4dzwn3m877j6dqp9qn3g37i954j5czazhq7yc"))

(define rust-semver-1.0.27
  (crate-source "semver" "1.0.27"
                "1qmi3akfrnqc2hfkdgcxhld5bv961wbk8my3ascv5068mc5fnryp"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-wasm-bindgen-0.6.5
  (crate-source "serde-wasm-bindgen" "0.6.5"
                "0sz1l4v8059hiizf5z7r2spm6ws6sqcrs4qgqwww3p7dy1ly20l3"))

(define rust-serde-bytes-0.11.19
  (crate-source "serde_bytes" "0.11.19"
                "1a1y1v0r9akqyvprxnmpgc0i8wybqqpvgi01mi8qxn3rkrq41m55"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-cow-0.1.2
  (crate-source "serde_cow" "0.1.2"
                "1nmplkb2bvk7iqijh01856b89h4783inajxmb8jxxgwnf7nbnyqy"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-derive-internals-0.29.1
  (crate-source "serde_derive_internals" "0.29.1"
                "04g7macx819vbnxhi52cx0nhxi56xlhrybgwybyy7fb9m4h6mlhq"))

(define rust-serde-html-form-0.2.8
  (crate-source "serde_html_form" "0.2.8"
                "0kqmp0m7vj8lrs1n2hjcp1jhhpzw81f9ycmv30vk6h11ibzxgwmj"))

(define rust-serde-json-1.0.149
  (crate-source "serde_json" "1.0.149"
                "11jdx4vilzrjjd1dpgy67x5lgzr0laplz30dhv75lnf5ffa07z43"))

(define rust-serde-path-to-error-0.1.20
  (crate-source "serde_path_to_error" "0.1.20"
                "0mxls44p2ycmnxh03zpnlxxygq42w61ws7ir7r0ba6rp5s1gza8h"))

(define rust-serde-spanned-1.0.4
  (crate-source "serde_spanned" "1.0.4"
                "0xkp0qdzams5sqwndbw3xrhf4c0bb5r46w2ywkp1aqsdb8ggkfzq"))

(define rust-serde-urlencoded-0.7.1
  (crate-source "serde_urlencoded" "0.7.1"
                "1zgklbdaysj3230xivihs30qi5vkhigg323a9m62k8jwf4a1qjfk"))

(define rust-serde-with-3.16.1
  (crate-source "serde_with" "3.16.1"
                "1rz2824yhfn5n5vxmnnk01x7d3xrf2122jinw0wd4h3lh3r3g8jg"))

(define rust-serde-with-macros-3.16.1
  (crate-source "serde_with_macros" "3.16.1"
                "0v3hfn474ny4as1gwvqgrhjzk9p5959gjl5bf0gi4ad61k5f7a2j"))

(define rust-serde-yaml-0.9.34+deprecated
  (crate-source "serde_yaml" "0.9.34+deprecated"
                "0isba1fjyg3l6rxk156k600ilzr8fp7crv82rhal0rxz5qd1m2va"))

(define rust-serenity-0.12.5
  (crate-source "serenity" "0.12.5"
                "0hbmy711df5yn1iig56104qrmxzv9b4f0fd0w8sdrpv54zs3gplv"))

(define rust-sha1-0.10.6
  (crate-source "sha1" "0.10.6"
                "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha2-0.10.9
  (crate-source "sha2" "0.10.9"
                "10xjj843v31ghsksd9sl9y12qfc48157j1xpb8v1ml39jy0psl57"))

(define rust-sharded-slab-0.1.7
  (crate-source "sharded-slab" "0.1.7"
                "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shellexpand-3.1.2
  (crate-source "shellexpand" "3.1.2"
                "1n3y55yvh2s8cqmqb6bnz4wrlhchjd489fn1dpcc9rhnbsmlz0ij"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-signal-hook-0.3.18
  (crate-source "signal-hook" "0.3.18"
                "1qnnbq4g2vixfmlv28i1whkr0hikrf1bsc4xjy2aasj2yina30fq"))

(define rust-signal-hook-mio-0.2.5
  (crate-source "signal-hook-mio" "0.2.5"
                "1k20rr76ngvmzr6kskkl7dv8iyb84cbydpjbjk3mpcj0lykijnmp"))

(define rust-signal-hook-registry-1.4.8
  (crate-source "signal-hook-registry" "1.4.8"
                "06vc7pmnki6lmxar3z31gkyg9cw7py5x9g7px70gy2hil75nkny4"))

(define rust-signature-2.2.0
  (crate-source "signature" "2.2.0"
                "1pi9hd5vqfr3q3k49k37z06p7gs5si0in32qia4mmr1dancr6m3p"))

(define rust-simd-adler32-0.3.8
  (crate-source "simd-adler32" "0.3.8"
                "18lx2gdgislabbvlgw5q3j5ssrr77v8kmkrxaanp3liimp2sc873"))

(define rust-siphasher-1.0.2
  (crate-source "siphasher" "1.0.2"
                "13k7cfbpcm8qgj9p2n8dwg9skv9s0hxk5my30j5chy1p4l78bamj"))

(define rust-slab-0.4.12
  (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-smallvec-1.15.1
  (crate-source "smallvec" "1.15.1"
                "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7"))

(define rust-socket2-0.5.10
  (crate-source "socket2" "0.5.10"
                "0y067ki5q946w91xlz2sb175pnfazizva6fi3kfp639mxnmpc8z2"))

(define rust-socket2-0.6.2
  (crate-source "socket2" "0.6.2"
                "1q073zkvz96h216mfz6niqk2kjqrgqv2va6zj34qh84zv4xamx46"))

(define rust-spki-0.7.3
  (crate-source "spki" "0.7.3"
                "17fj8k5fmx4w9mp27l970clrh5qa7r5sjdvbsln987xhb34dc7nr"))

(define rust-sqlite-vec-0.1.7-alpha.10
  (crate-source "sqlite-vec" "0.1.7-alpha.10"
                "14ia6y1rnb3f3qx72xkhr30a0av75kp5apg1v001hhcbg3jx5nnr"))

(define rust-sse-stream-0.2.1
  (crate-source "sse-stream" "0.2.1"
                "16j734awsc6rmaxhap6z3xp6a8hr6l563dc6sckizv387k9w8kgb"))

(define rust-stable-deref-trait-1.2.1
  (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-stacker-0.1.22
  (crate-source "stacker" "0.1.22"
                "0nbfvmqw9bsawv9g0k4bqilxkl7cszrb5dpfxnjcxbranjgv5y71"))

(define rust-static-assertions-1.1.0
  (crate-source "static_assertions" "1.1.0"
                "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2"))

(define rust-string-cache-0.8.9
  (crate-source "string_cache" "0.8.9"
                "03z7km2kzlwiv2r2qifq5riv4g8phazwng9wnvs3py3lzainnxxz"))

(define rust-string-cache-codegen-0.5.4
  (crate-source "string_cache_codegen" "0.5.4"
                "181ir4d6y053s1kka2idpjx5g9d9jgll6fy517jhzzpi2n3r44f7"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-strum-0.26.3
  (crate-source "strum" "0.26.3"
                "01lgl6jvrf4j28v5kmx9bp480ygf1nhvac8b4p7rcj9hxw50zv4g"))

(define rust-strum-macros-0.26.4
  (crate-source "strum_macros" "0.26.4"
                "1gl1wmq24b8md527cpyd5bw9rkbqldd7k1h38kf5ajd2ln2ywssc"))

(define rust-subtle-2.6.1
  (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-syn-1.0.109
  (crate-source "syn" "1.0.109"
                "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))

(define rust-syn-2.0.114
  (crate-source "syn" "2.0.114"
                "0akw62dizhyrkf3ym1jsys0gy1nphzgv0y8qkgpi6c1s4vghglfl"))

(define rust-sync-wrapper-1.0.2
  (crate-source "sync_wrapper" "1.0.2"
                "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb"))

(define rust-synstructure-0.13.2
  (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-system-configuration-0.7.0
  (crate-source "system-configuration" "0.7.0"
                "12rwilylzc625qnxl30h5kf8wj5ka61zjrwpmb034cd0mc6ksgx1"))

(define rust-system-configuration-sys-0.6.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "system-configuration-sys" "0.6.0"
                "1i5sqrmgy58l4704hibjbl36hclddglh73fb3wx95jnmrq81n7cf"))

(define rust-take-mut-0.2.2
  (crate-source "take_mut" "0.2.2"
                "0q2d7w6nd5bl7bay5csq065sjg8fw0jcx6hl1983cpzf25fh0r7p"))

(define rust-takecell-0.1.1
  (crate-source "takecell" "0.1.1"
                "0gpzcnazzwl6mq7xzbk9jf5zd0959h6310ls1ibapp3ccwwl7wr0"))

(define rust-teloxide-0.17.0
  (crate-source "teloxide" "0.17.0"
                "07pp8msid0cpdcpx4ndy1bpivfmw29njcpdj0622xr1sxnz2m6c4"))

(define rust-teloxide-core-0.13.0
  (crate-source "teloxide-core" "0.13.0"
                "1i0bdrym2pnkl7ma9r029bpkiqbzah3qr19kws9ah7wpiv538ykz"))

(define rust-teloxide-macros-0.10.0
  (crate-source "teloxide-macros" "0.10.0"
                "1ya2770f43nrbx009iq0by94i6nw8lxg42x1bjdz30n1y35as3rh"))

(define rust-tempfile-3.24.0
  (crate-source "tempfile" "3.24.0"
                "171fz3h6rj676miq15fyv1hnv69p426mlp8489bwa1b3xg3sjpb5"))

(define rust-tendril-0.4.3
  (crate-source "tendril" "0.4.3"
                "1c3vip59sqwxn148i714nmkrvjzbk7105vj0h92s6r64bw614jnj"))

(define rust-thiserror-1.0.69
  (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-2.0.18
  (crate-source "thiserror" "2.0.18"
                "1i7vcmw9900bvsmay7mww04ahahab7wmr8s925xc083rpjybb222"))

(define rust-thiserror-impl-1.0.69
  (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-thiserror-impl-2.0.18
  (crate-source "thiserror-impl" "2.0.18"
                "1mf1vrbbimj1g6dvhdgzjmn6q09yflz2b92zs1j9n3k7cxzyxi7b"))

(define rust-thread-local-1.1.9
  (crate-source "thread_local" "1.1.9"
                "1191jvl8d63agnq06pcnarivf63qzgpws5xa33hgc92gjjj4c0pn"))

(define rust-time-0.3.47
  (crate-source "time" "0.3.47"
                "0b7g9ly2iabrlgizliz6v5x23yq5d6bpp0mqz6407z1s526d8fvl"))

(define rust-time-core-0.1.8
  (crate-source "time-core" "0.1.8"
                "1jidl426mw48i7hjj4hs9vxgd9lwqq4vyalm4q8d7y4iwz7y353n"))

(define rust-time-macros-0.2.27
  (crate-source "time-macros" "0.2.27"
                "058ja265waq275wxvnfwavbz9r1hd4dgwpfn7a1a9a70l32y8w1f"))

(define rust-tinystr-0.8.2
  (crate-source "tinystr" "0.8.2"
                "0sa8z88axdsf088hgw5p4xcyi6g3w3sgbb6qdp81bph9bk2fkls2"))

(define rust-tinyvec-1.10.0
  (crate-source "tinyvec" "1.10.0"
                "1yhk0qdqyiaa4v2j9h8pzax5gxgwpz4da0lcphfil6g6pk1zv9dz"))

(define rust-tinyvec-macros-0.1.1
  (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-tokio-1.49.0
  (crate-source "tokio" "1.49.0"
                "11ix3pl03s0bp71q3wddrbf8xr0cpn47d7fzr6m42r3kswy918kj"))

(define rust-tokio-macros-2.6.0
  (crate-source "tokio-macros" "2.6.0"
                "19czvgliginbzyhhfbmj77wazqn2y8g27y2nirfajdlm41bphh5g"))

(define rust-tokio-native-tls-0.3.1
  (crate-source "tokio-native-tls" "0.3.1"
                "1wkfg6zn85zckmv4im7mv20ca6b1vmlib5xwz9p7g19wjfmpdbmv"))

(define rust-tokio-rustls-0.25.0
  (crate-source "tokio-rustls" "0.25.0"
                "03w6d5aqqf084rmcmrsyq5grhydl53blaiqcl0i2yfnv187hqpkp"))

(define rust-tokio-rustls-0.26.4
  (crate-source "tokio-rustls" "0.26.4"
                "0qggwknz9w4bbsv1z158hlnpkm97j3w8v31586jipn99byaala8p"))

(define rust-tokio-stream-0.1.18
  (crate-source "tokio-stream" "0.1.18"
                "0w3cj33605ab58wqd382gnla5pnd9hnr00xgg333np5bka04knij"))

(define rust-tokio-tungstenite-0.21.0
  (crate-source "tokio-tungstenite" "0.21.0"
                "0f5wj0crsx74rlll97lhw0wk6y12nhdnqvmnjx002hjn08fmcfy8"))

(define rust-tokio-tungstenite-0.24.0
  (crate-source "tokio-tungstenite" "0.24.0"
                "1nfw1i6yy120a14h1xagd4f31k3g1mz4rdxpvgh77jcd4i7ggigd"))

(define rust-tokio-util-0.7.18
  (crate-source "tokio-util" "0.7.18"
                "1600rd47pylwn7cap1k7s5nvdaa9j7w8kqigzp1qy7mh0p4cxscs"))

(define rust-toml-0.9.12+spec-1.1.0
  (crate-source "toml" "0.9.12+spec-1.1.0"
                "0qwqbrymqn88mg2yqyq3rj52z6p20448z0jxdbpjsbpwg5g894ng"))

(define rust-toml-datetime-0.7.5+spec-1.1.0
  (crate-source "toml_datetime" "0.7.5+spec-1.1.0"
                "0iqkgvgsxmszpai53dbip7sf2igic39s4dby29dbqf1h9bnwzqcj"))

(define rust-toml-edit-0.23.10+spec-1.0.0
  (crate-source "toml_edit" "0.23.10+spec-1.0.0"
                "0saj5c676j8a3sqaj9akkp09wambg8aflji4zblwwa70azvvkj44"))

(define rust-toml-parser-1.0.9+spec-1.1.0
  (crate-source "toml_parser" "1.0.9+spec-1.1.0"
                "1i54qpvvcppy8ybdn9gssas81vfzq0kmgkcnxzhyf8w9w0al8bbh"))

(define rust-tonic-0.12.3
  (crate-source "tonic" "0.12.3"
                "0ljd1lfjpw0vrm5wbv15x6nq2i38llsanls5rkzmdn2n0wrmnz47"))

(define rust-tower-0.4.13
  (crate-source "tower" "0.4.13"
                "073wncyqav4sak1p755hf6vl66njgfc1z1g1di9rxx3cvvh9pymq"))

(define rust-tower-0.5.3
  (crate-source "tower" "0.5.3"
                "1m5i3a2z1sgs8nnz1hgfq2nr4clpdmizlp1d9qsg358ma5iyzrgb"))

(define rust-tower-http-0.6.8
  (crate-source "tower-http" "0.6.8"
                "1y514jwzbyrmrkbaajpwmss4rg0mak82k16d6588w9ncaffmbrnl"))

(define rust-tower-layer-0.3.3
  (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.44
  (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-attributes-0.1.31
  (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.36
  (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-tracing-journald-0.3.2
  (crate-source "tracing-journald" "0.3.2"
                "1l1q4jpwq4jsls1pcjd0wr7djmknwx9w2aqy5dcn5ysv4knq2fid"))

(define rust-tracing-log-0.2.0
  (crate-source "tracing-log" "0.2.0"
                "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-subscriber-0.3.22
  (crate-source "tracing-subscriber" "0.3.22"
                "07hz575a0p1c2i4xw3gs3hkrykhndnkbfhyqdwjhvayx4ww18c1g"))

(define rust-try-lock-0.2.5
  (crate-source "try-lock" "0.2.5"
                "0jqijrrvm1pyq34zn1jmy2vihd4jcrjlvsh4alkjahhssjnsn8g4"))

(define rust-tungstenite-0.21.0
  (crate-source "tungstenite" "0.21.0"
                "1qaphb5kgwgid19p64grhv2b9kxy7f1059yy92l9kwrlx90sdwcy"))

(define rust-tungstenite-0.24.0
  (crate-source "tungstenite" "0.24.0"
                "12nsxnxazk4nisgsqpywi6za0hsbc2rd15r1scb5pag7dqvbir8q"))

(define rust-typemap-rev-0.3.0
  (crate-source "typemap_rev" "0.3.0"
                "161935l8j5jxzjz64g4z21z3x7aj9ljhadjwdbqilf2p2868pc3l"))

(define rust-typenum-1.19.0
  (crate-source "typenum" "1.19.0"
                "1fw2mpbn2vmqan56j1b3fbpcdg80mz26fm53fs16bq5xcq84hban"))

(define rust-typewit-1.14.2
  (crate-source "typewit" "1.14.2"
                "0wag2gf66s4qlb3x2x4v4hmhsjsph6wpq4jxsr1bif7xq1yaxhgq"))

(define rust-typewit-proc-macros-1.8.1
  (crate-source "typewit_proc_macros" "1.8.1"
                "1mlkh4mhbn4b7xg9640blk74bm5ddaa44ihvl0sljw1w5gm86sp3"))

(define rust-ulid-1.2.1
  (crate-source "ulid" "1.2.1"
                "1ghzggz7194hw345idz8afd8g1lw8qmknlhl7ka3j6ysj5jvy3a7"))

(define rust-unicase-2.9.0
  (crate-source "unicase" "2.9.0"
                "0hh1wrfd7807mfph2q67jsxqgw8hm82xg2fb8ln8cvblkwxbri6v"))

(define rust-unicode-ident-1.0.22
  (crate-source "unicode-ident" "1.0.22"
                "1x8xrz17vqi6qmkkcqr8cyf0an76ig7390j9cnqnk47zyv2gf4lk"))

(define rust-unicode-normalization-0.1.25
  (crate-source "unicode-normalization" "0.1.25"
                "1s76dcrxw7vs32yhpi0p074apdc3s7lak7809f3qvclwij3zdm2z"))

(define rust-unicode-segmentation-1.12.0
  (crate-source "unicode-segmentation" "1.12.0"
                "14qla2jfx74yyb9ds3d2mpwpa4l4lzb9z57c6d2ba511458z5k7n"))

(define rust-unicode-truncate-1.1.0
  (crate-source "unicode-truncate" "1.1.0"
                "1gr7arjjhrhy8dww7hj8qqlws97xf9d276svr4hs6pxgllklcr5k"))

(define rust-unicode-width-0.1.14
  (crate-source "unicode-width" "0.1.14"
                "1bzn2zv0gp8xxbxbhifw778a7fc93pa6a1kj24jgg9msj07f7mkx"))

(define rust-unicode-width-0.2.0
  (crate-source "unicode-width" "0.2.0"
                "1zd0r5vs52ifxn25rs06gxrgz8cmh4xpra922k0xlmrchib1kj0z"))

(define rust-unicode-xid-0.2.6
  (crate-source "unicode-xid" "0.2.6"
                "0lzqaky89fq0bcrh6jj6bhlz37scfd8c7dsj5dq7y32if56c1hgb"))

(define rust-universal-hash-0.5.1
  (crate-source "universal-hash" "0.5.1"
                "1sh79x677zkncasa95wz05b36134822w6qxmi1ck05fwi33f47gw"))

(define rust-unsafe-libyaml-0.2.11
  (crate-source "unsafe-libyaml" "0.2.11"
                "0qdq69ffl3v5pzx9kzxbghzn0fzn266i1xn70y88maybz9csqfk7"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-url-2.5.8
  (crate-source "url" "2.5.8"
                "1v8f7nx3hpr1qh76if0a04sj08k86amsq4h8cvpw6wvk76jahrzz"))

(define rust-urlencoding-2.1.3
  (crate-source "urlencoding" "2.1.3"
                "1nj99jp37k47n0hvaz5fvz7z6jd0sb4ppvfy3nphr1zbnyixpy6s"))

(define rust-utf-8-0.7.6
  (crate-source "utf-8" "0.7.6"
                "1a9ns3fvgird0snjkd3wbdhwd3zdpc2h5gpyybrfr6ra5pkqxk09"))

(define rust-utf8-iter-1.0.4
  (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-uuid-1.20.0
  (crate-source "uuid" "1.20.0"
                "0vwpi7vnwjsfcx58nfks9sgmsz4wpbsk06qlwhgxf34v265x6j7f"))

(define rust-valuable-0.1.1
  (crate-source "valuable" "0.1.1"
                "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-vcpkg-0.2.15
  (crate-source "vcpkg" "0.2.15"
                "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-vodozemac-0.9.0
  (crate-source "vodozemac" "0.9.0"
                "0gc8a2kdmfpq2pkphrllm9yr1v6g7k5ag59bsy2qckkyd1vs48n0"))

(define rust-want-0.3.1
  (crate-source "want" "0.3.1"
                "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-wasip2-1.0.2+wasi-0.2.9
  (crate-source "wasip2" "1.0.2+wasi-0.2.9"
                "1xdw7v08jpfjdg94sp4lbdgzwa587m5ifpz6fpdnkh02kwizj5wm"))

(define rust-wasm-bindgen-0.2.108
  (crate-source "wasm-bindgen" "0.2.108"
                "0rl5pn80sdhj2p2r28lp3k50a8mpppzgwzssz2f3jdqyxhq4l0k4"))

(define rust-wasm-bindgen-futures-0.4.58
  (crate-source "wasm-bindgen-futures" "0.4.58"
                "0vqywn9df5i6mms3sw47v3kj7rzx8ryghqq0xb4jk05fs1zyg9kh"))

(define rust-wasm-bindgen-macro-0.2.108
  (crate-source "wasm-bindgen-macro" "0.2.108"
                "026nnvakp0w6j3ghpcxn31shj9wx8bv8x7nk3gkk40klkjfj72q0"))

(define rust-wasm-bindgen-macro-support-0.2.108
  (crate-source "wasm-bindgen-macro-support" "0.2.108"
                "0m9sj475ypgifbkvksjsqs2gy3bq96f87ychch784m4gspiblmjj"))

(define rust-wasm-bindgen-shared-0.2.108
  (crate-source "wasm-bindgen-shared" "0.2.108"
                "04ix7v99rvj5730553j58pqsrwpf9sqazr60y3cchx5cr60ba08z"))

(define rust-wasm-streams-0.4.2
  (crate-source "wasm-streams" "0.4.2"
                "0rddn007hp6k2cm91mm9y33n79b0jxv0c3znzszcvv67hn6ks18m"))

(define rust-wasm-streams-0.5.0
  (crate-source "wasm-streams" "0.5.0"
                "1fqbcx33w8ys5i5dv3p28a82g4yiclmhn80fcfp137kwa7vc87lx"))

(define rust-wasm-evt-listener-0.1.0
  (crate-source "wasm_evt_listener" "0.1.0"
                "0qqrmf6sg4yf1kxmvc453m2l6wf7vgckcahi754dj7j1icvxd4nw"))

(define rust-web-sys-0.3.85
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "web-sys" "0.3.85"
                "1645c202gyw21m6kxw4ya81vrapl40hlb8m9iqhjj8fra7jk4bii"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-web-atoms-0.1.3
  (crate-source "web_atoms" "0.1.3"
                "056lg00xm67d2yiyi1fh3x15jpi3idk0acifk7wvsh0jq0fxxzsp"))

(define rust-webpki-roots-0.26.11
  (crate-source "webpki-roots" "0.26.11"
                "1agpayg5zzf7m1a01q30jahlgmn5nwggbabdhq0in008pf5c66sj"))

(define rust-webpki-roots-1.0.5
  (crate-source "webpki-roots" "1.0.5"
                "0b3j9ngc8fca3kg24f4jb4v9969vmdngv6s2i4wccxijhs0ddghj"))

(define rust-wildmatch-2.6.1
  (crate-source "wildmatch" "2.6.1"
                "0s4cldiyc1yr3h06ph94hb3l2kp89vr3yik32whig2xsl4z3qcr9"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-0.62.2
  (crate-source "windows" "0.62.2"
                "10457l9ihrbw8j79z2v4plyjxkf6xvb5npd0lqwmkh702gpaszsj"))

(define rust-windows-collections-0.3.2
  (crate-source "windows-collections" "0.3.2"
                "0436rjbkqn3j9m2v2lcmwwk0l3n2r57yvqb7fcy4m8d8y5ddkci3"))

(define rust-windows-core-0.62.2
  (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-future-0.3.2
  (crate-source "windows-future" "0.3.2"
                "1jq5qs2dwzf6rl60f8gr49z2mifxsrdh4y4yfdws467ya41gkmp1"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-numerics-0.3.1
  (crate-source "windows-numerics" "0.3.1"
                "09hgbg8pf89r4090yyhh9q29ppi7yyxkgmga9ascshy19a240bkf"))

(define rust-windows-registry-0.6.1
  (crate-source "windows-registry" "0.6.1"
                "082p7l615qk8a4g8g15yipc5lghga6cgfhm74wm7zknwzgvjnx82"))

(define rust-windows-result-0.4.1
  (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-strings-0.5.1
  (crate-source "windows-strings" "0.5.1"
                "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq"))

(define rust-windows-sys-0.52.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-sys-0.60.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.60.2"
                "1jrbc615ihqnhjhxplr2kw7rasrskv9wj3lr80hgfd42sbj01xgj"))

(define rust-windows-sys-0.61.2
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-targets-0.53.5
  (crate-source "windows-targets" "0.53.5"
                "1wv9j2gv3l6wj3gkw5j1kr6ymb5q6dfc42yvydjhv3mqa7szjia9"))

(define rust-windows-threading-0.2.1
  (crate-source "windows-threading" "0.2.1"
                "0dsvsy33vxs0153z4n39sqkzx382cjjkrd46rb3z3zfak5dvsj9r"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-gnullvm-0.53.1
  (crate-source "windows_aarch64_gnullvm" "0.53.1"
                "0lqvdm510mka9w26vmga7hbkmrw9glzc90l4gya5qbxlm1pl3n59"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-aarch64-msvc-0.53.1
  (crate-source "windows_aarch64_msvc" "0.53.1"
                "01jh2adlwx043rji888b22whx4bm8alrk3khjpik5xn20kl85mxr"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnu-0.53.1
  (crate-source "windows_i686_gnu" "0.53.1"
                "18wkcm82ldyg4figcsidzwbg1pqd49jpm98crfz0j7nqd6h6s3ln"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-gnullvm-0.53.1
  (crate-source "windows_i686_gnullvm" "0.53.1"
                "030qaxqc4salz6l4immfb6sykc6gmhyir9wzn2w8mxj8038mjwzs"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-i686-msvc-0.53.1
  (crate-source "windows_i686_msvc" "0.53.1"
                "1hi6scw3mn2pbdl30ji5i4y8vvspb9b66l98kkz350pig58wfyhy"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnu-0.53.1
  (crate-source "windows_x86_64_gnu" "0.53.1"
                "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-gnullvm-0.53.1
  (crate-source "windows_x86_64_gnullvm" "0.53.1"
                "1qbspgv4g3q0vygkg8rnql5c6z3caqv38japiynyivh75ng1gyhg"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-windows-x86-64-msvc-0.53.1
  (crate-source "windows_x86_64_msvc" "0.53.1"
                "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn"))

(define rust-winnow-0.7.14
  (crate-source "winnow" "0.7.14"
                "0a88ahjqhyn2ln1yplq2xsigm09kxqkdkkk2c2mfxkbzszln8lss"))

(define rust-wit-bindgen-0.51.0
  (crate-source "wit-bindgen" "0.51.0"
                "19fazgch8sq5cvjv3ynhhfh5d5x08jq2pkw8jfb05vbcyqcr496p"))

(define rust-writeable-0.6.2
  (crate-source "writeable" "0.6.2"
                "1fg08y97n6vk7l0rnjggw3xyrii6dcqg54wqaxldrlk98zdy1pcy"))

(define rust-x25519-dalek-2.0.1
  (crate-source "x25519-dalek" "2.0.1"
                "0xyjgqpsa0q6pprakdp58q1hy45rf8wnqqscgzx0gyw13hr6ir67"))

(define rust-xxhash-rust-0.8.15
  (crate-source "xxhash-rust" "0.8.15"
                "1lrmffpn45d967afw7f1p300rsx7ill66irrskxpcm1p41a0rlpx"))

(define rust-xz2-0.1.7
  (crate-source "xz2" "0.1.7"
                "1qk7nzpblizvayyq4xzi4b0zacmmbqr6vb9fc0v1avyp17f4931q"))

(define rust-yoke-0.8.1
  (crate-source "yoke" "0.8.1"
                "0m29dm0bf5iakxgma0bj6dbmc3b8qi9b1vaw9sa76kdqmz3fbmkj"))

(define rust-yoke-derive-0.8.1
  (crate-source "yoke-derive" "0.8.1"
                "0pbyja133jnng4mrhimzdq4a0y26421g734ybgz8wsgbfhl0andn"))

(define rust-zerocopy-0.8.39
  (crate-source "zerocopy" "0.8.39"
                "0jmf1iqns5sq07k3dscsgyc706pycar67rrq4j9nrnzacgb3avfv"))

(define rust-zerocopy-derive-0.8.39
  (crate-source "zerocopy-derive" "0.8.39"
                "05z5yfq0mx3xdqadrgq5sd4d03nl82d9r0vp1qchaip9d4qws8j1"))

(define rust-zerofrom-0.1.6
  (crate-source "zerofrom" "0.1.6"
                "19dyky67zkjichsb7ykhv0aqws3q0jfvzww76l66c19y6gh45k2h"))

(define rust-zerofrom-derive-0.1.6
  (crate-source "zerofrom-derive" "0.1.6"
                "00l5niw7c1b0lf1vhvajpjmcnbdp2vn96jg4nmkhq2db0rp5s7np"))

(define rust-zeroize-1.8.2
  (crate-source "zeroize" "1.8.2"
                "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr"))

(define rust-zeroize-derive-1.4.3
  (crate-source "zeroize_derive" "1.4.3"
                "0bl5vd1lz27p4z336nximg5wrlw5j7jc8fxh7iv6r1wrhhav99c5"))

(define rust-zerotrie-0.2.3
  (crate-source "zerotrie" "0.2.3"
                "0lbqznlqazmrwwzslw0ci7p3pqxykrbfhq29npj0gmb2amxc2n9a"))

(define rust-zerovec-0.11.5
  (crate-source "zerovec" "0.11.5"
                "00m0p47k2g9mkv505hky5xh3r6ps7v8qc0dy4pspg542jj972a3c"))

(define rust-zerovec-derive-0.11.2
  (crate-source "zerovec-derive" "0.11.2"
                "1wsig4h5j7a1scd5hrlnragnazjny9qjc44hancb6p6a76ay7p7a"))

(define rust-zip-2.4.2
  (crate-source "zip" "2.4.2"
                "0l5s7sycj0w42hnkmj6vnrzcp3dn4smffg06a8f5my08x4j67gps"))

(define rust-zmij-1.0.19
  (crate-source "zmij" "1.0.19"
                "0i9lpsfa4sgq52dnrli9z3sc2rllwawyc6jp6x38jf4hma65zw1z"))

(define rust-zopfli-0.8.3
  (crate-source "zopfli" "0.8.3"
                "0jaj5dyh3mks0805h4ldrsh5pwq4i2jc9dc9zwjm91k3gmwxhp7h"))

(define rust-zstd-0.13.3
  (crate-source "zstd" "0.13.3"
                "12n0h4w9l526li7jl972rxpyf012jw3nwmji2qbjghv9ll8y67p9"))

(define rust-zstd-safe-7.2.4
  (crate-source "zstd-safe" "7.2.4"
                "179vxmkzhpz6cq6mfzvgwc99bpgllkr6lwxq7ylh5dmby3aw8jcg"))

(define rust-zstd-sys-2.0.16+zstd.1.5.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "zstd-sys" "2.0.16+zstd.1.5.7"
                "0j1pd2iaqpvaxlgqmmijj68wma7xwdv9grrr63j873yw5ay9xqci"))


(define-cargo-inputs lookup-cargo-inputs
  (microclaw => (list
                 rust-accessory-2.1.0
                 rust-adler2-2.0.1
                 rust-aead-0.5.2
                 rust-aes-0.8.4
                 rust-aho-corasick-1.1.4
                 rust-allocator-api2-0.2.21
                 rust-android-system-properties-0.1.5
                 rust-anstream-0.6.21
                 rust-anstyle-1.0.13
                 rust-anstyle-parse-0.2.7
                 rust-anstyle-query-1.1.5
                 rust-anstyle-wincon-3.0.11
                 rust-anyhow-1.0.101
                 rust-anymap2-0.13.0
                 rust-aquamarine-0.6.0
                 rust-ar-archive-writer-0.5.1
                 rust-arbitrary-1.4.2
                 rust-archery-1.2.2
                 rust-argon2-0.5.3
                 rust-arrayref-0.3.9
                 rust-arrayvec-0.7.6
                 rust-as-variant-1.3.0
                 rust-assign-1.1.1
                 rust-async-channel-2.5.0
                 rust-async-compression-0.4.40
                 rust-async-stream-0.3.6
                 rust-async-stream-impl-0.3.6
                 rust-async-trait-0.1.89
                 rust-atomic-waker-1.1.2
                 rust-autocfg-1.5.0
                 rust-axum-0.7.9
                 rust-axum-core-0.4.5
                 rust-backon-1.6.0
                 rust-base64-0.22.1
                 rust-base64ct-1.8.3
                 rust-bitflags-2.10.0
                 rust-bitmaps-3.2.1
                 rust-blake2-0.10.6
                 rust-blake3-1.8.3
                 rust-block-buffer-0.10.4
                 rust-block-padding-0.3.3
                 rust-bs58-0.5.1
                 rust-bumpalo-3.19.1
                 rust-bytemuck-1.25.0
                 rust-byteorder-1.5.0
                 rust-bytes-1.11.1
                 rust-bytesize-2.3.1
                 rust-bzip2-0.5.2
                 rust-bzip2-sys-0.1.13+1.0.8
                 rust-cassowary-0.3.0
                 rust-castaway-0.2.4
                 rust-cbc-0.1.2
                 rust-cc-1.2.55
                 rust-cfg-if-1.0.4
                 rust-cfg-aliases-0.2.1
                 rust-chacha20-0.9.1
                 rust-chacha20poly1305-0.10.1
                 rust-chrono-0.4.43
                 rust-chrono-tz-0.10.4
                 rust-cipher-0.4.4
                 rust-clap-4.5.60
                 rust-clap-builder-4.5.60
                 rust-clap-derive-4.5.55
                 rust-clap-lex-1.0.0
                 rust-colorchoice-1.0.4
                 rust-colored-3.1.1
                 rust-compact-str-0.8.1
                 rust-compression-codecs-0.4.37
                 rust-compression-core-0.4.31
                 rust-concurrent-queue-2.5.0
                 rust-const-oid-0.9.6
                 rust-const-panic-0.2.15
                 rust-constant-time-eq-0.3.1
                 rust-constant-time-eq-0.4.2
                 rust-core-foundation-0.9.4
                 rust-core-foundation-sys-0.8.7
                 rust-cpufeatures-0.2.17
                 rust-crc-3.4.0
                 rust-crc-catalog-2.4.0
                 rust-crc32fast-1.5.0
                 rust-cron-0.13.0
                 rust-crossbeam-utils-0.8.21
                 rust-crossterm-0.28.1
                 rust-crossterm-winapi-0.9.1
                 rust-crypto-common-0.1.7
                 rust-ctr-0.9.2
                 rust-curve25519-dalek-4.1.3
                 rust-curve25519-dalek-derive-0.1.1
                 rust-darling-0.21.3
                 rust-darling-0.23.0
                 rust-darling-core-0.21.3
                 rust-darling-core-0.23.0
                 rust-darling-macro-0.21.3
                 rust-darling-macro-0.23.0
                 rust-dashmap-5.5.3
                 rust-data-encoding-2.10.0
                 rust-date-header-1.0.5
                 rust-deadpool-0.12.3
                 rust-deadpool-runtime-0.1.4
                 rust-deadpool-sync-0.1.4
                 rust-decancer-3.3.3
                 rust-deflate64-0.1.10
                 rust-delegate-display-3.0.0
                 rust-der-0.7.10
                 rust-deranged-0.5.5
                 rust-derivative-2.2.0
                 rust-derive-arbitrary-1.4.2
                 rust-derive-more-1.0.0
                 rust-derive-more-2.1.1
                 rust-derive-more-impl-1.0.0
                 rust-derive-more-impl-2.1.1
                 rust-digest-0.10.7
                 rust-dirs-6.0.0
                 rust-dirs-sys-0.5.0
                 rust-displaydoc-0.2.5
                 rust-dptree-0.5.1
                 rust-dyn-clone-1.0.20
                 rust-ed25519-2.2.3
                 rust-ed25519-dalek-2.2.0
                 rust-either-1.15.0
                 rust-encoding-rs-0.8.35
                 rust-equivalent-1.0.2
                 rust-erasable-1.3.0
                 rust-errno-0.3.14
                 rust-event-listener-5.4.1
                 rust-event-listener-strategy-0.5.4
                 rust-eyeball-0.8.8
                 rust-eyeball-im-0.8.0
                 rust-fallible-iterator-0.3.0
                 rust-fallible-streaming-iterator-0.1.9
                 rust-fancy-constructor-2.1.0
                 rust-fastrand-2.3.0
                 rust-fiat-crypto-0.2.9
                 rust-find-msvc-tools-0.1.9
                 rust-flate2-1.1.9
                 rust-fnv-1.0.7
                 rust-foldhash-0.1.5
                 rust-foreign-types-0.3.2
                 rust-foreign-types-shared-0.1.1
                 rust-form-urlencoded-1.2.2
                 rust-futf-0.1.5
                 rust-futures-0.3.31
                 rust-futures-channel-0.3.31
                 rust-futures-core-0.3.31
                 rust-futures-executor-0.3.31
                 rust-futures-io-0.3.31
                 rust-futures-macro-0.3.31
                 rust-futures-sink-0.3.31
                 rust-futures-task-0.3.31
                 rust-futures-util-0.3.31
                 rust-generic-array-0.14.7
                 rust-getrandom-0.2.17
                 rust-getrandom-0.3.4
                 rust-glob-0.3.3
                 rust-gloo-timers-0.3.0
                 rust-gloo-utils-0.2.0
                 rust-growable-bloom-filter-2.1.1
                 rust-h2-0.4.13
                 rust-hashbrown-0.12.3
                 rust-hashbrown-0.14.5
                 rust-hashbrown-0.15.5
                 rust-hashbrown-0.16.1
                 rust-hashlink-0.10.0
                 rust-headers-0.4.1
                 rust-headers-core-0.3.0
                 rust-heck-0.5.0
                 rust-hermit-abi-0.5.2
                 rust-hex-0.4.3
                 rust-hkdf-0.12.4
                 rust-hmac-0.12.1
                 rust-html5ever-0.35.0
                 rust-http-1.4.0
                 rust-http-auth-0.1.10
                 rust-http-body-1.0.1
                 rust-http-body-util-0.1.3
                 rust-httparse-1.10.1
                 rust-httpdate-1.0.3
                 rust-hyper-1.8.1
                 rust-hyper-rustls-0.27.7
                 rust-hyper-timeout-0.5.2
                 rust-hyper-tls-0.6.0
                 rust-hyper-util-0.1.20
                 rust-iana-time-zone-0.1.65
                 rust-iana-time-zone-haiku-0.1.2
                 rust-icu-collections-2.1.1
                 rust-icu-locale-core-2.1.1
                 rust-icu-normalizer-2.1.1
                 rust-icu-normalizer-data-2.1.1
                 rust-icu-properties-2.1.2
                 rust-icu-properties-data-2.1.2
                 rust-icu-provider-2.1.1
                 rust-ident-case-1.0.1
                 rust-idna-1.1.0
                 rust-idna-adapter-1.2.1
                 rust-imbl-6.1.0
                 rust-imbl-sized-chunks-0.1.3
                 rust-impartial-ord-1.0.6
                 rust-include-dir-0.7.4
                 rust-include-dir-macros-0.7.4
                 rust-indexmap-1.9.3
                 rust-indexmap-2.13.0
                 rust-indoc-2.0.7
                 rust-inout-0.1.4
                 rust-instability-0.3.11
                 rust-ipnet-2.11.0
                 rust-iri-string-0.7.10
                 rust-is-terminal-polyfill-1.70.2
                 rust-itertools-0.10.5
                 rust-itertools-0.13.0
                 rust-itertools-0.14.0
                 rust-itoa-1.0.17
                 rust-jobserver-0.1.34
                 rust-js-sys-0.3.85
                 rust-js-int-0.2.2
                 rust-js-option-0.2.0
                 rust-konst-0.3.16
                 rust-konst-kernel-0.3.15
                 rust-language-tags-0.3.2
                 rust-lazy-static-1.5.0
                 rust-libc-0.2.182
                 rust-libredox-0.1.14
                 rust-libsqlite3-sys-0.35.0
                 rust-linux-raw-sys-0.4.15
                 rust-linux-raw-sys-0.11.0
                 rust-litemap-0.8.1
                 rust-lock-api-0.4.14
                 rust-log-0.4.29
                 rust-lru-0.12.5
                 rust-lru-slab-0.1.2
                 rust-lzma-rs-0.3.0
                 rust-lzma-sys-0.1.20
                 rust-mac-0.1.1
                 rust-macroific-2.0.0
                 rust-macroific-attr-parse-2.0.0
                 rust-macroific-core-2.0.0
                 rust-macroific-macro-2.0.0
                 rust-maplit-1.0.2
                 rust-markup5ever-0.35.0
                 rust-match-token-0.35.0
                 rust-matchers-0.2.0
                 rust-matchit-0.7.3
                 rust-matrix-pickle-0.2.2
                 rust-matrix-pickle-derive-0.2.2
                 rust-matrix-sdk-0.16.0
                 rust-matrix-sdk-base-0.16.0
                 rust-matrix-sdk-common-0.16.0
                 rust-matrix-sdk-crypto-0.16.0
                 rust-matrix-sdk-indexeddb-0.16.0
                 rust-matrix-sdk-sqlite-0.16.0
                 rust-matrix-sdk-store-encryption-0.16.0
                 rust-matrix-indexed-db-futures-0.7.0
                 rust-matrix-indexed-db-futures-macros-internal-1.0.0
                 rust-memchr-2.8.0
                 rust-mime-0.3.17
                 rust-mime2ext-0.1.54
                 rust-mime-guess-2.0.5
                 rust-minimal-lexical-0.2.1
                 rust-miniz-oxide-0.8.9
                 rust-mio-1.1.1
                 rust-native-tls-0.2.14
                 rust-new-debug-unreachable-1.0.6
                 rust-nix-0.31.2
                 rust-nom-7.1.3
                 rust-nu-ansi-term-0.50.3
                 rust-num-conv-0.2.0
                 rust-num-traits-0.2.19
                 rust-num-cpus-1.17.0
                 rust-oauth2-5.0.0
                 rust-object-0.37.3
                 rust-once-cell-1.21.3
                 rust-once-cell-polyfill-1.70.2
                 rust-opaque-debug-0.3.1
                 rust-openssl-0.10.75
                 rust-openssl-macros-0.1.1
                 rust-openssl-probe-0.1.6
                 rust-openssl-sys-0.9.111
                 rust-opentelemetry-0.28.0
                 rust-opentelemetry-proto-0.28.0
                 rust-opentelemetry-sdk-0.28.0
                 rust-option-ext-0.2.0
                 rust-parking-2.2.1
                 rust-parking-lot-0.12.5
                 rust-parking-lot-core-0.9.12
                 rust-password-hash-0.5.0
                 rust-paste-1.0.15
                 rust-pastey-0.2.1
                 rust-pbkdf2-0.12.2
                 rust-percent-encoding-2.3.2
                 rust-phf-0.11.3
                 rust-phf-0.12.1
                 rust-phf-codegen-0.11.3
                 rust-phf-generator-0.11.3
                 rust-phf-shared-0.11.3
                 rust-phf-shared-0.12.1
                 rust-pin-project-1.1.10
                 rust-pin-project-internal-1.1.10
                 rust-pin-project-lite-0.2.16
                 rust-pin-utils-0.1.0
                 rust-pkcs8-0.10.2
                 rust-pkg-config-0.3.32
                 rust-poly1305-0.8.0
                 rust-potential-utf-0.1.4
                 rust-powerfmt-0.2.0
                 rust-ppv-lite86-0.2.21
                 rust-precomputed-hash-0.1.1
                 rust-proc-macro-crate-3.4.0
                 rust-proc-macro-error-attr2-2.0.0
                 rust-proc-macro-error2-2.0.1
                 rust-proc-macro2-1.0.106
                 rust-process-wrap-9.0.3
                 rust-prost-0.13.5
                 rust-prost-derive-0.13.5
                 rust-psm-0.1.29
                 rust-quinn-0.11.9
                 rust-quinn-proto-0.11.13
                 rust-quinn-udp-0.5.14
                 rust-quote-1.0.44
                 rust-r-efi-5.3.0
                 rust-rand-0.8.5
                 rust-rand-0.9.2
                 rust-rand-chacha-0.3.1
                 rust-rand-chacha-0.9.0
                 rust-rand-core-0.6.4
                 rust-rand-core-0.9.5
                 rust-rand-xoshiro-0.7.0
                 rust-ratatui-0.29.0
                 rust-rc-box-1.3.0
                 rust-readlock-0.1.11
                 rust-readlock-tokio-0.1.6
                 rust-redox-syscall-0.5.18
                 rust-redox-users-0.5.2
                 rust-ref-cast-1.0.25
                 rust-ref-cast-impl-1.0.25
                 rust-regex-1.12.3
                 rust-regex-automata-0.4.14
                 rust-regex-syntax-0.8.9
                 rust-reqwest-0.12.28
                 rust-reqwest-0.13.2
                 rust-rgb-0.8.52
                 rust-ring-0.17.14
                 rust-rmcp-1.1.0
                 rust-rmcp-macros-1.1.0
                 rust-rmp-0.8.15
                 rust-rmp-serde-1.3.1
                 rust-ruma-0.14.1
                 rust-ruma-client-api-0.22.1
                 rust-ruma-common-0.17.1
                 rust-ruma-events-0.32.1
                 rust-ruma-federation-api-0.13.1
                 rust-ruma-html-0.6.0
                 rust-ruma-identifiers-validation-0.12.0
                 rust-ruma-macros-0.17.1
                 rust-ruma-signatures-0.19.0
                 rust-rusqlite-0.37.0
                 rust-rustc-hash-2.1.1
                 rust-rustc-version-0.4.1
                 rust-rustix-0.38.44
                 rust-rustix-1.1.3
                 rust-rustls-0.22.4
                 rust-rustls-0.23.36
                 rust-rustls-pki-types-1.14.0
                 rust-rustls-webpki-0.102.8
                 rust-rustls-webpki-0.103.9
                 rust-rustversion-1.0.22
                 rust-ryu-1.0.22
                 rust-schannel-0.1.28
                 rust-schemars-0.9.0
                 rust-schemars-1.2.1
                 rust-schemars-derive-1.2.1
                 rust-scopeguard-1.2.0
                 rust-sealed-0.6.0
                 rust-secrecy-0.8.0
                 rust-security-framework-2.11.1
                 rust-security-framework-sys-2.15.0
                 rust-semver-1.0.27
                 rust-serde-1.0.228
                 rust-serde-wasm-bindgen-0.6.5
                 rust-serde-bytes-0.11.19
                 rust-serde-core-1.0.228
                 rust-serde-cow-0.1.2
                 rust-serde-derive-1.0.228
                 rust-serde-derive-internals-0.29.1
                 rust-serde-html-form-0.2.8
                 rust-serde-json-1.0.149
                 rust-serde-path-to-error-0.1.20
                 rust-serde-spanned-1.0.4
                 rust-serde-urlencoded-0.7.1
                 rust-serde-with-3.16.1
                 rust-serde-with-macros-3.16.1
                 rust-serde-yaml-0.9.34+deprecated
                 rust-serenity-0.12.5
                 rust-sha1-0.10.6
                 rust-sha2-0.10.9
                 rust-sharded-slab-0.1.7
                 rust-shellexpand-3.1.2
                 rust-shlex-1.3.0
                 rust-signal-hook-0.3.18
                 rust-signal-hook-mio-0.2.5
                 rust-signal-hook-registry-1.4.8
                 rust-signature-2.2.0
                 rust-simd-adler32-0.3.8
                 rust-siphasher-1.0.2
                 rust-slab-0.4.12
                 rust-smallvec-1.15.1
                 rust-socket2-0.5.10
                 rust-socket2-0.6.2
                 rust-spki-0.7.3
                 rust-sqlite-vec-0.1.7-alpha.10
                 rust-sse-stream-0.2.1
                 rust-stable-deref-trait-1.2.1
                 rust-stacker-0.1.22
                 rust-static-assertions-1.1.0
                 rust-string-cache-0.8.9
                 rust-string-cache-codegen-0.5.4
                 rust-strsim-0.11.1
                 rust-strum-0.26.3
                 rust-strum-macros-0.26.4
                 rust-subtle-2.6.1
                 rust-syn-1.0.109
                 rust-syn-2.0.114
                 rust-sync-wrapper-1.0.2
                 rust-synstructure-0.13.2
                 rust-system-configuration-0.7.0
                 rust-system-configuration-sys-0.6.0
                 rust-take-mut-0.2.2
                 rust-takecell-0.1.1
                 rust-teloxide-0.17.0
                 rust-teloxide-core-0.13.0
                 rust-teloxide-macros-0.10.0
                 rust-tempfile-3.24.0
                 rust-tendril-0.4.3
                 rust-thiserror-1.0.69
                 rust-thiserror-2.0.18
                 rust-thiserror-impl-1.0.69
                 rust-thiserror-impl-2.0.18
                 rust-thread-local-1.1.9
                 rust-time-0.3.47
                 rust-time-core-0.1.8
                 rust-time-macros-0.2.27
                 rust-tinystr-0.8.2
                 rust-tinyvec-1.10.0
                 rust-tinyvec-macros-0.1.1
                 rust-tokio-1.49.0
                 rust-tokio-macros-2.6.0
                 rust-tokio-native-tls-0.3.1
                 rust-tokio-rustls-0.25.0
                 rust-tokio-rustls-0.26.4
                 rust-tokio-stream-0.1.18
                 rust-tokio-tungstenite-0.21.0
                 rust-tokio-tungstenite-0.24.0
                 rust-tokio-util-0.7.18
                 rust-toml-0.9.12+spec-1.1.0
                 rust-toml-datetime-0.7.5+spec-1.1.0
                 rust-toml-edit-0.23.10+spec-1.0.0
                 rust-toml-parser-1.0.9+spec-1.1.0
                 rust-tonic-0.12.3
                 rust-tower-0.4.13
                 rust-tower-0.5.3
                 rust-tower-http-0.6.8
                 rust-tower-layer-0.3.3
                 rust-tower-service-0.3.3
                 rust-tracing-0.1.44
                 rust-tracing-attributes-0.1.31
                 rust-tracing-core-0.1.36
                 rust-tracing-journald-0.3.2
                 rust-tracing-log-0.2.0
                 rust-tracing-subscriber-0.3.22
                 rust-try-lock-0.2.5
                 rust-tungstenite-0.21.0
                 rust-tungstenite-0.24.0
                 rust-typemap-rev-0.3.0
                 rust-typenum-1.19.0
                 rust-typewit-1.14.2
                 rust-typewit-proc-macros-1.8.1
                 rust-ulid-1.2.1
                 rust-unicase-2.9.0
                 rust-unicode-ident-1.0.22
                 rust-unicode-normalization-0.1.25
                 rust-unicode-segmentation-1.12.0
                 rust-unicode-truncate-1.1.0
                 rust-unicode-width-0.1.14
                 rust-unicode-width-0.2.0
                 rust-unicode-xid-0.2.6
                 rust-universal-hash-0.5.1
                 rust-unsafe-libyaml-0.2.11
                 rust-untrusted-0.9.0
                 rust-url-2.5.8
                 rust-urlencoding-2.1.3
                 rust-utf-8-0.7.6
                 rust-utf8-iter-1.0.4
                 rust-utf8parse-0.2.2
                 rust-uuid-1.20.0
                 rust-valuable-0.1.1
                 rust-vcpkg-0.2.15
                 rust-version-check-0.9.5
                 rust-vodozemac-0.9.0
                 rust-want-0.3.1
                 rust-wasi-0.11.1+wasi-snapshot-preview1
                 rust-wasip2-1.0.2+wasi-0.2.9
                 rust-wasm-bindgen-0.2.108
                 rust-wasm-bindgen-futures-0.4.58
                 rust-wasm-bindgen-macro-0.2.108
                 rust-wasm-bindgen-macro-support-0.2.108
                 rust-wasm-bindgen-shared-0.2.108
                 rust-wasm-streams-0.4.2
                 rust-wasm-streams-0.5.0
                 rust-wasm-evt-listener-0.1.0
                 rust-web-sys-0.3.85
                 rust-web-time-1.1.0
                 rust-web-atoms-0.1.3
                 rust-webpki-roots-0.26.11
                 rust-webpki-roots-1.0.5
                 rust-wildmatch-2.6.1
                 rust-winapi-0.3.9
                 rust-winapi-i686-pc-windows-gnu-0.4.0
                 rust-winapi-x86-64-pc-windows-gnu-0.4.0
                 rust-windows-0.62.2
                 rust-windows-collections-0.3.2
                 rust-windows-core-0.62.2
                 rust-windows-future-0.3.2
                 rust-windows-implement-0.60.2
                 rust-windows-interface-0.59.3
                 rust-windows-link-0.2.1
                 rust-windows-numerics-0.3.1
                 rust-windows-registry-0.6.1
                 rust-windows-result-0.4.1
                 rust-windows-strings-0.5.1
                 rust-windows-sys-0.52.0
                 rust-windows-sys-0.59.0
                 rust-windows-sys-0.60.2
                 rust-windows-sys-0.61.2
                 rust-windows-targets-0.52.6
                 rust-windows-targets-0.53.5
                 rust-windows-threading-0.2.1
                 rust-windows-aarch64-gnullvm-0.52.6
                 rust-windows-aarch64-gnullvm-0.53.1
                 rust-windows-aarch64-msvc-0.52.6
                 rust-windows-aarch64-msvc-0.53.1
                 rust-windows-i686-gnu-0.52.6
                 rust-windows-i686-gnu-0.53.1
                 rust-windows-i686-gnullvm-0.52.6
                 rust-windows-i686-gnullvm-0.53.1
                 rust-windows-i686-msvc-0.52.6
                 rust-windows-i686-msvc-0.53.1
                 rust-windows-x86-64-gnu-0.52.6
                 rust-windows-x86-64-gnu-0.53.1
                 rust-windows-x86-64-gnullvm-0.52.6
                 rust-windows-x86-64-gnullvm-0.53.1
                 rust-windows-x86-64-msvc-0.52.6
                 rust-windows-x86-64-msvc-0.53.1
                 rust-winnow-0.7.14
                 rust-wit-bindgen-0.51.0
                 rust-writeable-0.6.2
                 rust-x25519-dalek-2.0.1
                 rust-xxhash-rust-0.8.15
                 rust-xz2-0.1.7
                 rust-yoke-0.8.1
                 rust-yoke-derive-0.8.1
                 rust-zerocopy-0.8.39
                 rust-zerocopy-derive-0.8.39
                 rust-zerofrom-0.1.6
                 rust-zerofrom-derive-0.1.6
                 rust-zeroize-1.8.2
                 rust-zeroize-derive-1.4.3
                 rust-zerotrie-0.2.3
                 rust-zerovec-0.11.5
                 rust-zerovec-derive-0.11.2
                 rust-zip-2.4.2
                 rust-zmij-1.0.19
                 rust-zopfli-0.8.3
                 rust-zstd-0.13.3
                 rust-zstd-safe-7.2.4
                 rust-zstd-sys-2.0.16+zstd.1.5.7
                 )))

(define-public microclaw
  (package
    (name "microclaw")
    (version "0.0.160")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microclaw/microclaw")
                    (commit "9a29ea874cd979884e4f85c03ce72600567e99c3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1g6g7772nb4r03aqypb7pqbvwpi8mz1yznp4w111s061z8ibdidx"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (install-file "target/release/microclaw" bin)))))))
    (native-inputs
     (list pkg-config))
    (inputs
     (append (list openssl sqlite libsodium eudev (list zstd "lib"))
             (cargo-inputs 'microclaw #:module '(microclaw))))
    (home-page "https://github.com/microclaw/microclaw")
    (synopsis "Multi-channel agent runtime")
    (description
     "MicroClaw is a lightweight derivative of OpenClaw designed for agentic AI assistants.")
    (license license:expat)))
