(when (and (autoload-if-found 'epo "epo" "Editing Process Organizer" t)
	   (autoload-if-found 'epoxml-mode "epoxml" "Epo-xml mode" t))
  (setq epo-language-alist
	'(("sdoc-mode" . "sdoc")
	  ("xml-mode" . "sdoc")
	  ("ant-mode" . "ant")))
  (add-hook 'sdoc-mode-hook 'epo))
(when (autoload-if-found 'epo-xml-enable "epo-xml"
			 "Editing Process Organizer for XML" t)
  (add-hook 'sgml-mode-hook 'epo-xml-enable))
