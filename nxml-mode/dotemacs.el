(load "rng-auto")
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|rxm\\|rxg\\|xhtml\\)\\'" . nxml-mode)
	    auto-mode-alist))
(if (file-exists-p "/usr/local/share/schema/relaxCore.rnc")
    (add-to-list 'rng-auto-file-name-alist-default
		 '(".*\\.rxm\\'" "/usr/local/share/schema/relaxCore.rnc")))
(if (file-exists-p "/usr/local/share/schema/relaxNamespace.rnc")
    (add-to-list 'rng-auto-file-name-alist-default
		 '(".*\\.rxg\\'" "/usr/local/share/schema/relaxNamespace.rnc")))
