;;; sdoc-mode initialization
;;; $Id$

(when (autoload-if-found 'sdoc-mode "sdoc-mode" nil t)
  (add-to-list 'auto-mode-alist (cons "\\.sdoc\\'" 'sdoc-mode)))
