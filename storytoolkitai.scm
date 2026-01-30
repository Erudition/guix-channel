(define-module (storytoolkitai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages video)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages check)
  #:use-module (gnu packages time)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages python)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk))

(define-public python-darkdetect
  (package
    (name "python-darkdetect")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "darkdetect" version))
       (sha256
        (base32 "1cgqgpz36dfn7hsqc29ha9pmxmzdjlwdq9aclkgbagi6f08qwhmm"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/albertosottile/darkdetect")
    (synopsis "Detect OS Dark Mode from Python")
    (description "This package allows detecting if the OS is in Dark Mode.")
    (license license:bsd-3)))

(define-public python-patchify
  (package
    (name "python-patchify")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "patchify" version))
       (sha256
        (base32 "00jmhk8cbrp7kfxwffijdw8zb21zj8cdhc8r5xkyxkil9w90ki3c"))))
    (build-system python-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'relax-requirements
            (lambda _
              (substitute* "setup.py"
                (("numpy>=1,<2") "numpy")))))))
    (propagated-inputs (list python-numpy))
    (home-page "https://github.com/kavyajeetbora/patchify")
    (synopsis "Split image into small patches")
    (description "A library to split images into small overlapping patches.")
    (license license:expat)))

(define-public python-proglog
  (package
    (name "python-proglog")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "proglog" version))
       (sha256
        (base32 "1d6s9mg2fr3dr30x05cvsvw25kpakkzqyj2zyarawk1fr34ji335"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs (list python-tqdm))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Zulko/proglog")
    (synopsis "Logging system for progress bars")
    (description "Proglog is a logging system for progress bars.")
    (license license:expat)))

(define-public python-moviepy
  (package
    (name "python-moviepy")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "moviepy" version))
       (sha256
        (base32 "1x9klj7saywyh2ycj24imvbxpzbvpb2n7rw9zyrps1w82xfy7118"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'relax-requirements
            (lambda _
              (substitute* "setup.py"
                (("decorator<5.0,>=4.0.2") "decorator>=4.0.2"))))
          (delete 'sanity-check))))
    (propagated-inputs
     (list python-decorator
           python-tqdm
           python-requests
           python-proglog
           python-imageio
           python-imageio-ffmpeg))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://zulko.github.io/moviepy/")
    (synopsis "Video editing with Python")
    (description "MoviePy is a Python module for video editing.")
    (license license:expat)))

(define-public python-ftfy
  (package
    (name "python-ftfy")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ftfy" version))
       (sha256
        (base32 "1v06jn0y20xa6khrl046rwbxh4l9gxxs0xfkckz6gcjgz283sg4v"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs (list python-wcwidth))
    (native-inputs (list python-hatchling python-hatch-vcs))
    (home-page "https://github.com/rspeer/python-ftfy")
    (synopsis "Fix some problems with Unicode text")
    (description "ftfy fixes Unicode text that has been broken in various ways.")
    (license license:expat)))

(define-public python-timecode
  (package
    (name "python-timecode")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "timecode" version))
       (sha256
        (base32 "1fh7chx9flqb4c5lfv953dxk1542slwc0237vayin7king2gvpc4"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/eXist-db/python-timecode")
    (synopsis "SMPTE Timecode library")
    (description "A Python library for manipulating SMPTE timecodes.")
    (license license:expat)))

(define-public python-dtw-python
  (package
    (name "python-dtw-python")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dtw_python" version))
       (sha256
        (base32 "0860ps6j1kx7lv98v90snwkwczvqsdzcraq78c8dr7bw0sb2m0xd"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs (list python-numpy python-scipy))
    (native-inputs (list python-setuptools python-wheel python-cython))
    (home-page "https://dtw-python.github.io/")
    (synopsis "Dynamic Time Warping in Python")
    (description "Dynamic Time Warping (DTW) algorithms in Python.")
    (license license:gpl2+)))

(define-public python-spacy-langdetect
  (package
    (name "python-spacy-langdetect")
    (version "0.1.2-git")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Abhijit-2592/spacy-langdetect")
             (commit "b25490f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fg3ff83q9aqb73byz2jbiyl1pajxydxr4w5ajyq3hk8wvjcwq7s"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'relax-requirements
            (lambda _
              (substitute* "setup.py"
                (("langdetect==1.0.7") "langdetect>=1.0.7"))))
          (delete 'sanity-check))))
    (propagated-inputs (list python-spacy python-langdetect))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Abhijit-2592/spacy-langdetect")
    (synopsis "Language detection for spaCy")
    (description "A custom pipeline component for spaCy that detects languages.")
    (license license:expat)))

(define-public python-speechbrain
  (package
    (name "python-speechbrain")
    (version "1.0.0-git")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/speechbrain/speechbrain")
             (commit "f97c1b2")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1znr07y2y6grxhxh1r091vc8h75ymcgv16q4kivdngxivaq2y939"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f #:phases (modify-phases %standard-phases (delete 'sanity-check))))
    (propagated-inputs
     (list python-pytorch
           python-torchaudio
           python-huggingface-hub
           python-transformers
           python-numpy
           python-scipy
           python-tqdm
           python-pyyaml
           python-pydantic))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://speechbrain.github.io/")
    (synopsis "All-in-one conversational AI toolkit")
    (description "SpeechBrain is an open-source toolkit.")
    (license license:asl2.0)))

(define-public python-pyannote-core
  (package
    (name "python-pyannote-core")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyannote.core" version))
       (sha256
        (base32 "0vq9saq5qvfnv2sbc1sc2ikxsb1xdwxzlgm5byzac2v8pp4bqm8s"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
     (list python-numpy
           python-scipy
           python-pandas
           python-sortedcontainers
           python-typing-extensions))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/pyannote/pyannote-core")
    (synopsis "Advanced data structures for speaker diarization")
    (description "Advanced data structures for speaker diarization.")
    (license license:expat)))

(define-public python-julius
  (package
    (name "python-julius")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "julius" version))
       (sha256
        (base32 "025v9xal2xjf9qqysvjrr7i0fvxf9hknn6cmriph3mnp0r9my3rw"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs (list python-pytorch python-torchaudio))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/adefossez/julius")
    (synopsis "Fast B-spline and other signal processing for PyTorch")
    (description "Fast signal processing for PyTorch.")
    (license license:expat)))

(define-public python-primepy
  (package
    (name "python-primepy")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "primePy" version))
       (sha256
        (base32 "0sa6vs9aryxywjccj87g1cc1zksg0ngxhxack2jqj1sb6hjpxz95"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://github.com/v-at/primePy")
    (synopsis "Prime number library")
    (description "A Python library for prime numbers.")
    (license license:expat)))

(define-public python-torch-pitch-shift
  (package
    (name "python-torch-pitch-shift")
    (version "1.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "torch_pitch_shift" version))
       (sha256
        (base32 "1vfhzgg52bk313xbfynjqp2ma4x4hn1zzram9ix403wdy0qpa73f"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs (list python-pytorch python-torchaudio python-numpy python-primepy))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/KentoShakuto/torch-pitch-shift")
    (synopsis "Pitch shifting for PyTorch tensors")
    (description "Pitch shifting for PyTorch tensors.")
    (license license:expat)))

(define-public python-torch-audiomentations
  (package
    (name "python-torch-audiomentations")
    (version "0.12.0-git")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/asteroid-team/torch-audiomentations")
             (commit "f738dda")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jf3ybc01whcz286cxkwa2wbh4sn18g3cbpb21aww8vh30gcgszw"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f #:phases (modify-phases %standard-phases (delete 'sanity-check))))
    (propagated-inputs
     (list python-pytorch
           python-torchaudio
           python-pytorch-lightning
           python-numpy
           python-scipy
           python-julius
           python-torch-pitch-shift))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/asteroid-team/torch-audiomentations")
    (synopsis "Audio data augmentation in PyTorch")
    (description "Audio data augmentation in PyTorch.")
    (license license:expat)))

(define-public python-pyannote-database
  (package
    (name "python-pyannote-database")
    (version "5.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyannote.database" version))
       (sha256
        (base32 "0c9csn63fphwkxwy9qrf4pzyf6lv6pqh5myjc3g1hrshrk0n9bqf"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
     (list python-numpy
           python-pyannote-core
           python-pandas
           python-pyyaml
           python-typer
           python-typing-extensions))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/pyannote/pyannote-database")
    (synopsis "Multimedia database management for speaker diarization")
    (description "Multimedia database management for speaker diarization.")
    (license license:expat)))

(define-public python-colorlog
  (package
    (name "python-colorlog")
    (version "6.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "colorlog" version))
       (sha256
        (base32 "088k9z4j7ymh4yfvlbn7qbph4gp6m1hn0c62fdvyqzzycp5yajpb"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/borntyping/python-colorlog")
    (synopsis "Log formatting with colors")
    (description "Log formatting with colors.")
    (license license:expat)))

(define-public python-alembic
  (package
    (name "python-alembic")
    (version "1.18.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "alembic" version))
       (sha256
        (base32 "1c2h3q45xrivp85srhd04nyr96zrlnclxpd6187jnvv2g0vsl4hj"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f))
    (propagated-inputs
     (list python-mako
           python-sqlalchemy
           python-typing-extensions))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://alembic.sqlalchemy.org")
    (synopsis "Database migration tool for SQLAlchemy")
    (description "Database migration tool for SQLAlchemy.")
    (license license:expat)))

(define-public python-optuna
  (package
    (name "python-optuna")
    (version "4.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "optuna" version))
       (sha256
        (base32 "1h6jnaam12pg598149xkk7y0n9mfr7lf4zg9s9xma9cq0zi1f66r"))))
    (build-system pyproject-build-system)
    (arguments '(#:tests? #f #:phases (modify-phases %standard-phases (delete 'sanity-check))))
    (propagated-inputs
     (list python-alembic
           python-colorlog
           python-numpy
           python-packaging
           python-sqlalchemy
           python-tqdm
           python-pyyaml))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://optuna.org/")
    (synopsis "Hyperparameter optimization framework")
    (description "Hyperparameter optimization framework.")
    (license license:expat)))

(define-public python-pyannote-pipeline
  (package
    (name "python-pyannote-pipeline")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyannote.pipeline" version))
       (sha256
        (base32 "0laih0dnpqb8fkxkvqhlxcrsqpqzwx8mk0xibgxxix9cdbi985q2"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (propagated-inputs
     (list python-optuna
           python-pyannote-core
           python-pyyaml
           python-scikit-learn
           python-filelock
           python-docopt
           python-tqdm))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/pyannote/pyannote-pipeline")
    (synopsis "Advanced pipelines for speaker diarization")
    (description "Advanced pipelines for speaker diarization.")
    (license license:expat)))

(define-public python-opentelemetry-proto
  (package
    (name "python-opentelemetry-proto")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_proto" version))
       (sha256
        (base32 "0yci72h96jlj417gpmmxzswmw27wx0r5nvjrd72dfs4bbv0wkrdg"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (propagated-inputs
     (list python-protobuf))
    (native-inputs (list python-setuptools python-wheel python-hatchling))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "OpenTelemetry Python Proto")
    (description "OpenTelemetry Python Proto.")
    (license license:asl2.0)))

(define-public python-opentelemetry-exporter-otlp-proto-common
  (package
    (name "python-opentelemetry-exporter-otlp-proto-common")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_exporter_otlp_proto_common" version))
       (sha256
        (base32 "15rqq5rysk5nyxws4db21lr7j0h8az4n580cgn2i312igrwvzgyx"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (propagated-inputs
     (list python-opentelemetry-api
           python-opentelemetry-proto))
    (native-inputs (list python-setuptools python-wheel python-hatchling))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "OpenTelemetry OTLP Proto Common")
    (description "OpenTelemetry OTLP Proto Common.")
    (license license:asl2.0)))

(define-public python-opentelemetry-exporter-otlp-proto-http
  (package
    (name "python-opentelemetry-exporter-otlp-proto-http")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_exporter_otlp_proto_http" version))
       (sha256
        (base32 "1p5bwv795vcbhy55irdy52v37pcl1d6q39k20sk387hv33a7bbn3"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (propagated-inputs
     (list python-opentelemetry-api
           python-opentelemetry-sdk
           python-opentelemetry-exporter-otlp-proto-common
           python-deprecated))
    (native-inputs (list python-setuptools python-wheel python-hatchling))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "OpenTelemetry OTLP HTTP exporter")
    (description "OpenTelemetry OTLP HTTP exporter.")
    (license license:asl2.0)))

(define-public python-opentelemetry-exporter-otlp-proto-grpc
  (package
    (name "python-opentelemetry-exporter-otlp-proto-grpc")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opentelemetry_exporter_otlp_proto_grpc" version))
       (sha256
        (base32 "0xqiy38ky61lwa3kjqfcrii07rw0n8fd0i510iyknf4skc5hzwfh"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (propagated-inputs
     (list python-opentelemetry-api
           python-opentelemetry-sdk
           python-opentelemetry-exporter-otlp-proto-common
           python-deprecated))
    (native-inputs (list python-setuptools python-wheel python-hatchling))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "OpenTelemetry OTLP gRPC exporter")
    (description "OpenTelemetry OTLP gRPC exporter.")
    (license license:asl2.0)))

(define-public python-pyannote-audio
  (package
    (name "python-pyannote-audio")
    (version "3.1.1-git")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pyannote/pyannote-audio")
             (commit "6328b97")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lms5rcfw464p3bswwlmk3qyxgx7xi16fci8bf45zzygv0b2d2j7"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-version
            (lambda _
              (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" "3.1.1")))
          (delete 'sanity-check))))
    (propagated-inputs
     (list python-pytorch
           python-torchaudio
           python-speechbrain
           python-pyannote-core
           python-pyannote-database
           python-pyannote-pipeline
           python-pyannote-metrics
           python-torch-audiomentations
           python-opentelemetry-api
           python-opentelemetry-sdk
           python-opentelemetry-exporter-otlp-proto-http
           python-opentelemetry-exporter-otlp-proto-grpc
           python-huggingface-hub
           python-transformers
           python-einops
           python-pytorch-lightning
           python-numpy
           python-scipy
           python-tqdm
           python-pyyaml))
    (native-inputs (list python-setuptools python-wheel python-hatchling python-hatch-vcs))
    (home-page "https://github.com/pyannote/pyannote-audio")
    (synopsis "Neural building blocks for speaker diarization")
    (description "pyannote.audio is an open-source toolkit.")
    (license license:expat)))

(define-public python-customtkinter
  (package
    (name "python-customtkinter")
    (version "5.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/octimot/CustomTkinter.git")
             (commit "a2a8c37dd8dac1dee30133476596a5128adb0530")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yxmml24zwv13xd9jfh8yjw7y4qpz5207s06xszfcnq5y43b4iy8"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-darkdetect python-typing-extensions))
    (home-page "https://github.com/TomSchimansky/CustomTkinter")
    (synopsis "Modern and customizable python UI-library based on Tkinter")
    (description "CustomTkinter is a python UI-library based on Tkinter.")
    (license license:expat)))

(define-public python-openai-whisper
  (package
    (name "python-openai-whisper")
    (version "20231117")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openai/whisper.git")
             (commit "517a43ecd132a2089d85f4ebc044728a71d49f6e")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kjx68jpz17ivcfhyjm7n2dq6zfpakra0cw8bcnvinq4pl5i11s5"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-numba
           python-numpy
           python-pytorch
           python-tqdm
           python-more-itertools
           python-tiktoken))
    (home-page "https://github.com/openai/whisper")
    (synopsis "Robust Speech Recognition")
    (description "Whisper is a general-purpose speech recognition model.")
    (license license:expat)))

(define-public python-clip
  (package
    (name "python-clip")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openai/CLIP.git")
             (commit "a9b1bf5920416aaeaec965c25dd9e8f98c864f16")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zqxnvkffp6jy5qdbq31phz3mm93yx39q094sq4m74zkg2a89jfy"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-ftfy
           python-regex
           python-tqdm
           python-pytorch
           python-torchvision))
    (home-page "https://github.com/openai/CLIP")
    (synopsis "Contrastive Language-Image Pre-Training")
    (description "CLIP is a neural network.")
    (license license:expat)))

(define-public storytoolkitai
  (package
    (name "storytoolkitai")
    (version "0.19.0-git")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/octimot/StoryToolkitAI.git")
             (commit "541b4128d763adab4608fbfa6b888b1ae092a253")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "111awl380crz7jcrm0x58i3pv7b9k57mzs73r4aaysnl3wvhpc9r"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (replace 'build (lambda _ #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (site (string-append out "/lib/python3.11/site-packages"))
                    (bin (string-append out "/bin")))
               (mkdir-p site)
               (copy-recursively "storytoolkitai" (string-append site "/storytoolkitai"))
               (copy-file "requirements.txt" (string-append site "/requirements.txt"))
               (mkdir-p bin)
               (with-output-to-file (string-append bin "/storytoolkitai")
                 (lambda _
                   (format #t "#!/bin/sh
exec python3 -m storytoolkitai \"$@\"")))
               (chmod (string-append bin "/storytoolkitai") #o755)
               #t))))))
    (native-inputs (list python-wrapper)) ; ensure python3 is available during build/wrap
    (propagated-inputs
     (list python-customtkinter
           python-openai-whisper
           python-clip
           python-darkdetect
           python-patchify
           python-numpy
           opencv
           python-pytorch
           python-torchvision
           python-transformers
           python-requests
           python-urllib3
           python-openai
           python-pydantic
           python-pyyaml
           python-tqdm
           python-scikit-learn
           python-scikit-image
           python-scipy
           python-librosa
           python-filelock
           python-huggingface-hub
           python-certifi
           python-charset-normalizer
           python-idna
           python-packaging
           python-pyparsing
           python-regex
           python-tiktoken
           python-typing-extensions
           python-ftfy
           python-moviepy
           python-imageio
           python-imageio-ffmpeg
           python-ffmpeg-python
           python-timecode
           python-dtw-python
           python-spacy-langdetect
           python-sentence-transformers
           python-resampy
           python-soxr
           python-speechbrain
           python-pyannote-audio
           (list onnxruntime "python")))
    (home-page "https://github.com/octimot/StoryToolkitAI")
    (synopsis "AI toolkit for storytelling")
    (description "StoryToolkitAI is a tool to help with storytelling using AI.")
    (license license:agpl3)))
(define-public python-pyannote-metrics
  (package
    (name "python-pyannote-metrics")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyannote.metrics" version))
       (sha256
        (base32 "0p7f404r1j378m0r3s0d9146b216yd55ykysx6l9c3jmldal40h8"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-pyannote-core
           python-pyannote-database
           python-pandas
           python-scipy
           python-scikit-learn
           python-docopt
           python-tabulate
           python-matplotlib
           python-sympy))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/pyannote/pyannote-metrics")
    (synopsis "A toolkit for reproducible evaluation, diagnostic, and visualization of speaker diarization systems")
    (description "Pyannote.metrics is a toolkit for reproducible evaluation, diagnostic, and visualization of speaker diarization systems.")
    (license license:expat)))

