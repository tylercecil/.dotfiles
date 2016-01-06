;; Good types means good tools. I want a very good haskell mode, so I will put
;; hopefully a lot of notes here.
;; Some links:
;;   https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md
;;   https://github.com/chrisdone/emacs-haskell-config
;;   https://github.com/emacs-tw/awesome-emacs#haskell
;;   https://github.com/haskell/haskell-mode/wiki
;;
;; External dependencies (which I don't handle in any fancy way at all)
;;     hasktags ghc-mod hlint

;; GHC-mod provides more on-the-fly behavior
;; If hlint is installed, there is extra fun!
(use-package ghc
  :ensure t
  :commands ghc-init
  :config
  ;; Company mode with GCH-mod
  (use-package company-ghc
    :ensure t
    :config
    (add-to-list 'company-backends 'company-ghc)
    (setq company-show-info )))

(use-package haskell-mode
  :ensure t
  :mode ("\\.hs\\'" . haskell-mode)
  :init
  ;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
  (add-hook 'haskell-mode-hook
            (lambda() (progn (electric-pair-mode nil)
                             (electric-indent-mode nil))))
  (add-hook 'haskell-mode-hook
            (lambda () (progn (ghc-init))))
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  :config
  (require 'haskell-interactive-mode)
  (require 'haskell-process)
  (speedbar-add-supported-extension ".hs")

  ;; Haskell-mode flags
  (setq haskell-tags-on-save t
        haskell-process-suggest-remove-import-lines t
        haskell-process-auto-import-loaded-modules t
        haskell-process-log t
        haskell-process-type 'cabal-repl)

  ;; Haskell Keybindings
  (bind-key "C-c C-l"     'haskell-process-load-or-reload  haskell-mode-map)
  (bind-key "C-c C-n C-t" 'haskell-process-do-type         haskell-mode-map)
  (bind-key "C-c C-n C-i" 'haskell-process-do-info         haskell-mode-map)
  (bind-key "C-c C-n C-c" 'haskell-process-cabal-build     haskell-mode-map)
  (bind-key "C-c C-n c"   'haskell-process-cabal           haskell-mode-map)
  (bind-key "SPC"         'haskell-mode-contextual-space   haskell-mode-map)
  (bind-key "M-."         'haskell-mode-jump-to-def-or-tag haskell-mode-map)

  (bind-key "C-c C-k" 'haskell-interactive-mode-clear haskell-cabal-mode-map)
  (bind-key "C-c C-c" 'haskell-process-cabal-build    haskell-cabal-mode-map)
  (bind-key "C-c c"   'haskell-process-cabal          haskell-cabal-mode-map))
