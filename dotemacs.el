;; -*-emacs-lisp-*-
;;; emacs setup file
;;; $Id: .emacs,v 1.52 2003/06/21 01:21:20 kunishi Exp $
;;;

(load "~/.emacs.d/init.d/commonlib.el")

;;; settings specific for Elisp packages

;; utf-8m
;; (and (eq window-system 'mac)
;;      (load-safe "~/.emacs.d/init.d/utf-8m-init.el"))

;; apel
(load-safe "~/.emacs.d/init.d/apel-init.el")

;; mule-ucs
(and (not (boundp 'utf-translate-cjk))
     (load-safe "~/.emacs.d/init.d/mule-ucs-init.el"))

;; font-setup
(and (featurep 'meadow)
     (load-safe "~/.emacs.d/init.d/font-setup-init.el"))
;; (and (eq window-system 'mac)
;;      (load-safe "~/.emacs.d/init.d/carbon-font-init.el"))

;; SKK
(load-safe "~/.emacs.d/init.d/ddskk-init.el")

;; semi
;; (load-safe "~/.emacs.d/init.d/semi-init.el")

;; Mew
;;; http://www.mew.org/
;; all the settings are included in ~/.mew.el.
(load-safe "~/.emacs.d/init.d/mew-init.el")

;;; Wanderlust
;;; http://www.gohome.org/wl/
;; (load-safe "~/.emacs.d/init.d/wl-init.el")

;;; x-face-e21
;;; ftp://ftp.jpl.org/pub/elisp/
(load-safe "~/.emacs.d/init.d/x-face-e21-init.el")

;; emacs-w3m
(load-safe "~/.emacs.d/init.d/emacs-w3m-init.el")

;; emacs-wget
;; (load-safe "~/.emacs.d/init.d/emacs-wget-init.el")

;;; ruby-mode
(load-safe "~/.emacs.d/init.d/ruby-mode-init.el")

;;; python mode
(load-safe "~/.emacs.d/init.d/python-mode-init.el")

;;; SML mode
;;; ftp://ftp.research.bell-labs.com/dist/smlnj/contrib/emacs/
(load-safe "~/.emacs.d/init.d/sml-mode-init.el")

;;; ocaml-mode
;; (load-safe "~/.emacs.d/init.d/ocaml-mode-init.el")

;;; tuareg-mode
(load-safe "~/.emacs.d/init.d/tuareg-mode-init.el")

;;; Haskell mode
;;; http://www.haskell.org/
(load-safe "~/.emacs.d/init.d/haskell-mode-init.el")

;;;; XML, HTML
;;; nxml-mode
(load-safe "~/.emacs.d/init.d/nxml-mode-init.el")

;;; rnc-mode
(load-safe "~/.emacs.d/init.d/rnc-mode-init.el")

;;; psgml
;;; ftp://ftp.lysator.liu.se/pub/sgml/
;;; from http://www.oasis-open.org/cover/psgml-fonts.html
;; (load-safe "~/.emacs.d/init.d/psgml-init.el")

;;; css-mode
(load-safe "~/.emacs.d/init.d/css-mode-init.el")

;; DTD mode
(load-safe "~/.emacs.d/init.d/tdtd-init.el")

;;; xslide
;; (load-safe "~/.emacs.d/init.d/xslide-init.el")

;;; xslt-process
;;; http://xslt-process.sourceforge.net/
;; (load-safe "~/.emacs.d/init.d/xslt-process-init.el")

;;; SmartDoc
;; (load-safe "~/.emacs.d/init.d/sdoc-mode-init.el")

;;; docbookide
;; (load-safe "~/.emacs.d/init.d/docbookide-init.el")

;;; EDE
;; (load-safe "~/.emacs.d/init.d/ede-init.el")

;;; JDE
;; elib is already in ports tree.
;; (load-safe "~/.emacs.d/init.d/jde-init.el")

;; speedbar
;; (load-safe "~/.emacs.d/init.d/speedbar-init.el")

;; semantic
;; (load-safe "~/.emacs.d/init.d/semantic-init.el")

;;; psvn
;; (load-safe "~/.emacs.d/init.d/psvn-init.el")

;;;; TeX
;;; yatex
(load-safe "~/.emacs.d/init.d/yatex-init.el")

;;; epo
;;; http://www.yatex.org/epo/
;; (load-safe "~/.emacs.d/init.d/epo-init.el")

;;; mgp-mode
;; (load-safe "~/.emacs.d/init.d/mgp-mode-init.el")
