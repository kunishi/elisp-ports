;; all the settings are included in ~/.mew.el.
(if (eq system-type 'windows-nt)
    (setq mew-icon-directory (concat my-install-prefix "/etc/mew"))
  (setq mew-icon-directory (concat my-install-prefix "/share/emacs/etc/mew")))
(autoload-if-found 'mew "mew" nil t)
(autoload-if-found 'mew-send "mew" nil t)
(autoload-if-found 'mew-user-agent-compose "mew" nil t)

;; SPAM filtering using bogofilter
(setq mew-spam "X-Bogosity:")
(setq mew-spam-prog "ssh")
(setq mew-spam-prog-args
      '("imap.chorusroom.org" "bogofilter" "-s" "-v"))
(setq mew-ham-prog "ssh")
(setq mew-ham-prog-args
      '("imap.chorusroom.org" "bogofilter" "-n" "-v"))
(defun mew-spam-bogofilter (val)
  (let ((case-fold-search t))
    (if (string-match "yes" val) ?D)))
(setq mew-inbox-action-alist
      '(("X-Bogosity:" mew-spam-bogofilter)))

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
