(define-module (netdata)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages debug)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pcre) ; for pcre2
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages c))

(define-public netdata
  (package
    (name "netdata")
    (version "2.8.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/netdata/netdata")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1qhgr01pkg8ndgrjccqqzl6psrwc60rgv9ssq8cji3mbi6cdyn71"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DENABLE_CLOUD=OFF"
              "-DENABLE_SENTRY=OFF"
              "-DENABLE_ML=OFF"
              "-DENABLE_PLUGIN_EBPF=OFF"
              "-DENABLE_WEBRTC=OFF"
              "-DENABLE_DASHBOARD=OFF"
              "-DENABLE_LIBBACKTRACE=OFF"
              "-DENABLE_LIBUNWIND=ON"
              "-DUSE_SYSTEM_JSONC=ON"
              "-DUSE_SYSTEM_PROTOBUF=ON"
              "-DENABLE_BUNDLED_JSONC=OFF"
              "-DENABLE_BUNDLED_YAML=OFF"
              "-DENABLE_BUNDLED_PROTOBUF=OFF"
              "-DENABLE_PLUGIN_GO=OFF"
              "-DENABLE_PLUGIN_RUST=OFF"
              "-DENABLE_PLUGIN_OTEL=OFF"
              "-DENABLE_NETDATA_JOURNAL_FILE_READER=OFF"
              "-DENABLE_PLUGIN_SYSTEMD_JOURNAL=ON"
              "-DENABLE_PLUGIN_FREEIPMI=OFF"
              "-DENABLE_PLUGIN_NFACCT=OFF"
              "-DENABLE_PLUGIN_XENSTAT=OFF"
              "-DENABLE_PLUGIN_CUPS=OFF"
              "-DENABLE_PLUGIN_SYSTEMD_UNITS=OFF"
              "-DENABLE_PLUGIN_DEBUGFS=OFF"
              "-DENABLE_PLUGIN_APPS=OFF")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'unpack-submodules
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((aclk-schemas (assoc-ref inputs "aclk-schemas-source")))
                (copy-recursively aclk-schemas "src/aclk/aclk-schemas"))))
          (add-after 'unpack 'inject-guix-stubs
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((stubs (assoc-ref inputs "netdata-guix-stubs"))
                    (writer (assoc-ref inputs "guix-journal-writer")))
                (copy-file stubs "src/netdata_guix_stubs.c")
                (copy-file writer "src/guix_journal_writer.c"))
              
              ;; 1. Definitive rust_provider.h with named struct
              (with-output-to-file "src/collectors/systemd-journal.plugin/provider/rust_provider.h"
                (lambda ()
                  (display "#ifndef ND_SD_JOURNAL_PROVIDER_RUST_H\n")
                  (display "#define ND_SD_JOURNAL_PROVIDER_RUST_H\n")
                  (display "#include <stdint.h>\n#include <stddef.h>\n#include <string.h>\n")
                  (display "struct RsdId128 { uint8_t bytes[16]; };\n")
                  (display "typedef struct RsdId128 RsdId128;\n")
                  (display "struct RsdJournal;\ntypedef struct RsdJournal RsdJournal;\n")
                  (display "typedef RsdId128 NsdId128;\n")
                  (display "typedef struct RsdJournal NsdJournal;\n")
                  (display "#define NSD_ID128_DEFINED 1\n")
                  (display "#define NSD_JOURNAL_DEFINED 1\n")
                  (display "typedef RsdId128 sd_id128_t;\n")
                  (display "typedef struct RsdJournal sd_journal;\n")
                  (display "#define RSD_ID128_NULL ((const RsdId128){.bytes = {0}})\n")
                  (display "#define RSD_ID128_STRING_MAX 33U\n")
                  (display "#define RSD_ID128_UUID_STRING_MAX 37U\n")
                  (display "#define RSD_JOURNAL_FOREACH_DATA(j, data, l) for(rsd_journal_restart_data(j); rsd_journal_enumerate_available_data((j), &(data), &(l)) > 0;)\n")
                  (display "#define RSD_JOURNAL_FOREACH_UNIQUE(j, data, l) for(int _i=0; _i<0; _i++)\n")
                  (display "#define RSD_JOURNAL_FOREACH_FIELD(j, field) for(int _i=0; _i<0; _i++)\n")
                  (display "#define HAVE_SD_JOURNAL_RESTART_FIELDS 1\n")
                  (display "#define HAVE_SD_JOURNAL_GET_SEQNUM 1\n")
                  (display "int32_t rsd_id128_from_string(const char *s, RsdId128 *ret);\n")
                  (display "int32_t rsd_id128_equal(RsdId128 a, RsdId128 b);\n")
                  (display "int rsd_journal_open_files(RsdJournal **ret, const char *const *paths, int flags);\n")
                  (display "void rsd_journal_close(RsdJournal *j);\n")
                  (display "int rsd_journal_seek_head(RsdJournal *j);\n")
                  (display "int rsd_journal_seek_tail(RsdJournal *j);\n")
                  (display "int rsd_journal_seek_realtime_usec(RsdJournal *j, uint64_t usec);\n")
                  (display "int rsd_journal_next(RsdJournal *j);\n")
                  (display "int rsd_journal_previous(RsdJournal *j);\n")
                  (display "int rsd_journal_get_seqnum(RsdJournal *j, uint64_t *ret_seqnum, RsdId128 *ret_seqnum_id);\n")
                  (display "int rsd_journal_get_realtime_usec(RsdJournal *j, uint64_t *ret);\n")
                  (display "void rsd_journal_restart_data(RsdJournal *j);\n")
                  (display "int rsd_journal_enumerate_available_data(RsdJournal *j, const void **data, size_t *l);\n")
                  (display "void rsd_journal_restart_fields(RsdJournal *j);\n")
                  (display "int rsd_journal_enumerate_fields(RsdJournal *j, const char **field);\n")
                  (display "int rsd_journal_query_unique(RsdJournal *j, const char *field);\n")
                  (display "void rsd_journal_restart_unique(RsdJournal *j);\n")
                  (display "int rsd_journal_enumerate_available_unique(RsdJournal *j, const void **data, size_t *l);\n")
                  (display "int rsd_journal_add_match(RsdJournal *j, const void *data, size_t size);\n")
                  (display "int rsd_journal_add_conjunction(RsdJournal *j);\n")
                  (display "int rsd_journal_add_disjunction(RsdJournal *j);\n")
                  (display "void rsd_journal_flush_matches(RsdJournal *j);\n")
                  (display "#endif\n")))

              ;; 2. Patch netdata_provider.h
              (substitute* "src/collectors/systemd-journal.plugin/provider/netdata_provider.h"
                (("#include <systemd/sd-journal.h>") "#include \"rust_provider.h\"")
                (("typedef struct RsdJournal NsdJournal;") 
                 "#ifndef NSD_JOURNAL_DEFINED\ntypedef struct RsdJournal NsdJournal;\n#endif")
                (("typedef struct RsdId128 NsdId128;") 
                 "#ifndef NSD_ID128_DEFINED\ntypedef struct RsdId128 NsdId128;\n#endif"))
              
              ;; 3. Clean up C stubs
              (substitute* "src/netdata_guix_stubs.c"
                (("#include <stdint.h>.*") "#include \"collectors/systemd-journal.plugin/provider/rust_provider.h\"\n")
                (("typedef struct \\{.*\\} RsdId128;") "")
                (("typedef struct RsdJournal RsdJournal;") ""))

              ;; 4. Force plugin to not exit even if no journal files are found
              (substitute* "src/collectors/systemd-journal.plugin/systemd-main.c"
                (("return false;") "return true;"))

              ;; 5. Add custom journal file support
              (substitute* "src/collectors/systemd-journal.plugin/systemd-journal-files.c"
                (("journal_directories\\[d\\+\\+\\].path = string_strdupz\\(\"/var/log/journal\"\\);")
                 "journal_directories[d++].path = string_strdupz(\"/var/log/journal\");\n    journal_directories[d++].path = string_strdupz(\"/var/log/netdata/journal\");"))

              ;; 6. Patch CMake to use the stubs directly AND build the writer
              (substitute* "CMakeLists.txt"
                (("project\\(netdata.*\\)") "project(netdata LANGUAGES C CXX)\nadd_definitions(-DHAVE_RUST_PROVIDER=1)")
                (("if\\(ENABLE_NETDATA_JOURNAL_FILE_READER OR ENABLE_PLUGIN_OTEL\\)") "if(FALSE)")
                (("src/daemon/main\\.c") "src/daemon/main.c\n            src/netdata_guix_stubs.c")
                (("src/collectors/systemd-journal\\.plugin/systemd-journal\\.c")
                 "src/collectors/systemd-journal.plugin/systemd-journal.c\n            src/netdata_guix_stubs.c")
                (("target_link_libraries\\(systemd-journal\\.plugin.*journal_reader_ffi.*\\)")
                 "target_link_libraries(systemd-journal.plugin journal_reader_ffi libnetdata)")
                (("corrosion_link_libraries") "# corrosion_link_libraries")
                (("pkg_check_modules\\(SYSTEMD.*\\)") "set(SYSTEMD_FOUND TRUE)")
                ;; Inject the library target and the writer executable
                (("add_executable\\(systemd-journal\\.plugin") 
                 "add_library(journal_reader_ffi STATIC src/netdata_guix_stubs.c)\nadd_executable(guix-journal-writer src/guix_journal_writer.c)\ninstall(TARGETS guix-journal-writer RUNTIME DESTINATION usr/sbin)\nadd_executable(systemd-journal.plugin"))))
          (add-after 'unpack 'fix-runtime-paths
            (lambda _
              (substitute* "CMakeLists.txt"
                (("set\\(CACHE_DIR .*\\)") "set(CACHE_DIR \"/var/cache/netdata\")")
                (("set\\(CONFIG_DIR .*\\)") "set(CONFIG_DIR \"/etc/netdata\")")
                (("set\\(LOG_DIR .*\\)") "set(LOG_DIR \"/var/log/netdata\")")
                (("set\\(VARLIB_DIR .*\\)") "set(VARLIB_DIR \"/var/lib/netdata\")")
                (("set\\(LIBCONFIG_DIR .*\\)")
                 (string-append "set(LIBCONFIG_DIR \"" #$output "/usr/lib/netdata/conf.d\")"))
                (("set\\(PLUGINS_DIR .*\\)")
                 (string-append "set(PLUGINS_DIR \"" #$output "/usr/libexec/netdata/plugins.d\")")))))
          (add-after 'install 'install-legacy-dashboard
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (web-dir (string-append out "/usr/share/netdata/web"))
                     (v1-source (assoc-ref inputs "netdata-v1-source")))
                (mkdir-p web-dir)
                (copy-recursively (string-append v1-source "/web/gui") web-dir)
                (with-directory-excursion web-dir
                  (substitute* (find-files "." "\\.html$")
                    (("<script[^>]*google-analytics\\.com[^>]*>[^<]*</script>") "")
                    (("<script[^>]*googletagmanager\\.com[^>]*>[^<]*</script>") "")))))))))
    (native-inputs
     (list pkg-config protobuf-c protobuf flex bison))
    (inputs
     `(("netdata-v1-source" 
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/netdata/netdata")
                 (commit "v1.44.3")))
           (file-name "netdata-v1-checkout")
           (sha256
            (base32 "0n8iaq1wix66wrdw1kxx71w15x8k3zrmvsgm3b9d1bfrhfsrj4al"))))
       ("aclk-schemas-source"
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/netdata/aclk-schemas.git")
                 (commit "ec319a14394436f62663548d32eb320eeddd264a")))
           (file-name "aclk-schemas-checkout")
           (sha256
            (base32 "0knr2f2kns02v5qvjgp98l9bxr3rq6ncfnzdvkszzczfpp8v211q"))))
       ("netdata-guix-stubs"
        ,(local-file "/home/adroit/guix-config-src/netdata_guix_stubs.c"))
       ("guix-journal-writer"
        ,(local-file "/home/adroit/guix-config-src/guix_journal_writer.c"))
       ("curl" ,curl)
       ("openssl" ,openssl)
       ("libuv" ,libuv)
       ("libunwind" ,libunwind)
       ("zlib" ,zlib)
       ("lz4" ,lz4)
       ("zstd" ,zstd "lib")
       ("brotli" ,google-brotli)
       ("util-linux" ,util-linux "lib")
       ("libcap" ,libcap)
       ("libmnl" ,libmnl)
       ("libnetfilter-acct" ,libnetfilter-acct)
       ("json-c" ,json-c)
       ("libyaml" ,libyaml)
       ("snappy" ,snappy)
       ("jemalloc" ,jemalloc)
       ("lm-sensors" ,lm-sensors)
       ("abseil-cpp" ,abseil-cpp)
       ("protobuf" ,protobuf)
       ("pcre2" ,pcre2)))
    (home-page "https://www.netdata.cloud/")
    (synopsis "Real-time performance monitoring (Stable & Liberated)")
    (description
     "Netdata is a high-performance monitoring tool. This version uses the modern
v2 engine but restores the stable, GPL-licensed v1 dashboard, ensuring full
reproducibility and removal of proprietary cloud components.")
    (license license:gpl3+)))
