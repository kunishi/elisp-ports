(when (autoload-if-found 'mgp-mode "mgp-mode" nil t)
  (add-to-list 'auto-mode-alist (cons "\\.mgp\\'" 'mgp-mode))
  (setq mgp-options "-g 640x480")
  (setq mgp-window-height 6))
;; (add-hook 'mgp-mode-hook
;; 	  (function (lambda ()
;; 		      (set-file-coding-system-for-read 'iso-2022-jp-unix))))
