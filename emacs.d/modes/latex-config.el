(use-package tex-site
  :ensure auctex
  :commands (LaTeX-mode plain-tex-mode)
  :config
  (TeX-fold-mode 1)
  (outline-minor-mode 1)

  ;; File viewing
  (setq TeX-view-program-list      '(("zathura" "zathura -P %(outpage) %o"))
        TeX-view-program-selection '((output-pdf "zathura")))

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
  (setq-default TeX-command-extra-options "-shell-escape")

  ;; Indentation
  (setq-default LaTeX-item-indent 0)
  )
