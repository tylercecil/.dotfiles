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

  ;; Make a "Make" command that uses latexmk
  ;; Note that I always cp the pdf.
  (push
   '("Make"
     "latexmk -outdir=./build -lualatex  -interaction=nonstopmode %t && cp ./build/%s.pdf ./"
     TeX-run-TeX nil t
     :help "Make pdf output using latexmk.")
   TeX-command-list)

  (setq TeX-command-default "Make")

  ;; Indentation
  (setq-default LaTeX-item-indent 0)
  )
