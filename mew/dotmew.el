;;; -*- Emacs-Lisp -*-
;;; .MEW.EL --- Mew setup file

;;; IMAP
(setq mew-proto "%")

(setq mew-fcc "+outbox")
(setq mew-dcc "kunishi-sent@chorusroom.org")
(setq mew-mail-domain-list
      '("c.oka-pu.ac.jp"
	"acm.org"
	"land.linkclub.or.jp"
	"chorusroom.org"))
(setq mew-mail-address-list
      '("kunishi@c.oka-pu.ac.jp"
	"kunishi@[a-zA-Z0-9]*.c.oka-pu.ac.jp"
	"kunishi@chorusroom.org"
	"kunishi@acm.org"
	"kunishi@land.linkclub.or.jp"
	"kunishi@[a-zA-Z0-9]*.chorusroom.org"
	"QYG06054@nifty.ne.jp"
	"hamoru@www16t.sakura.ne.jp"))
(setq mew-pop-server "dbmail.c.oka-pu.ac.jp")
(setq mew-smtp-server "dbmail.c.oka-pu.ac.jp")
(setq mew-imap-trash-folder "%Trash")

(setq mew-use-folders-file-p t)
(setq mew-decode-quoted t)
;(setq mew-use-highlight-body t)
(setq mew-use-cached-passwd t)

(setq mew-decode-illegal-quoted-phrase t)
(setq mew-decode-illegal-raw-subject t)
(setq mew-decode-illegal-text-body t)

(setq mew-config-alist
      '(("nifty"
	 ("proto" . "+")
	 ("user" . "QYG06054")
	 ("mail-domain" . "nifty.ne.jp")
	 ("pop-server" . "pop.nifty.com")
	 ("pop-ssh-server" . nil)
	 ("pop-user" . "QYG06054")
	 ("pop-auth" . pass)
	 ("pop-delete" . t)
	 ("smtp-server" . "smtp.nifty.com")
	 ("smtp-ssh-server" . nil)
	 ("nntp-server" . "news.nifty.com"))
	("linkclub"
	 ("proto" . "+")
	 ("mail-domain" . "land.linkclub.or.jp")
	 ("msgid-domain" . "land.linkclub.or.jp")
	 ("organization" . "Linkclub Internet")
	 ("pop-ssh-server" . nil)
	 ("pop-server" . "land.linkclub.or.jp")
	 ("pop-auth" . pass)
	 ("pop-delete" . t)
	 ("pop-user" . "kunishi")
	 ("smtp-server" . "land.linkclub.or.jp")
	 ("smtp-ssh-server" . nil)
	 ("nntp-server" . "news.linkclub.or.jp"))
	("office"
	 ("proto" . "%")
	 ("mail-domain" . "c.oka-pu.ac.jp")
	 ("msgid-domain" . "dbmail.c.oka-pu.ac.jp")
	 ("organization" . "Okayama Prefectural University")
	 ("signature-file" . "~/.signature-office")
	 ("imap-server" . "dbmail.c.oka-pu.ac.jp")
	 ("imap-user" . "kunishi")
	 ("imap-auth" . nil)
	 ("imap-ssh-server" . "dbmail.c.oka-pu.ac.jp")
	 ("smtp-server" . "dbmail.c.oka-pu.ac.jp")
	 ("smtp-ssh-server" . "dbmail.c.oka-pu.ac.jp")
	 ("spam-prog" . "ssh")
	 ("spam-prog-args" . ("dbmail.c.oka-pu.ac.jp" "bogofilter" "-s" "-v"))
	 ("ham-prog" . "ssh")
	 ("ham-prog-args" . ("dbmail.c.oka-pu.ac.jp" "bogofilter" "-n" "-v")))
	("acm"
	 ("mail-domain" . "acm.org")
	 ("msgid-domain" . "dbmail.c.oka-pu.ac.jp")
	 ("organization" . "Okayama Prefectural University")
	 ("signature-file" . "~/.signature-acm"))
	("dbjapan-desk"
	 ("user" . "dbsj-dbjapan-desk")
	 ("mail-domain" . "dbsj.c.oka-pu.ac.jp")
	 ("msgid-domain" . "dbsj.c.oka-pu.ac.jp")
	 ("organization" . "Database Society of Japan")
	 ("name" . "dbjapan ML maintainer"))
	("shop"
	 ("mail-domain" . "shop.chorusroom.org"))
	("bsd"
	 ("mail-domain" . "bsd.chorusroom.org"))
	("xml"
	 ("mail-domain" . "xml.chorusroom.org"))
	("hamoru"
	 ("name" . "Hamoru KOBE WWW maintainer")
	 ("user" . "hamoru")
	 ("organization" . "Hamoru KOBE")
	 ("mail-domain" . "www16t.sakura.ne.jp")
	 ("signature-file" . "~/.signature-hamoru"))
	("default"
	 ("name" . "KUNISHIMA Takeo")
	 ("proto" . "%")
	 ("mail-domain" . "chorusroom.org")
	 ("msgid-domain" . "chorusroom.org")
	 ("organization" . "ChorusRoom Org.")
	 ("signature-file" . "~/.signature-chorusroom")
	 ("imap-server" . "imap.chorusroom.org")
	 ("imap-user" . "kunishi")
	 ("imap-auth" . nil)
	 ("imap-ssh-server" . "fw.chorusroom.org")
	 ("nntp-server" . "news.gmane.org")
	 ("nntp-folder" . "+nntp-gmane")
	 ("smtp-server" . "mail.chorusroom.org")
	 ("smtp-ssh-server" . "fw.chorusroom.org")
	 ("spam-prog" . "ssh")
	 ("spam-prog-args" . ("imap.chorusroom.org" "bogofilter" "-s" "-v"))
	 ("ham-prog" . "ssh")
	 ("ham-prog-args" . ("imap.chorusroom.org" "bogofilter" "-n" "-v")))))

;; refile
(setq mew-refile-guess-from-me-is-special t)
(setq mew-refile-guess-alist
      '(("From:"
	 ("^.*@internic.net$" . "%comp.internic")
	 ("^.*@forteinc.com$" . "%comp.forteinc")
	 ("^.*@netricoh.com$" . "%company.netricoh")
	 ("^.*@networksolutions.com$" . "%comp.networksolutions")
	 ("^.*@mytrip.net$" . "%leisure.mytrip")
	 ("^news@filemaker.co.jp$" . "%comp.filemaker")
	 ("^newsletter@adobe.co.jp$" . "%comp.adobe.newsletter")
	 ("^hamoru@www16t.sakura.ne.jp$" . "%www.hamoru"))
	("Subject:"
	 ("^(DBWORLD)" . "%research.dbworld")
	 ("^\\[SDC\\]" . "%comp.sun.soldc"))
	("X-Sender:" 
	 ("tcse@" . "%assoc.acm.tcse"))
	("X-Ml-Name:"
	 ("Mew-dist" . "%comp.emacs.mew-dist")
	 ("Wanderlust" . "%comp.emacs.wl")
	 ("tm(ja)" . "%comp.emacs.tm-ja")
	 ("emacs-mime-ja" . "%comp.emacs.emacs-mime-ja")
	 ("emacs-w3m" . "%comp.emacs.emacs-w3m")
	 ("apel-ja" . "%comp.emacs.apel-ja")
	 ("semi-gnus-ja" . "%comp.emacs.semi-gnus-ja"))
	("To:"
	 ("all@alpha.c.oka-pu.ac.jp" . "%opu.yokotalab.all")
	 ("dbjapan-request@" . "%admin.dbjapan-request")
	 ("SolDCNewsSubscribers@Sun.COM" . "%comp.sun.solaris-dc")
	 ("kunishi@shop.chorusroom.org" . "%comp.direct")
	 ("^hamoru@psi.c.oka-pu.ac.jp" . "%chorus.hamoru")
	 ("^hamoru@www16t.sakura.ne.jp" . "%www.hamoru"))
	("Sender:"
	 ("dbjapan-request@c.oka-pu.ac.jp" . "%research.dbjapan")
	 ("Juten-A02-request@ml.aist-nara.ac.jp" . "%research.juten.Juten-A02")
	 ("announce-jp@FreeBSD.ORG" . "%comp.freebsd.announce-jp")
	 ("owner-acpi-jp@jp.FreeBSD.ORG" . "%comp.freebsd.acpi-jp")
	 ("owner-announce-jp@jp.FreeBSD.ORG" . "%comp.freebsd.announce-jp")
	 ("owner-ports-jp@jp.FreeBSD.ORG" . "%comp.freebsd.ports-jp")
	 ("owner-freebsd-announce@FreeBSD.ORG" . "%comp.freebsd.freebsd-announce")
	 ("owner-freebsd-current@FreeBSD.ORG" . "%comp.freebsd.freebsd-current")
	 ("owner-freebsd-java@FreeBSD.ORG" . "%comp.freebsd.freebsd-java")
	 ("owner-freebsd-mobile@FreeBSD.ORG" . "%comp.freebsd.freebsd-mobile")
	 ("owner-freebsd-multimedia@FreeBSD.ORG" . "%comp.freebsd.freebsd-multimedia")
	 ("owner-freebsd-ports@FreeBSD.ORG" . "%comp.freebsd.freebsd-ports")
	 ("owner-freebsd-stable@FreeBSD.ORG" . "%comp.freebsd.freebsd-stable")
	 ("owner-freebsd-gnome@FreeBSD.ORG" . "%comp.freebsd.freebsd-gnome")
	 ("owner-cvs-all@FreeBSD.ORG" . "%comp.freebsd.cvs-all")
	 ("kde-freebsd-bounces@lists.csociety.org" . "%comp.freebsd.kde")
	 ("owner-FreeBSD-users-jp@jp.FreeBSD.ORG" . "%comp.freebsd.FreeBSD-users-jp")
	 ("owner-bsd-nomads@clave.gr.jp" . "%comp.bsd.bsd-nomads")
	 ("owner-xmlql-interest@research.att.com" . "%comp.xml.xmlql-interest")
	 ("owner-xmldb" . "%comp.xml.xmldb")
	 ("owner-dbworld@cs.wisc.edu" . "%research.dbworld")
	 ("www-vrml-approval@web3d.org" . "%comp.3d.www-vrml"))
	("list-post:"
	 ("announcements@xml.apache.org" . "%comp.xml.apache.announcements")
	 ("general@xml.apache.org" . "%comp.xml.apache.general")
	 ("xerces-j-user" . "%comp.xml.apache.xerces-j-user")
	 ("xerces-j-dev" . "%comp.xml.apache.xerces-j-dev")
	 ("xalan-dev" . "%comp.xml.apache.xalan-dev")
	 ("xindice-dev" . "%comp.xml.apache.xindice-dev")
	 ("xml-dev" . "%comp.xml.xml-dev"))
	("list-id"
	 ("dbworld" . "%research.dbworld"))
	("Mailing-List:"
	 ("solarisonintel" . "%comp.sun.solarisonintel"))
	("Resent-From:"
	 ("experiment@hotaka.c.oka-pu.ac.jp" . "%opu.c.experiment"))))

;;; sorting
(setq mew-sort-default-key-alist
      '(("+comp/freebsd/FreeBSD-users-jp" . "x-sequence")
	("+comp/freebsd/ports-jp" . "x-sequence")))

(setq mew-prog-grep "mg")
(setq mew-prog-grep-opts '("-j" "jis" "-l" "-e"))

;; ;; advice for mew-nmz
;; (defadvice mew-folder-clean-up (before folder-list-to-file activate)
;;   (let ((lst mew-folder-list)
;; 	(fldsfile (expand-file-name ".folders" mew-mail-path)))
;;     (if	lst
;; 	(with-temp-buffer
;; 	  (while lst
;; 	    (if (string-match "^\\+[^+]" (car lst));; only local folder
;; 		(if (string-match "\\(^.+\\)/$" (car lst))
;; 		    (insert (substring (car lst) 0 (match-end 1)) "\n")
;; 		  (insert (car lst) "\n")))
;; 	    (setq lst (cdr lst)))
;; 	  (write-region (point-min) (point-max) fldsfile)))))

(defun mew-summary-form-my-subj ()
  "A function to return simplified Subject:."
  (let ((subj (mew-summary-form-subj)))
    ;; remove ML label
    (while (string-match "^\\(Re: *\\)*\\([[(][a-zA-Z0-9._-]+[ :,][0-9]+[])] *\\)" subj)
      (setq subj (concat (substring subj 0 (match-beginning 2))
			 (substring subj (match-end 2)))))
    ;; remove Re: Re: ...
    (while (string-match "^\\(Re: *\\)\\(Re: *\\)+" subj)
      (setq subj (concat (substring subj 0 (match-beginning 2))
			 (substring subj (match-end 2)))))
    ;; remove (was...)
    (while (string-match (concat "^.*\\(" mew-was-regex "\\)") subj)
      (setq subj (substring subj 0 (match-beginning 1))))
    subj))

;;; [mew-dist 24466]
(setq mew-connection-type-for-scan nil)

(cond
 ((and (string-match "XEmacs" emacs-version))
  (setq mew-icon-directory "/usr/local/lib/xemacs/etc/mew/"))
 ((not (string-match "XEmacs" emacs-version))
  (setq mew-use-overlay-keymap nil)))
