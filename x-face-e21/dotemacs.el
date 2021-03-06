(autoload-if-found 'x-face-encode "x-face"
		   "Generate X-Face string(s) from xbm file." t)
(autoload-if-found 'x-face-insert "x-face" "Insert X-Face fields." t)
(autoload-if-found 'x-face-save "x-face" "Save X-Face fields to files." t)
(autoload-if-found 'x-face-view "x-face" "View X-Face fields." t)
(autoload-if-found 'x-face-ascii-view "x-face"
		   "View X-Face fields as ascii pictures." t)
(when (and (autoload-if-found 'x-face-decode-message-header "x-face-e21")
	   (autoload-if-found 'x-face-insert "x-face-e21" nil t)
	   (autoload-if-found 'x-face-save "x-face-e21" nil t)
	   (autoload-if-found 'x-face-show "x-face-e21" nil t)
	   (autoload-if-found 'x-face-turn-off "x-face-e21"))
  (add-hook 'mime-edit-trancelate-hook 'x-face-turn-off)
  (add-hook 'mew-make-message-hook 'x-face-turn-off))
(setq x-face-auto-image t)
(setq wl-highlight-x-face-function 'x-face-decode-message-header)
