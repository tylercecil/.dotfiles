;;
;; File: styleconfig.el
;; Author: Izzy Cecil
;; Date: Sun Nov  1 19:15:19 MST 2015
;;
;; Code style defaults, such as line limit, tab settings, ect...
;;

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; Set tab to display as 4 spaces
(setq-default tab-width 2)
;; Set stop-tabs to be 4 written as spaces
(setq-default tab-stop-list (number-sequence 4 120 4))

;; I also fill to 80 char
(setq-default fill-column 80)
