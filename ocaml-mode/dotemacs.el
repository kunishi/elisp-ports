(when (and
       (autoload-if-found 'caml-mode "caml"
			  "Major mode for editing Caml code." t)
       (autoload-if-found 'run-caml "inf-caml"
			  "Run an inferior Caml process." t))
  (add-to-list 'auto-mode-alist (cons "\\.ml[iylp]?\\'" 'caml-mode)))
