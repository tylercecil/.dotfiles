;;
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
(add-to-list 'load-path "~/.emacs.d/modes")

;; Loads the main config files for emacs. All can be found in the elisp
;; directory.
(use-package keyconfig
  :config (keyconfig-init))

(use-package themeconfig
  :config (themeconfig-init))

(use-package behaviorconfig
  :config (behaviorconfig-init))

(use-package styleconfig
  :config (styleconfig-init))

;; Loads all mode config files. All can be found in the elisp/modes
;; directory.
(mapc 'load-library (list
                     "javascript-config"
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
    (matlab-mode multi-term auctex julia-mode company-lsp lsp-ui lsp-mode js2-mode typescript-mode company-ghc go-mode clang-format which-key ivy company flycheck xclip exec-path-from-shell solarized-theme linum-relative fill-column-indicator rainbow-delimiters spaceline ace-jump-mode evil-matchit evil-nerd-commenter evil-numbers evil-surround evil-leader key-chord diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
