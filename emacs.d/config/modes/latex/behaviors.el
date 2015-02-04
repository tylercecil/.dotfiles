;; Autofill and flyspell
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'flyspell-mode)

;; For outline views (hide/show sections, chapters, etc.)
(add-hook 'TeX-mode-hook '(lambda () (TeX-fold-mode 1)))
(add-hook 'TeX-mode-hook '(lambda () (outline-minor-mode 1)))

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
