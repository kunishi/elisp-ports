(when
    (and
     (autoload-if-found 'psgml-mode "psgml" "Major mode to edit SGML files." t)
     (autoload-if-found 'pxml-mode "psgml" "Major mode to edit XML files." t))
  (add-to-list 'auto-mode-alist (cons "\\.html\\'" 'psgml-mode))
  (add-to-list 'auto-mode-alist (cons "\\.dsl\\'" 'psgml-mode))
  (add-to-list 'auto-mode-alist (cons "\\.ent\\'" 'psgml-mode))
  (setq psgml-local-catalogs
	'("~/share/xml/catalog"
	  "~/Documents/svn/chorusRoom/lib/dtd/catalog"))
  (setq psgml-catalog-files
	'("CATALOG"
	  "/usr/local/share/sgml/catalog"
	  "/usr/local/share/xml/xhtml1/xhtml.soc"
	  "/usr/local/share/xml/xhtml1/xhtml11.cat"
	  "/usr/local/share/xml/docbook-4.2/docbook.cat"
	  "/usr/local/share/xml/docbook-simple-1.0/catalog"
	  "/usr/local/share/xml/xmlcharent/catalog"))
  (setq psgml-custom-dtd
	'(("HTML"
	   "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">")
	  ("HTML 4"
	   "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">")
	  ("HTML 4 Transitional"
	   "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">")
	  ("XHTML"
	   "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">")
	  ("XHTML Transitional"
	   "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">")
	  ("Chorusroom XHTML1"
	   "<!DOCTYPE html PUBLIC \"-//CHORUSROOM//DTD XHTML 1.0 Strict Ext//JA\" \"http://www.chorusrom.org/DTD/xhtml1-chorusroom.dtd\">")
	  ("Chorusroom Competition JCA"
	   "<!DOCTYPE competition PUBLIC \"-//CHORUSROOM//DTD Contest JCA 1.0//JA\" \"http://www.chorusroom.org/DTD/jca-comp-result.dtd\">")
	  ("Chorusroom Competition NHK"
	   "<!DOCTYPE competition PUBLIC \"-//CHORUSROOM//DTD Contest NHK 1.0//JA\" \"http://www.chorusroom.org/DTD/nhk-contest-result.dtd\">")
	  ("Chorusroom Competition Generic"
	   "<!DOCTYPE competition PUBLIC \"-//CHORUSROOM//DTD Contest Generic 1.0//JA\" \"http://www.chorusroom.org/DTD/contest-result-generic.dtd\">")
	  ("Chorusroom Competition GivenProg"
	   "<!DOCTYPE givenPrograms PUBLIC \"-//CHORUSROOM//DTD Contest GivenProg 1.0//JA\" \"http://www.chorusroom.org/DTD/given-programs.dtd\">")
	  ("Chorusroom Choir"
	   "<!DOCTYPE c:choir PUBLIC \"-//CHORUSROOM//DTD Choir 1.0//JA\" \"http://www.chorusroom.org/DTD/choir.dtd\">")))
  (setq psgml-custom-markup
	'(("XML Decl" "<?xml version=\"1.0\"?>")))
  (setq psgml-indent-data t)
  (setq psgml-insert-defaulted-attributes t)
  (setq psgml-auto-insert-required-elements nil)
  (setq psgml-insert-missing-element-comment nil)
  ;; Faces
  (setq-default psgml-set-face t)
  (make-face 'psgml-comment-face)
  (make-face 'psgml-doctype-face)
  (make-face 'psgml-end-tag-face)
  (make-face 'psgml-entity-face)
  (make-face 'psgml-ignored-face)
  (make-face 'psgml-ms-end-face)
  (make-face 'psgml-ms-start-face)
  (make-face 'psgml-pi-face)
  (make-face 'psgml-sgml-face)
  (make-face 'psgml-short-ref-face)
  (make-face 'psgml-start-tag-face)
  (set-face-foreground 'psgml-comment-face "dark green")
  (set-face-foreground 'psgml-doctype-face "maroon")
  (set-face-foreground 'psgml-end-tag-face "blue2")
  (set-face-foreground 'psgml-entity-face "red2")
  (set-face-foreground 'psgml-ignored-face "maroon")
  (set-face-background 'psgml-ignored-face "gray90")
  (set-face-foreground 'psgml-ms-end-face "maroon")
  (set-face-foreground 'psgml-ms-start-face "maroon")
  (set-face-foreground 'psgml-pi-face "maroon")
  (set-face-foreground 'psgml-sgml-face "maroon")
  (set-face-foreground 'psgml-short-ref-face "goldenrod")
  (set-face-foreground 'psgml-start-tag-face "blue2")
  (setq-default psgml-markup-faces
		'((comment . psgml-comment-face)
		  (doctype . psgml-doctype-face)
		  (end-tag . psgml-end-tag-face)
		  (entity . psgml-entity-face)
		  (ignored . psgml-ignored-face)
		  (ms-end . psgml-ms-end-face)
		  (ms-start . psgml-ms-start-face)
		  (pi . psgml-pi-face)
		  (sgml . psgml-sgml-face)
		  (short-ref . psgml-short-ref-face)
		  (start-tag . psgml-start-tag-face))))
