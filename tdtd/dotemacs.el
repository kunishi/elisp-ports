;;; tdtd initialize
;;; $Id$

(when 
    (and
     (autoload-if-found 'dtd-mode "tdtd" "Major mode for SGML and XML DTDs." t)
     (autoload-if-found
      'dtd-etags "tdtd"
      "Execute etags on FILESPEC and match on DTD-specific regular expressions." t)
     (autoload-if-found 'dtd-grep "tdtd"
			"Grep for PATTERN in files matching FILESPEC." t))
  (defun-add-hook 'dtd-mode-hooks
    (exec-if-bound (turn-on-font-lock)))
  (add-to-list 'auto-mode-alist (cons "\\.dcl\\'" 'dtd-mode))
  (add-to-list 'auto-mode-alist (cons "\\.dec\\'" 'dtd-mode))
  (add-to-list 'auto-mode-alist (cons "\\.dtd\\'" 'dtd-mode))
  (add-to-list 'auto-mode-alist (cons "\\.ent\\'" 'dtd-mode))
  (add-to-list 'auto-mode-alist (cons "\\.mod\\'" 'dtd-mode)))
