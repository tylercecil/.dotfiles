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

(require 'use-package)

;;
;; Load recursive loader, utilities, and configurations.
;;
(load "~/.emacs.d/lisp/load-directory.el")
(load-directory "~/.emacs.d/lisp")

(load-directory "~/.emacs.d/config")
