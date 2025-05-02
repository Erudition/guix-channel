(define-module (sane-break)
  #:export (sane-break))


(use-modules (guix packages) (guix download) (guix build-system qt) (guix licenses) (gnu packages qt) (gnu packages xdisorg) (gnu packages xorg) (gnu packages kde-plasma) (gnu packages freedesktop) (gnu packages vulkan) (gnu packages gtk) (gnu packages pkg-config) (gnu packages kde-frameworks))


(package
	(name "sane-break")
	(version "0.8.1")
	(source (origin
				(method url-fetch)
				(uri (string-append "https://github.com/AllanChain/sane-break/archive/refs/tags/v" version
									".tar.gz"))
				(sha256
				(base32
				"1h25i2bafrjqjcaw6y9k8pwy8lj5swnwqwvsjffxi6iyqj74190g"))))
	(build-system qt-build-system)
	(inputs
		(list
		; for X11 support:
		libxkbcommon
		libxscrnsaver
		libx11
		))
	(native-inputs
		(list extra-cmake-modules pkg-config ; these two help it find the libs
		vulkan-headers qtbase qtmultimedia
		;; for Wayland support
		wayland ; can be native.
		layer-shell-qt ; can be native?
		qtwayland ; can be native?
		wayland-protocols ;; for non-gnome, hopefully provides idle-notify protocol
		wlr-protocols ; for wlroots and other DEs
		)
	)
	(outputs '("out" "debug"))
	(arguments
		(list
			#:tests? #f                         ; There are no tests so it fails
			#:qtbase qtbase
			;#:configure-flags '("-DAUTO_ENABLE_X11=ON -DAUTO_ENABLE_WAYLAND=ON") ; build for both
		)
	)
	(synopsis "A cross-platform break reminder designed to help you take meaningful breaks without disrupting your workflow.")
	(description
		"Most break reminder apps send notifications before the break is scheduled, but that merely informs me that a break is going to happen, rather than telling me it's happening right now. Even with a warning, when the break actually happens I'm too often deeply focused on a task. Then, the program either forces the break, interrupting my work, or I can use a 'skip' or 'postpone' button. Accepting abrupt interruption is too harsh, so I tend to click 'skip' or 'postpone'. Then, that becomes an almost instinctive habit, and before I know it, hours have passed without a single break.

		In contrast, Sane Break allows me to take ownership of when to stop and break. It starts by providing a gentle, non-intrusive reminder through a flashing window. The break officially begins as soon as I naturally pause after finishing my current task. This way, Sane Break offers the flexibility to wrap up my work and take a break on my terms, rather than forcing an abrupt interruption.

		Sane Break aims to strike a balance between respecting your workflow and ensuring you take the breaks you need.")
	(home-page "https://github.com/AllanChain/sane-break")
	(license gpl3)
)
