3;;
;; File:   init.el
;; Author: Izzy Cecil
;; Date:   Sat Mar 28 13:30:00 MDT 2015
;;

;;
;; Initialize packages and setup use-package
;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(use-package diminish
             :ensure t)
(use-package bind-key)

(add-to-list 'load-path "~/.emacs.d/elisp")
(mapc 'load-library (list
                     "keys"
                     "theme"
                     "style"
                     "behavior"
                     "idetools"
                     "javascript"
                      ;; "haskell-config"
                      ;; "agda-config"
                      ;;  "c-config"
                      ;;  "go-config"
                      ;;  "julia-config"
                      ;;  "latex-config"
                      ;;  "markdown-config"
                      ;;  "multiterm-config"
                      ;;  "octave-config"
                      ;;  "proofgen-config"
                      ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (haste json-mode xclip which-key use-package typescript-mode spaceline solarized-theme rainbow-delimiters lsp-ui linum-relative key-chord js2-mode ivy flycheck fill-column-indicator exec-path-from-shell evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-leader diminish company-lsp ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
