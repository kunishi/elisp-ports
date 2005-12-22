(when (and
       (autoload-if-found 'sml-mode "sml-mode"
			  "Major mode for editing Standard ML." t)
       (autoload-if-found 'run-sml "sml-proc" "Run an inferior ML process." t))
  (add-to-list 'auto-mode-alist (cons "\\.s\\(ml\\|ig\\)\\'" 'sml-mode))
  (add-to-list 'completion-ignored-extensions "CM/")
  (setq sml-mode-info "/usr/local/info/sml-mode.info")
  (when (eq system-type 'darwin)
    (setq sml-program-name "/opt/local/bin/sml")))
