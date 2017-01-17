;; Going to try out Intero... not sure about it... but will try
(use-package intero
  :ensure t
  :config
  ;; Set intero for all haskell buffers (I understand this may fuck with non
  ;; stack projects)
  (global-intero-mode)
  ;; Set keys for intero
  (evil-leader/set-key-for-mode 'haskell-mode
    "mt" 'intero-type-at
    "mi" 'intero-info
    "ml" 'intero-repl-load
    "mr" 'intero-repl
    "ma" 'intero-apply-suggestions
    ;; So... I need to work on my keybindings. I'm not sure where build things
    ;; should go... I kinda think I should move them OUT OF mode, and INTO build
    ;; And what about gotos? Should I turn them into evil things? And put them
    ;; onto g? Need to consider...
    "m." 'intero-goto-definition))
