(when (autoload-if-found 'css-mode "css-mode" nil t)
  (add-to-list 'auto-mode-alist (cons "\\.css\\'" 'css-mode)))
