(load-safe "rng-auto")
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|rxm\\|rxg\\|xhtml\\)\\'" . nxml-mode)
	    auto-mode-alist))
(if (file-exists-p "/usr/local/share/xml/relaxDtd/relaxCore.rnc")
    (add-to-list 'rng-auto-file-name-alist-default
		 '(".*\\.rxm\\'" "/usr/local/share/xml/relaxDtd/relaxCore.rnc")))
(if (file-exists-p "/usr/local/share/xml/relaxDtd/relaxNamespace.rnc")
    (add-to-list 'rng-auto-file-name-alist-default
		 '(".*\\.rxg\\'" "/usr/local/share/xml/relaxDtd/relaxNamespace.rnc")))
