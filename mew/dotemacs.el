;; all the settings are included in ~/.mew.el.
(if (eq system-type 'windows-nt)
    (setq mew-icon-directory (concat my-install-prefix "/etc/mew"))
  (setq mew-icon-directory (concat my-install-prefix "/share/mew")))
(autoload-if-found 'mew "mew" nil t)
(autoload-if-found 'mew-send "mew" nil t)
(autoload-if-found 'mew-user-agent-compose "mew" nil t)

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
