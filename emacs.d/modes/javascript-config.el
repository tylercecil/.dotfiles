(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" . typescript-mode)
  :hook (typescript-mode . lsp-deferred))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . typescript-mode)
  :hook (js2-mode . lsp-deferred))


(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-;"))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))
