(when (autoload-if-found 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
  (add-to-list 'auto-mode-alist (cons "\\.tex\\'" 'yatex-mode))
  (add-to-list 'auto-mode-alist (cons "\\.latex\\'" 'yatex-mode))
  (add-to-list 'auto-mode-alist (cons "\\.ltx\\'" 'yatex-mode))
  (setq tex-command "platex")
;;   (cond ((eq system-type 'darwin)
;; 	 (setq dvi2-command "open"))
;; 	(t
;; 	 (setq dvi2-command "xdvi")))
  (cond ((eq system-type 'darwin)
	 (setq dvi2-command "open -a Mxdvi"))
	(t
	 (setq dvi2-command "xdvi")))
  (setq NTT-jTeX nil)
  (setq dviprint-command-format "dvips %f %t %s | lpr")
  (setq dviprint-from-format "-p %b")
  (setq dviprint-to-format "-l %e")
  (setq YaTeX-use-AMS-LaTeX t)
  ;; JIS
  (setq YaTeX-kanji-code 2))
;;; yahtml
;; (add-to-list 'auto-mode-alist (cons "\\.html\\'" 'yahtml-mode))
(when (autoload-if-found 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
  (setq yahtml-www-browser "mozilla"))
;; (setq yahtml-path-url-alist
;;       '(("/home/yuuji/public_html" . "http://www.mynet/~yuuji")
;; 	("/home/staff/yuuji/html" . "http://www.othernet/~yuuji")))
