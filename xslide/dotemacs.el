;;; xslide initialize
;;; $Id$

(when (autoload-if-found 'xsl-mode "xslide"
			 "Major mode for XSL stylesheets." t)
  (add-hook 'xsl-mode-hook 'turn-on-font-lock)
  (add-to-list 'auto-mode-alist (cons "\\.fo\\'" 'xsl-mode)))

;; (add-to-list 'auto-mode-alist (cons "\\.xsl\\'" 'xsl-mode))
