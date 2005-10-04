(when (and (eq system-type 'darwin)
	   (eq window-system 'mac))
  (require 'carbon-font)
  (set-default-font "fontset-hiraginomaru"))
