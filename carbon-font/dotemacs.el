(when (and (eq system-type 'darwin)
	   (eq window-system 'mac))
  (load "~/.emacs.d/init.d/carbon-font.el")
  (set-default-font "fontset-hiraginomaru"))
