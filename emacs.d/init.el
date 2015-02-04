;;
;; File:   init.el
;; Author: Izzy Cecil
;; Date:   November, 2014
;;
;; Adds all needed directories, loads librarys in needed order, and
;; finally makes a recursive load to config/modes for all mode settings.
;;

;;
;; /lisp provides any functions I may have written, that are ultimately just
;; utilities.
;;
(load "~/.emacs.d/lisp/load-directory.el")
(load-directory "~/.emacs.d/lisp")

;;
;; List of directories that need to be in the load path.
;;
(mapcar (lambda(path) (add-to-list 'load-path path))
        '("~/.emacs.d/config"
          "~/.emacs.d/config/theme"
          "~/.emacs.d/config/modes"))

;;
;; Load files that must be loaded first, for some reason or another
;;
(mapcar 'load '("package-behavior"
                "use-package-bootstrap"))

;;
;; Everything in ~/.emacs.d/config will then be loaded
;;
(load-directory "~/.emacs.d/config")
