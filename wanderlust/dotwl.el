;;;							-*- emacs-lisp -*-
;;; ~/.wl (setting file for Wanderlust)
;;;						Last-Modified: 1999-05-12
;;;

(setq mime-setup-enable-inline-html nil)
(setq mime-edit-split-message nil)

(cond ((eq system-type 'windows-nt)
       (setq wl-icon-directory (concat my-install-prefix "/etc/wl/")))
      (t
       (setq wl-icon-directory
	     (concat my-install-prefix "/share/emacs/etc/wl/"))))

(setq wl-from "KUNISHIMA Takeo <kunishi@chorusroom.org>")
(setq wl-fcc "%INBOX.Sent")
(setq wl-user-mail-address-list
      (list (wl-address-header-extract-address wl-from)
	    "kunishi@is.aist-nara.ac.jp"
	    "kunishi@kuis.kyoto-u.ac.jp"
	    "kunishi@imel.kyoto-u.ac.jp"
	    "kunishi@acm.org"
	    "kunishi@chorusroom.org"
	    "kunishi@land.linkclub.or.jp"
	    "QYG06054@nifty.ne.jp"
	    ))
(setq wl-subscribed-mailing-list
      '("wl@lists.airs.net"
	"apel-ja@m17n.org"
	"emacs-mime-ja@m17n.org"
	"mew-dist@mew.org"
	"emacs-w3m@namazu.org"
	"semi-gnus-ja@meadowy.org"
	"yatex@yatex.org"
	"mgp-users-jp@mew.org"
	"freebsd-current@freebsd.org"
	"freebsd-stable@freebsd.org"
	"cvs-all@freebsd.org"
	"freebsd-java@freebsd.org"
	"freebsd-multimedia@freebsd.org"
	"freebsd-mobile@frebsd.org"
	"FreeBSD-users-jp@jp.freebsd.org"
	"ports-jp@jp.freebsd.org"
	"acpi-jp@jp.freebsd.org"
	"bsd-nomads@clave.gr.jp"
	"xml-dev@lists.xml.org"
	"xmluser@xml.gr.jp"
	"relusrj@xml.gr.jp"
	"announcements@xml.apache.org"
	"batik-users@xml.apache.org"
	"fop-dev@xml.apache.org"
	"general@xml.apache.org"
	"xalan-dev@xml.apache.org"
	"xerces-j-dev@xml.apache.org"
	"xerces-j-user@xml.apache.org"
	"xindice-dev@xml.apache.org"
	"xindice-users@xml.apache.org"
	"macosx-jp@ml.tech-arts.co.jp"
	"installer@jp.win.ne.jp"
	"PDFml-J-lst@y7.com"
	"fml-help@ffs.fml.org"
	"fml-support@ffs.fml.org"
	"dbjapan@c.oka-pu.ac.jp"
	"ipsj-tod-editors@mdbl.sfc.keio.ac.jp"
	"ipsj-tod@mdbl.sfc.keio.ac.jp"
	"harmony-ml@egroups.co.jp"
	"amabile@chorusroom.org"
	"hamoru@psi.c.oka-pu.ac.jp"
	"owner-dbjapan@dbmail.c.oka-pu.ac.jp"))
(setq wl-local-domain "chorusroom.org")

(setq elmo-imap4-default-server "mail.chorusroom.org")
(setq elmo-pop3-default-server "mail.chorusroom.org")
(setq wl-smtp-posting-server "mail.chorusroom.org")
(setq elmo-nntp-default-server "news.gmane.org")
(setq wl-nntp-posting-server elmo-nntp-default-server)
(setq elmo-imap4-default-authenticate-type 'clear)
(setq wl-fldmgr-add-complete-with-current-folder-list t)

(setq wl-interactive-exit t)
(setq wl-interactive-send t)

(setq elmo-enable-disconnected-operation t)
(setq wl-draft-enable-queuing t)
(setq wl-auto-flush-queue t)
(setq elmo-msgdb-extra-fields
      '("newsgroups" "sender"
	"list-id" "x-ml-name" "mailing-list"
	"x-mail-count" "x-ml-count" "x-sequence"))
(setq wl-summary-subject-function 'my-wl-summary-subject-func-ml)
(defun my-wl-summary-subject-func-ml (subject-string)
  (let ((folder wl-summary-buffer-folder-name)
	(subj subject-string) (sequence) (ml-name) (ml-count))
    (setq sequence (elmo-msgdb-overview-entity-get-extra-field
		    entity "x-sequence")
	  ml-name (or (elmo-msgdb-overview-entity-get-extra-field
		       entity "x-ml-name")
		      (and sequence
			   (car (split-string sequence " "))))
	  ml-count (or (elmo-msgdb-overview-entity-get-extra-field
			entity "x-mail-count")
		       (elmo-msgdb-overview-entity-get-extra-field
			entity "x-ml-count")
		       (and sequence
			    (cadr (split-string sequence " ")))))
    (if (string-match
	 "^\\s(\\(\\S)+\\)[ :]\\([0-9]+\\)\\s)[ \t]*"
	 subject-string)
	(progn
	  (setq subj (substring subject-string (match-end 0)))
	  (if (not ml-name) (setq ml-name (match-string 1 subject-string)))
	  (if (not ml-count) (setq ml-count (match-string 2 subject-string)))))
    (condition-case nil
	(if (and ml-name ml-count)
	    (if (string= folder wl-default-folder)
		(format "(%s %05d) %s"
			(car (split-string ml-name " "))
			(string-to-int ml-count)
			subj)
	      (format "#%05d %s"
		      (string-to-int ml-count) subj))
	  subj)
      (error subj))))

(setq wl-generate-mailer-string-function
     (function
      (lambda ()
	 (concat "User-Agent: "
		 (wl-generate-user-agent-string-1 nil)))))

(setq wl-draft-reply-without-argument-list
      '((("X-ML-Name" "Reply-To") . (("Reply-To") nil nil))
	("X-ML-Name" . (("To" "Cc") nil nil))
	("Followup-To" . (nil nil ("Followup-To")))
	("Newsgroups" . (nil nil ("Newsgroups")))
	("Reply-To" . (("Reply-To") nil nil))
	("Mail-Reply-To" . (("Mail-Reply-To") nil nil))
	("From" . (("From") nil nil))))

(setq wl-draft-reply-with-argument-list
      '(("Followup-To" . (("From") nil ("Followup-To")))
	("Newsgroups" . (("From") nil ("Newsgroups")))
	("Mail-Followup-To" . (("Mail-Followup-To") nil ("Newsgroups")))
	("From" . (("From") ("To" "Cc") ("Newsgroups")))))

(setq wl-message-ignored-field-list
      '(".*Received:" ".*Path:" ".*Id:" "^References:"
	"^Replied:" "^Errors-To:"
	"^Lines:" "^Sender:" ".*Host:" "^Xref:"
	"^Content-Type:" "^Precedence:"
	"^Status:" "^X-VM-.*:"))
(setq wl-message-visible-field-list '("^Message-Id:"))

(setq wl-template-alist
      '(("default"
	 ("From" . "kunishi@c.oka-pu.ac.jp")
	 ("Organization" . "Okayama Prefectural University")
	 ("Fcc" . "%INBOX.Sent"))
	("chorusroom"
	 ("From" . wl-from)
	 ("Organization" . "Chorusroom Org.")
	 ("Fcc" . "%INBOX.Sent"))))

(setq wl-refile-rule-alist
      '(("Sender"
	 ("^owner-freebsd-ports" . "%inbox.comp.freebsd.freebsd-ports")
	 ("^owner-freebsd-current" . "%inbox.comp.freebsd.freebsd-current")
	 ("^owner-freebsd-stable" . "%inbox.comp.freebsd.freebsd-stable")
	 ("^owner-freebsd-java" . "%inbox.comp.freebsd.freebsd-java")
	 ("^owner-freebsd-mobile" . "%inbox.comp.freebsd.freebsd-mobile")
	 ("^owner-freebsd-multimedia" . "%inbox.comp.freebsd.freebsd-multimedia")
	 ("^owner-cvs-all" . "%inbox.comp.freebsd.cvs-all")
	 ("^owner-announce-jp" . "%inbox.comp.freebsd.announce-jp")
	 ("^owner-acpi-jp" . "%inbox.comp.freebsd.acpi-jp")
	 ("^owner-ports-jp" . "%inbox.comp.freebsd.ports-jp")
	 ("^owner-FreeBSD-users-jp" . "%inbox.comp.freebsd.FreeBSD-users-jp")
	 ("^owner-bsd-nomads" . "%inbox.comp.bsd.bsd-nomads")
	 ("^owner-xmldb" . "%inbox.comp.xml.xmldb")
	 ("^www-vrml-approval" . "%inbox.comp.3d.www-vrml")
	 ("^owner-dbworld" . "%inbox.research.dbworld")
	 ("^dbjapan-request" . "%inbox.research.dbjapan"))
	("mailing-list"
	 ("announcements@xml.apache.org" . "%inbox.comp.xml.apache.announcements")
	 ("batik-users" . "%inbox.comp.xml.apache.batik-users")
	 ("fop-dev" . "%inbox.comp.xml.apache.fop-dev")
	 ("general@xml.apache.org" . "%inbox.comp.xml.apache.general")
	 ("xalan-dev" . "%inbox.comp.xml.apache.xalan-dev")
	 ("xerces-j-dev" . "%inbox.comp.xml.apache.xerces-j-dev")
	 ("xerces-j-user" . "%inbox.comp.xml.apache.xerces-j-user")
	 ("xindice-dev" . "%inbox.comp.xml.apache.xindice-dev")
	 ("xindice-users" . "%inbox.comp.xml.apache.xindice-users")
	 ("jde" . "%inbox.comp.emacs.jde"))
	("x-ml-name"
	 ("Mew-dist" . "%inbox.comp.emacs.mew-dist")
	 ("Wanderlust" . "%inbox.comp.emacs.wl")
	 ("tm(ja)" . "%inbox.comp.emacs.tm-ja")
	 ("emacs-mime-ja" . "%inbox.comp.emacs.emacs-mime-ja")
	 ("emacs-w3m" . "%inbox.comp.emacs.emacs-w3m")
	 ("apel-ja" . "%inbox.comp.emacs.apel-ja")
	 ("semi-gnus-ja" . "%inbox.comp.emacs.semi-gnus-ja")
	 ("fml-help" . "%inbox.comp.mail.fml-help"))
	))

