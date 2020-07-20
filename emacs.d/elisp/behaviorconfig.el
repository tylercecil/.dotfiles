;;
;; File: behaviorconfig.el
;; Author: Izzy Cecil
;; Date: Sun Nov  1 16:14:27 MST 2015
;;
;; Configures how emacs should function globally. Things such as spell
;; check, helm, ect... go here.
;;

(defun behaviorconfig-init ()
  ;;
  ;; Always use an existing window
  ;;
  (setq ns-pop-up-frames nil)

  ;;
  ;; Electric modes
  ;;
  (electric-pair-mode 1)
  (add-to-list 'electric-pair-pairs '(?\{ . ?\}))
  (electric-indent-mode 1)

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

  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode)
    :diminish flycheck-mode)

  (use-package company
    :ensure t
    :init (global-company-mode)
    :diminish company-mode)


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

  (use-package which-key
    :ensure t
    :diminish which-key-mode
    :config
    (which-key-mode 1)
    (which-key-setup-side-window-bottom)))

(provide 'behaviorconfig)
