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

(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

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
