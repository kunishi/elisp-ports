(load-safe "rng-auto")

;; maybe a bug.
(setq nxml-syntax-hightlight-flag nil)

(setq auto-mode-alist
      (cons
       '("\\.\\(xml\\|xsl\\|rng\\|rxm\\|rxg\\|rss\\|sdoc\\|xhtml\\)\\'" . nxml-mode)
       auto-mode-alist))
