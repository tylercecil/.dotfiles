(use-package auctex
  :mode ("\\.tex\\'" . auctex-mode)
  :commands (LaTeX-mode plain-tex-mode)
  :config
  (message "Loading LaTeX configuration...")
  (TeX-fold-mode 1)
  (outline-minor-mode 1)
  ;; Mathmode and reftex
  (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'TeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)

  ;; File saving things
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  ;; LuaTeX stuff
  (setq-default TeX-PDF-mode t)
  (setq-default TeX-engine 'luatex)
  (setq-default TeX-command-extra-options "-shell-escape"))

(use-package tex-site
  :config
  (message "Loading TeX-site..."))
