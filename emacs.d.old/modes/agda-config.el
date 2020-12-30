;; Agda mode is not in melpa, but is an actual program that needs to be run to
;; generate it.
(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

;; Key configuration for evil
(evil-leader/set-key-for-mode 'agda-mode
  "mbl" `agda2-load
  "mbb" `agda2-compile
  "mbr" `agda2-compute-normalised-maybe-toplevel
  "mqq" `agda2-quit
  "mqr" `agda2-restart

  "ms" `agda2-search-about-toplevel

  "g." `agda2-goto-definition-keyboard

  ;; Goals
  "mn" `agda2-next-goal
  "mp" `agda2-previous-goal
  "mr" `agda2-refine
  "ma" `agda2-auto
  "mc" `agda2-make-case
  "mt" `agda2-goal-type
  "mi" `agda2-goal-and-context-and-inferred

  ;; `agda2-give
  ;; `agda2-show-context
  ;; `agda2-infer-type
  ;; `agda2-module-contents
  ;; `agda2-remove-annotations
  ;; `agda2-display-implicit-arguments
  ;; `agda2-show-constraints
  ;; `agda2-show-goals
  )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-datatype-face ((t (:foreground "indian red"))))
 '(agda2-highlight-function-face ((t (:foreground "dark cyan"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "alternateSelectedControlColor")))))
