;;
;; File:   init.el
;; Author: Izzy Cecil
;; Date:   November, 2014
;;
;; Adds all needed directories, loads librarys in needed order, and
;; finally makes a recursive load to config/modes for all mode settings.
;;

(load "~/.emacs.d/util/load-directory.el")

;;
;; List of directories that need to be in the load path.
;;
(defun add-path (path)
  "Add a path to load-path"
  (add-to-list 'load-path path))
(mapcar 'add-path '("~/.emacs.d/config"
                    "~/.emacs.d/config/theme"
                    "~/.emacs.d/config/modes"))

;;
;; Load Files
;;
(mapcar 'load '("package-behavior"
                "keys"
                "behaviors"
                "theme"))

;;
;; Load any util scripts I may have
;;
(load-directory "~/.emacs.d/util")

;;
;; Load all mode related settings
;;
(load-directory "~/.emacs.d/config/modes")
