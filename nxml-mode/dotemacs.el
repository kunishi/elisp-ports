(load-safe "rng-auto")

;; maybe a bug.
(setq nxml-syntax-hightlight-flag nil)

;; disable xml-mode

(add-to-list 'auto-mode-alist (cons "\\.xml\\'" 'nxml-mode))
(add-to-list 'auto-mode-alist (cons "\\.xsl\\'" 'nxml-mode))
(add-to-list 'auto-mode-alist (cons "\\.rng\\'" 'nxml-mode))
(add-to-list 'auto-mode-alist (cons "\\.rxm\\'" 'nxml-mode))
(add-to-list 'auto-mode-alist (cons "\\.rxg\\'" 'nxml-mode))
(add-to-list 'auto-mode-alist (cons "\\.xhtml\\'" 'nxml-mode))
(setq magic-mode-alist (cons '("<\\?xml " . nxml-mode) magic-mode-alist))
