(when (autoload-if-found 'python-mode "python-mode" "Python Mode.")
  (add-to-list 'auto-mode-alist (cons "\\.py\\'" 'python-mode))
  (add-to-list 'interpreter-mode-alist (cons "^#!.*python" 'python-mode)))
