(load-safe "mime-setup")
(setq mime-view-ignored-field-list
      '("^Lines:" "*Id:" "^References:" "^Replied:" "^Sender:"
	".*Host:" "^Precedence:" "^Status:" "^Errors-To:"
	"^X-Face:"))
