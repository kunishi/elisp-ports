(when (autoload-if-found 'docbook-mode "docbookide"
			 "Major mode for DocBook documents." t)
  (add-hook 'docbook-mode-hook 'turn-on-font-lock))
