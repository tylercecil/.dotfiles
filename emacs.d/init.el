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
 '(custom-safe-themes
   (quote
    ("00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
