(load-safe "rng-auto")
(setq auto-mode-alist
      (cons
       '("\\.\\(xml\\|xsl\\|rng\\|rxm\\|rxg\\|rss\\|xhtml\\)\\'" . nxml-mode)
       auto-mode-alist))
(if (file-exists-p "/usr/local/share/xml/relaxDtd/relaxCore.rnc")
    (add-to-list 'rng-auto-file-name-alist-default
		 '(".*\\.rxm\\'" "/usr/local/share/xml/relaxDtd/relaxCore.rnc")))
(if (file-exists-p "/usr/local/share/xml/relaxDtd/relaxNamespace.rnc")
    (add-to-list 'rng-auto-file-name-alist-default
		 '(".*\\.rxg\\'" "/usr/local/share/xml/relaxDtd/relaxNamespace.rnc")))

(if (file-exists-p "/usr/local/share/xml/rng4rss10/rss-1_0.rnc")
    (add-to-list 'rng-auto-file-name-alist-default
		 '(".*\\.rss\\'" "/usr/local/share/xml/rng4rss10/rss-1_0.rnc")))
(if (file-exists-p "/usr/local/share/xml/ant-dtd/project.rnc")
    (setq rng-auto-element-alist-default
	  (cons
	   '((t t "project")
	     . "/usr/local/share/xml/ant-dtd/project.rnc")
	   rng-auto-element-alist-default)))
