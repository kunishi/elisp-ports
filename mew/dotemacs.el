;; all the settings are included in ~/.mew.el.
(cond ((eq system-type 'windows-nt)
       (setq mew-icon-directory (concat my-install-prefix "/etc/mew")))
;;       ((eq window-system 'mac)
;;        (setq mew-icon-directory
;; 	     (concat my-install-prefix
;; 		     "/Emacs.app/Contents/Resources/etc/Mew")))
      ((string= my-install-prefix "/sw")
       (setq mew-icon-directory
	     (concat my-install-prefix "/share/pixmaps/mew")))
      (t
       (setq mew-icon-directory
	     (concat my-install-prefix "/share/emacs/site-lisp/mew/etc"))))
(autoload-if-found 'mew "mew" nil t)
(autoload-if-found 'mew-send "mew" nil t)
(autoload-if-found 'mew-user-agent-compose "mew" nil t)

;;; Spam filter for IMAP server
(setq mew-imap-spam-field "X-Spam-Status")
(setq mew-imap-spam-word "Yes")
(setq mew-imap-trash-folder "%Trash")

;; Optional setup (Read Mail menu for Emacs 21)
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))

;; Optional setup (e.g. C-xm for sending a message)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-letter
      'mew-draft-kill
      'mew-send-hook))

