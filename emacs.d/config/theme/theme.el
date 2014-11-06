;;
;; File:   theme-settings.el
;; Author: Izzy Cecil
;; Date:   November 2014
;;
;; Theme related settings.
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global theme settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'highlight-chars)
(require 'fill-column-indicator)
(load "modeline-settings")

;; Theme
(load "smyx-theme.el")

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; Highlight line
(global-hl-line-mode)

;; Highlight Tabs
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
;; TODO: Don't highlight completion mode...

(add-hook 'completion-list-mode-hook
          (lambda () (message "comp")))
                      ;(hc-dont-highlight-tabs))))

;; Highlight Trailing Whitespace
(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)

;; Column indicator
(setq fci-rule-column 80)
(add-hook 'font-lock-mode-hook (lambda () (fci-mode 80)))

;; Linnum mode
(global-linum-mode 1)
;; Sets a gutter between linnums and text
(unless window-system
  (add-hook 'linum-before-numbering-hook
            (lambda ()
              (setq-local linum-format-fmt
                          (let ((w (length (number-to-string
                                            (count-lines (point-min) (point-max))))))
                            (concat "%" (number-to-string w) "d"))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'mode-line)))

(unless window-system
  (setq linum-format 'linum-format-func))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme settings when in X mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (display-graphic-p)
  ;; Transparency
  ;; (add-to-list 'default-frame-alist '(alpha 90 90))
  ;; No Scrollbar
  (scroll-bar-mode -1)
  ;; No Toolbar
  (tool-bar-mode -1)
  ;; No menu bar
  (menu-bar-mode -99)
  ;; Font
  (set-frame-font "Anonymous Pro 14")
  )
