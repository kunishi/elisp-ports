;; SKK
(load-safe "skk-setup")
(defun-add-hook 'isearch-mode-hook
  (and (boundp 'skk-mode) skk-mode (skk-isearch-mode-setup)))
(defun-add-hook 'isearch-mode-end-hook
  (and (featurep 'skk-isearch) (skk-isearch-mode-cleanup)))

;;; SKK-JISYO
(cond ((and (not (eq system-type 'windows-nt))
	    (not (eq system-type 'darwin))
	    (file-exists-p "/usr/local/libexec/dbskkd-cdb"))
       (setq skk-server-host "localhost"))
      ((eq system-type 'windows-nt)
       (setq skk-large-jisyo "C:/usr/local/share/skk/SKK-JISYO.L"))
      ((string= my-install-prefix "/sw")
       (setq skk-large-jisyo "/sw/share/ddskk/SKK-JISYO.L"))
      (t
       (setq skk-large-jisyo "/usr/local/share/skk/SKK-JISYO.L")))

