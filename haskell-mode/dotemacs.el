(when
    (and
     (autoload-if-found 'haskell-mode "haskell-mode"
			"Major mode for editing Haskell scripts." t)
     (autoload-if-found 'literate-haskell-mode "haskell-mode"
			"Major mode for editing literate Haskell scripts." t))
  (add-to-list 'auto-mode-alist (cons "\\.[hg]s\\'" 'haskell-mode))
  (add-to-list 'auto-mode-alist (cons "\\.hi\\'" 'haskell-mode))
  (add-to-list 'auto-mode-alist (cons "\\.l[hg]s\\'" 'haskell-mode))
  (add-hook 'haskell-mode-hook 'turn-on-haskell-font-lock)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
  (setq haskell-literate-default 'latex))
