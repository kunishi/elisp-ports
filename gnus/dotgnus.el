; -*- Emacs-Lisp -*-
;;;
;;; Setup file for Gnus
;;;
;;; $Id: .gnus.el,v 1.8 2003/01/31 14:43:30 kunishi Exp $
;;;

;; user environments
(setenv "MAILHOST" "psi.c.oka-pu.ac.jp")
(setq gnus-local-domain "c.oka-pu.ac.jp")
(setq gnus-local-organization 
      "Okayama Prefectural University, Japan")
(setq gnus-local-timezone +0900)
(setq message-user-organization
      "Okayama Prefectural University, Japan")
(setq gnus-read-active-file t)

;; nn methods
(setq gnus-select-method '(nntp "news.gmane.org"))
(setq nnmail-tmp-directory "/tmp/")
(setq nnmail-use-long-file-names nil)

;; Showing
; removed Date, Message-ID, and Distribution
(setq gnus-strict-mime nil)
;(setq gnus-strict-mime t)
(setq gnus-mime-display-multipart-as-mixed t)
(setq gnus-required-headers '(From Newsgroups Subject Path Organization))
(setq gnus-large-newsgroup 100)
(add-hook 'gnus-article-display-hook 'gnus-article-highlight)
(setq gnus-group-charset-alist
      '(("^hk\\>\\|^tw\\>\\|\\<big5\\>" cn-big5)
	("^cn\\>\\|\\<chinese\\>" cn-gb-2312)
	("^fj\\>\\|^japan\\>\\|^nifty\\>" iso-2022-jp-2)
	("^tnn\\>\\|^pin\\>\\|^sci.lang.japan" iso-2022-7bit)
	("^relcom\\>" koi8-r)
	("^fido7\\>" koi8-r)
	("^\\(cz\\|hun\\|pl\\|sk\\|hr\\)\\>" iso-8859-2)
	("^israel\\>" iso-8859-1)
	("^han\\>" euc-kr)
	("^alt.chinese.text.big5\\>" chinese-big5)
	("^soc.culture.vietnamese\\>" vietnamese-viqr)
	("^\\(comp\\|rec\\|alt\\|sci\\|soc\\|news\\|gnu\\|bofh\\)\\>" iso-8859-1)
	(".*" iso-8859-1)))

;; Posting
(setq nndraft-directory "~/Mail/")
(setq mail-yank-prefix ">")		; configuration for yank (sendmail.el)
(setq gnus-use-generic-from t)
(setq gnus-message-archive-method
      '(nnml "private"
	     (nnml-directory "~/Mail/"))
      )
(setq gnus-message-archive-group "outbox")
(setq gnus-default-posting-charset "iso-2022-jp")

; to use imput
; (setq gnus-post-method '(nnspool ""))
; (setq nnspool-inews-program "~/nifty4u-plus/inews-nifty4u")
; (setq nnspool-inews-switches "-S")
; (setq nnspool-inews-switches nil)
; (setq message-post-method "~/nifty4u-plus/inews-nifty4u")
(setq message-syntax-checks
      '((long-lines . disabled)
	(control-chars . disabled)
	(sender . disabled)))
; for IM
;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;(setq sendmail-program "imput")

;; WWW
(setq browse-url-browser-function 'browse-url-netscape)

;; subscribing
(setq gnus-options-not-subscribe "^alt\\..*$")
(setq gnus-subscribe-hierarchical-interactive t)
(setq gnus-subscribe-newsgroup-method (function gnus-subscribe-hierarchically))

;; score
(setq gnus-home-score-file "all.SCORE")

;; saving
(setq gnus-article-save-directory "~/News/")
;(setq gnus-default-article-saver
;      (function gnus-summary-save-in-folder))
(setq gnus-prompt-before-saving t)

;;; topic mode
;(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; default charset when decoding articles to be read.
(setq gnus-newsgroup-ephemeral-charset 'iso-2022-jp-2)

;; encoding when sending Japanese message.
(setq mm-body-charset-encoding-alist
      '((iso-2022-jp . 7bit) (iso-2022-jp-2 . 7bit)))

;;; NoCeM
;(setq gnus-use-nocem t)
(setq gnus-nocem-groups
      '("news.lists.filters"
	"news.admin.net-abuse.bulletins"
	"news.admin.net-abuse.announce"
	"fj.news.lists.filters"
	"japan.admin.abuse.lists"))

;;; gnus as offline reader.
(gnus-agentize)
