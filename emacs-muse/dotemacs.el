;; load authoring mode
(require 'muse-mode)

;; load publishing styles I use
(require 'muse-html)
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)

(require 'muse-project)

(setq muse-html-encoding-default 'iso-2022-jp-unix)
(setq muse-latexcjk-encoding-default
      (cdr (assoc 'japanese-iso-8bit muse-latexcjk-encoding-map)))
(setq muse-mode-hook
      '(lambda ()
	 (setq coding-system-for-write 'iso-2022-jp-unix)))
(add-to-list 'muse-ignored-extensions "DS_store")
