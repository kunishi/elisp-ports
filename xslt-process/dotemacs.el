;;; xslt-process initialization
;;; $Id$

(if (not (locate-library "xslt-process"))
    (add-to-list 'load-path
		 (concat my-emacs-lispdir "/xslt-process/lisp/")))
(when (autoload-if-found 'xslt-process-mode "xslt-process"
			 "Run XSLT processor on buffer" t)
  (add-hook 'pxml-mode-hook 'xslt-process-mode))
