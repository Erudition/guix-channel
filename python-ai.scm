(define-module (python-ai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (nongnu packages cuda)
  #:use-module (nongnu packages nvidia))

(define-public ctranslate2-cuda
  (package
    (inherit ctranslate2)
    (name "ctranslate2-cuda")
    (arguments
     (substitute-keyword-arguments (package-arguments ctranslate2)
       ((#:configure-flags flags)
        #~(list "-DBUILD_TESTS=ON"
                "-DWITH_ACCELERATE=OFF"
                "-DWITH_RUY=OFF"
                "-DWITH_DNNL=ON"
                "-DWITH_CUDA=ON"
                "-DWITH_CUDNN=ON"
                "-DWITH_MKL=OFF"
                "-DWITH_OPENBLAS=ON"))))
    (inputs
     (modify-inputs (package-inputs ctranslate2)
       (append cuda cudnn)))))

(define-public python-ctranslate2-cuda
  (package
    (inherit python-ctranslate2)
    (name "python-ctranslate2-cuda")
    (native-inputs
     (modify-inputs (package-native-inputs python-ctranslate2)
       (replace "ctranslate2" ctranslate2-cuda)))))

(define-public python-faster-whisper-cuda
  (package
    (inherit python-faster-whisper)
    (name "python-faster-whisper-cuda")
    (propagated-inputs
     (modify-inputs (package-propagated-inputs python-faster-whisper)
       (replace "python-ctranslate2" python-ctranslate2-cuda)))))
