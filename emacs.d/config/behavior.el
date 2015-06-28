;;
;; General behavior of emacs. Behaviors which should act globally.
;; This tends to include things like movement, completion, saving
;; behavior, ect...
;;

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
;; Projectile. This tells emacs to treat git repos as projects.
;; By doing this, I can do some neat helm things.
;;
(use-package projectile
  :ensure t)

(use-package smex
  :ensure t
  :demand
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring))
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
