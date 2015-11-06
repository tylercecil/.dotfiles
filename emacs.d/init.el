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
(require 'diminish)
(require 'bind-key)
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/modes")

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
(mapc 'load-library (list "haskell"
                          ;; "agda"
                          "c"
                          "go"
                          "julia"
                          "latex"
                          "markdown"
                          "multiterm"
                          "octave"))
                          ;; "proofgen"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet which-key use-package spaceline solarized-theme rainbow-delimiters projectile multi-term matlab-mode markdown-mode linum-relative key-chord julia-mode highlight-chars helm haste go-mode fill-column-indicator exec-path-from-shell evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-leader company-ghc clang-format auctex ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
