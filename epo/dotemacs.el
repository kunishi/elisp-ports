(when (autoload-if-found 'epo "epo" "Editing Process Organizer" t)
  (setq epo-language-alist
	'(("sdoc-mode" . "sdoc")
	  ("ant-mode" . "ant")))
  (add-hook 'sdoc-mode-hook 'epo))
