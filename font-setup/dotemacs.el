;; settings specific for Meadow.
(and (featurep 'meadow)
     (when (load-safe "font-setup")
       (setq font-setup-bdf-dir "C:/intlfonts-1.2.1")
       (font-setup)))
