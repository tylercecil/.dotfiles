;;
;; Autocomplete config
;;
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")
  (ac-flyspell-workaround)
  :diminish auto-complete-mode)

;;
;; Acejump mode lets me move around the screen quickly
;;
(use-package ace-jump-mode
  :ensure t
  :bind ("C-g" . ace-jump-mode))

;;
;; YAS
;;
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config (yas-global-mode 1))

;;
;; Electric modes
;;
(electric-pair-mode 1)
(add-to-list 'electric-pair-pairs '(?\{ . ?\}))
(add-to-list 'electric-pair-pairs '(?\{ . ?\}))

;;
;; Rainbow Delims
;;
(use-package rainbow-delimiters
  :ensure t
  :diminish rainbow-delimiters-mode
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;;
;; Spell check (we all know I need it!)
;;
(setq flyspell-issue-message-flag nil)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'text-mode-hook 'flyspell-prog-mode)
(eval-after-load "flyspell" '(diminish 'flyspell-mode))

;;
;; Autofill for text mode
;;
(add-hook 'text-mode-hook 'auto-fill-mode)

;;
;; IDO
;;
(use-package ido
  :config
  (setq ido-cannot-complete-command 'ido-next-match)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode t))

(use-package smex
  :ensure t
  :defer 2
  :commands smex
  :config
  (smex-initialize)
  (setq smex-prompt-string "λ: "))


;;
;; Hastbin
;;
(use-package haste
  :ensure t)

;;
;; Inc / Dec numbers with C-c +/-
;;
(use-package evil-numbers
  :ensure t
  :bind (("C-c +" . evil-numbers/inc-at-pt)
         ("C-c -" . evil-numbers/dec-at-pt)))

;;
;; File Settings
;;

;; Makes <filename>~ be a copy ONLY WHEN the original file is hard
;; linked. See http://kb.iu.edu/data/acxl.html for more.
(setq backup-by-copying-when-linked t)

;; Make intermediate dirs when saving
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p
                            (format "Directory %s does not exist. Create it?"
                                    dir)))
                  (make-directory dir t))))))

;; Remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Always reload files when changed on disk
(global-auto-revert-mode t)

;;
;; y-or-n over yes-or-no
;;
(fset 'yes-or-no-p 'y-or-n-p)

;;
;; Code Style
;;
;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; Set tab to display as 4 spaces
(setq-default tab-width 4)
;; Set stop-tabs to be 4 written as spaces
(setq-default tab-stop-list (number-sequence 4 120 4))

;;
;; Theme things
;;
;;(use-package highlight-chars
;;  :ensure t
;;  :init
;;  (add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
;;  (add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)
;;  :config
;;  (hc-highlight-tabs))

;;(use-package fill-column-indicator
;;  :ensure t
;;  :init
;;  (add-hook 'font-lock-mode-hook (lambda () (fci-mode 80)))
;;  :config
;;  (setq fci-rule-column 80))




;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; Highlight line
(global-hl-line-mode)

;; Column numbers, please
(column-number-mode)

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

;; Theme in X
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
  (set-frame-font "Anonymous Pro 14"))
