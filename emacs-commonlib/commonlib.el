;;; auxiliary functions
;; (defconst my-emacs-prefix (expand-file-name "../" invocation-directory))
(defconst my-xemacs-p (string-match "XEmacs\\|Lucid" emacs-version))
(defconst my-fsf-emacs-p (not my-xemacs-p))
(defconst my-emacs-version
  (and
   (string-match "^\\(.*\\)\\.[0-9]+$" emacs-version)
   (substring emacs-version (match-beginning 1) (match-end 1))))
;;; borrowed from install.el in APEL
(defvar my-install-prefix
  (if (string= system-configuration-options "NT")
      (expand-file-name "../.." exec-directory)
    (if (or (<= emacs-major-version 18)
	    (featurep 'xemacs)
	(expand-file-name "../../.." exec-directory))
      (expand-file-name "../../../.." data-directory))))
(defmacro my-emacs-expand-prefix (path)
  `(concat my-install-prefix "/" ,path))
(defvar my-emacs-lispdir
  (my-emacs-expand-prefix "share/emacs/site-lisp"))
(defvar my-emacs-version-specific-lispdir
  (my-emacs-expand-prefix
   (concat "share/emacs/" my-emacs-version "/site-lisp")))

;;; from http://www.sodan.org/~knagano/emacs/dotemacs.html
(defmacro exec-if-bound (sexplist)
  `(if (fboundp (car ',sexplist))
       ,sexplist))
(defmacro defun-add-hook (hookname &rest sexplist)
  "alias for add-hook."
  `(add-hook ,hookname
	     (function (lambda () ,@sexplist))))
(defun autoload-if-found (function file &optional docstring interactive type)
  "set autoload iff FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))
(defun load-safe (loadlib)
  "safe load."
  (let ((load-status (load loadlib t)))
    (or load-status
	(message (format "[load-safe] failed %s." loadlib)))
    load-status))
(defmacro eval-safe (&rest body)
  "safe evaluation."
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))

;;; common settings for all Emacs.
(setq mail-host-address "mail.chorusroom.org")
(setq user-full-name "KUNISHIMA Takeo")
(setq user-mail-address "kunishi@chorusroom.org")

;;; settigs specific for Emacs version.
;; Various parameters
(when my-xemacs-p
  (set-specifier minimum-line-ascent 4)
  (set-specifier minimum-line-descent 4))
(when my-fsf-emacs-p
  (setq next-line-add-newlines nil)
  (setq require-final-newline t)
  (cond ((= emacs-major-version 21) ;; Emacs21
	 (set-language-environment 'japanese)
	 (setq menu-coding-system 'euc-jp)
	 (set-terminal-coding-system 'japanese-iso-8bit-with-esc)
	 (set-keyboard-coding-system 'japanese-iso-8bit-with-esc)
	 (modify-coding-system-alist 'process "" 'japanese-iso-8bit-with-esc)
	 (setq recursive-load-depth-limit nil)
	 (load-safe "font-lock"))
	((= emacs-major-version 20) ;; Emacs20
	 (set-language-environment 'japanese)
	 (setq auto-save-list-file-prefix (expand-file-name "~/.saves/"))
	 (load-safe "font-lock"))
	((= emacs-major-version 19) ;; Emacs19
	 (load-safe "hilit19"))))

;;; font-lock
(if (featurep 'font-lock)
    (global-font-lock-mode t))

;; load-path.
(if (not (fboundp 'add-path))
    (cond ((file-exists-p (concat my-emacs-lispdir "/apel"))
	   (add-to-list 'load-path (concat my-emacs-lispdir "/apel")))
	  ((file-exists-p (concat my-emacs-version-specific-lispdir "/apel"))
	   (add-to-list 'load-path (concat my-emacs-version-specific-lispdir "/apel")))))

;; Info path.
(add-to-list 'Info-default-directory-list 
	     (concat my-install-prefix "/info/"))
(add-to-list 'Info-default-directory-list "/usr/X11R6/info/")
(add-to-list 'Info-default-directory-list "/usr/share/info/")

;;; OS specific settings
;; MacOS X
(when (eq system-type 'darwin)
  (create-fontset-from-fontset-spec
   (concat
    "-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-osaka16,"
    "japanese-jisx0208:-apple-osaka-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis,"
    "ascii:-apple-monaco-medium-r-normal--14-*-*-*-*-*-mac-roman"))
  (set-default-font "fontset-osaka16")
  (setq mew-cs-samba 'utf-8))
;; ;; Windows (Meadow)
;; (when (featurep 'meadow)
;;   (when (autoload-if-found 'font-setup "font-setup" nil t)
;;     (setq font-setup-bdf-dir "c:/intlfonts-1.2.1")
;;     (font-setup "�l�r �S�V�b�N" 17)))
;; Windows (NTEmacs)
(when (and (eq system-type 'windows-nt)
	   (not (featurep 'meadow)))
  (set-terminal-coding-system 'sjis)
  (set-clipboard-coding-system 'sjis-dos)
  (setq shell-file-name "c:/cygwin/bin/bash.exe")
  (setq shell-command-switch "-c")
  (setq bdf-directory-list
	'("c:/intlfonts-1.2.1/Asian"
	  "c:/intlfonts-1.2.1/Chinese"
	  "c:/intlfonts-1.2.1/Chinese.X"
	  "c:/intlfonts-1.2.1/Ethiopic"
	  "c:/intlfonts-1.2.1/European"
	  "c:/intlfonts-1.2.1/Japanese"
	  "c:/intlfonts-1.2.1/Japanese.X"
	  "c:/intlfonts-1.2.1/Korean.X"
	  "c:/intlfonts-1.2.1/Misc"
	  "c:/intlfonts-1.2.1"
	  "c:/m17nfonts"))
  (setq w32-bdf-filename-alist
	(w32-find-bdf-fonts bdf-directory-list))
  (create-fontset-from-fontset-spec
   (concat
    "-*-fixed-medium-r-normal-*-16-*-*-*-c-*-fontset-bdf,"
    "japanese-jisx0208:-*-*-medium-r-normal-*-16-*-*-*-c-*-jisx0208.*-*,"
    "katakana-jisx0201:-*-*-medium-r-normal-*-16-*-*-*-c-*-jisx0201*-*,"
    "latin-jisx0201:-*-*-medium-r-normal-*-16-*-*-*-c-*-jisx0201*-*,"
    "japanese-jisx0208-1978:-*-*-medium-r-normal-*-16-*-*-*-c-*-jisx0208.1978-*,"
    "thai-tis620:-misc-fixed-medium-r-normal--16-160-72-72-m-80-tis620.2529-1,"
    "lao:-misc-fixed-medium-r-normal--16-160-72-72-m-80-MuleLao-1,"
    "tibetan-1-column:-TibMdXA-fixed-medium-r-normal--16-160-72-72-m-80-MuleTibetan-1,"
    "ethiopic:-Admas-Ethiomx16f-Medium-R-Normal--16-150-100-100-M-160-Ethiopic-Unicode,"
    "tibetan:-TibMdXA-fixed-medium-r-normal--16-160-72-72-m-160-MuleTibetan-0"))
  (setq font-encoding-alist
	(append '(("MuleTibetan-0" (tibetan . 0))
		  ("GB2312" (chinese-gb2312 . 0))
		  ("JISX0208" (japanese-jisx0208 . 0))
		  ("JISX0212" (japanese-jisx0212 . 0))
		  ("VISCII" (vietnamese-viscii-lower . 0))
		  ("KSC5601" (korean-ksc5601 . 0))
		  ("MuleArabic-0" (arabic-digit . 0))
		  ("MuleArabic-1" (arabic-1-column . 0))
		  ("MuleArabic-2" (arabic-2-column . 0)))
		font-encoding-alist))
  (set-default-font "fontset-bdf")
  (setq initial-frame-alist 
	'((foreground-color . "black")
	  (background-color . "snow")
	  (width . 80) (height . 37)
	  (top . 0) (left . 100)
	  ;;(menu-bar-lines . 1)
	  (font . "fontset-bdf")
	  (vertical-scroll-bars . nil)
	  )))

;; Emacs 21.3.50 native UTF-8 support
(when (boundp 'utf-translate-cjk)
  (setq utf-translate-cjk t)
  (prefer-coding-system 'utf-8)
  (custom-set-variables
   '(utf-translate-cjk t)))
