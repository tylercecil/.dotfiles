;;
;; Electric modes
;;
(electric-pair-mode 1)
(add-to-list 'electric-pair-pairs '(?\{ . ?\}))
(electric-indent-mode 1)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :diminish flycheck-mode)

(use-package company
  :ensure t
  :init (global-company-mode)
  :diminish company-mode)

(setq lsp-keymap-prefix "C-;")

(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))
