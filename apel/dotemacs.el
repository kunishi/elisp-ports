(if (not (fboundp 'add-path))
    (cond ((file-exists-p (concat my-emacs-lispdir "/apel"))
	   (add-to-list 'load-path (concat my-emacs-lispdir "/apel")))
	  ((file-exists-p (concat my-emacs-version-specific-lispdir "/apel"))
	   (add-to-list 'load-path
			(concat my-emacs-version-specific-lispdir "/apel")))))
