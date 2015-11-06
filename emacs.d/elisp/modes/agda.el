;; Agda mode is not in melpa, but is an actual program that needs
;; to be run to generate it.
;; TODO: Clean this up with an autoload of some kind
(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-datatype-face ((t (:foreground "indian red"))))
 '(agda2-highlight-function-face ((t (:foreground "dark cyan"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "alternateSelectedControlColor")))))
