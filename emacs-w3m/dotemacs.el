;; emacs-w3m
(autoload-if-found 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload-if-found 'w3m-find-file "w3m"
		   "w3m interface function for local file." t)
(autoload-if-found 'w3m-browse-url "w3m"
		   "Ask a WWW browser to show a URL." t)
(autoload-if-found 'w3m-search "w3m-search"
		   "Search QUERY using SEARCH-ENGINE." t)
(autoload-if-found 'w3m-weather "w3m-weather"
		   "Display weather report." t)
(autoload-if-found 'w3m-antenna "w3m-antenna"
		   "Report change of WEB sites." t)

(if (featurep 'meadow)
    (setq w3m-icon-directory
	  (concat my-install-prefix "/etc/w3m/icons/"))
  (setq w3m-icon-directory
	(concat my-install-prefix "/share/emacs/etc/w3m/")))
(setq w3m-type 'w3m-m17n)
(cond ((eq system-type 'freebsd)
       (setq w3m-command "w3m")))
;; mew-w3m.el
(load-safe "mew-w3m")
(setq mew-use-w3m-minor-mode t)
(add-hook 'mew-message-hook 'mew-w3m-minor-mode-setter)
(define-key mew-summary-mode-map "T" 'mew-w3m-view-inline-image)
(setq mew-ext-url-alist
      '(("^application/" "Fetch by emacs-w3m" mew-w3m-ext-url-fetch nil)
	(t "Browse by emacs-w3m" mew-w3m-ext-url-show nil)))
;; browse-url
; (setq browse-url-browser-function 'w3m-browse-url)
(global-set-key "\C-xm" 'browse-url-at-point)