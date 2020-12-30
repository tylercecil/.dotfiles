(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" . typescript-mode)
  :hook (typescript-mode . lsp-deferred)
  :custom
  (typescript-indent-level 2))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . typescript-mode)
  :hook (js2-mode . lsp-deferred)
  :custom
  (js-indent-level 2))

(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" . json-mode)
  :custom
  (json-reformat:indent-width 2)
  (js-indent-level 2))
