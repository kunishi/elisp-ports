(when (autoload-if-found 'ruby-mode "ruby-mode" "Ruby mode.")
  (add-to-list 'auto-mode-alist (cons "\\.rb\\'" 'ruby-mode))
  (add-to-list 'interpreter-mode-alist (cons "^#!.*ruby" 'ruby-mode)))
;; inf-ruby
(when (and (autoload-if-found 'run-ruby "inf-ruby"
			      "Run an inferior Ruby process")
	   (autoload-if-found 'inf-ruby-keys "inf-ruby"
			      "Set local key defs for inf-ruby in ruby-mode."))
  (defun-add-hook 'ruby-mode-hook 'inf-ruby-keys))
