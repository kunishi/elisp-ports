(if (not (locate-library "jde"))
    (add-to-list 'load-path
		 (concat my-emacs-lispdir "/jde/lisp")))
(when (and (autoload-if-found 'java-mode "jde" nil t)
	   (autoload-if-found 'jde-mode "jde" nil t))
  (add-to-list 'auto-mode-alist (cons "\\.java\\'" 'jde-mode))
  (add-to-list 'auto-mode-alist (cons "\\.jj\\'" 'java-mode))
  (defun my-jde-mode-hook ()
     (setq c-basic-offset 2)
     (c-set-offset 'substatement-open 0) ; this is the one you care about
     (c-set-offset 'statement-case-open 0)
     (c-set-offset 'case-label '+)
     (setq c-hanging-braces-alist
	   '((class-open after)
	     (inline-open after)
	     (func-decl-cont after)
	     (block-open after)
	     (substatement-open after)
	     (brace-list-open)))
     (setq c-cleanup-list
	   '(brace-else-brace 
	     brace-elseif-brace
	     brace-catch-brace
	     empty-defun-braces
	     defun-close-semi))
     (setq tab-width 2 ;; make sure spaces are used instead of tabs
	   indent-tabs-mode nil)
     (message "my-jde-mode-hook function executed"))
  (add-hook 'jde-mode-hook 'my-jde-mode-hook))
