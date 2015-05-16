;; There is a lot of haskell setup to be had. I'll work on it slowly
;; as I need it.

(use-package haskell-mode
  :mode ("\\.hs\\'" . haskell-mode)
  :ensure t
  :config
  (message "Loading haskell-mode...")
  (turn-on-haskell-indentation t))

(use-package ac-haskell-process
  :mode ("\\.hs\\'" . haskell-mode)
  :ensure t)
