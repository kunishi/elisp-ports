(when (and (eq system-type 'darwin)
	   (eq window-system 'mac))
  (load "~/.emacs.d/init.d/carbon-font.el")
  (create-fontset-from-fontset-spec
   (concat
    "-*-fixed-medium-r-normal-*-16-*-*-*-*-*-fontset-hiraginokaku16,"
    "japanese-jisx0208:-apple-ヒラギノ角ゴ pro w3-medium-r-normal--16-160-75-75-m-160-jisx0208.1983-sjis,"
    "katakana-jisx0201:-apple-ヒラギノ角ゴ pro w3-medium-r-normal-*-160-*-jisx0201*-*,"
    "korean-ksc5601:-apple-applegothic-medium-r-normal--16-160-75-75-m-160-ksc5601.1989-0,"
    "ascii:-etl-fixed--16-*-iso8859-1,"
    "latin-iso8859-1:-etl-fixed--16-*-iso8859-1"))
  (set-default-font "fontset-hiraginokaku16"))
