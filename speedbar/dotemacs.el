(autoload-if-found 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload-if-found 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(when my-xemacs-p
  (add-menu-button '("Tools")
		   ["Speedbar" speedbar-frame-mode
		    :style toggle
		    :selected (and (boundp 'speedbar-frame)
				   (frame-live-p speedbar-frame)
				   (frame-visible-p speedbar-frame))]
		   "--")
  (autoload 'Info-speedbar-buttons "sb-info"
    "Info specific speedbar button generator.")
  (autoload 'rmail-speedbar-buttons "sb-rmail"
    "Rmail specific speedbar button generator.")
  (autoload 'gud-speedbar-buttons "sb-gud"
    "GUD specific speedbar button generator."))
(when my-fsf-emacs-p
  (define-key-after (lookup-key global-map [menu-bar tools])
    [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar]))
(load-safe "sb-texinfo")
;; (autoload 'rpm "sb-rpm" "Rpm package listing in speedbar.")
;; (autoload 'w3-speedbar-buttons "sb-w3"
;;   "w3 specific speedbar button generator.")
