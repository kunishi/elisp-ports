(when my-fsf-emacs-p
  (cond ((>= emacs-major-version 20)
	 (load-safe "un-define")))
  (cond ((= emacs-major-version 20)
	 (load-safe "jisx0213"))))
