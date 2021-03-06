;;
;; File: behaviorconfig.el
;; Author: Izzy Cecil
;; Date: Sun Nov  1 16:14:27 MST 2015
;;
;; Configures how emacs should function globally. Things such as spell
;; check, helm, ect... go here.
;;

;;
;; Always use an existing window
;;
(setq ns-pop-up-frames nil)

;;
;; Enable mouse in terminal
;;
;; TODO: This breaks the terminal after I close an emacs client...
;;(xterm-mouse-mode 1)
;;(add-hook 'after-make-frame-functions 'xterm-mouse-mode)

;;
;; Use the clipboard plz
;;
;; emacs -nw can't use the system clipboard, so external tools are needed.
(use-package xclip
  :ensure t
  :config (xclip-mode 1))
(setq select-enable-primary t)
(setq select-enable-clipboard nil)

;;
;; Spell check (we all know I need it!)
;;
(setq flyspell-issue-message-flag nil)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
;; (eval-after-load "flyspell" '(diminish 'flyspell-mode))

;;
;; Autofill for text mode
;;
(add-hook 'text-mode-hook 'auto-fill-mode)

(use-package ivy :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1))

;;
;; File Settings
;;

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; Makes <filename>~ be a copy ONLY WHEN the original file is hard
;; linked. See http://kb.iu.edu/data/acxl.html for more.
(setq backup-by-copying-when-linked t)
(setq backup-directory-alist `(("." . "~/.saves")))

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

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode 1)
  (which-key-setup-side-window-bottom))
