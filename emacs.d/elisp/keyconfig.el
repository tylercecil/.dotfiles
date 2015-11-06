;;
;; File: keys.el
;; Author: Izzy Cecil
;; Date: Sun Nov  1 13:56:21 MST 2015
;;
;; Keyboard configuration for emacs. Many mode specific keys end up in their
;; respective mode files. This more covers my basic Evil configuration.
;;
;; This is a basic Evil configuration. I'll need to remeber what these
;; do as I'm learning Vim. Some that I've ommited, but seem like they
;; may be cool in the future are
;; * evil-args
;; * evil-textobj-anyblock (Might be cool to move latex blocks around.
;; *
(defun keyconfig-init ()
  (use-package evil
    :ensure t
    :diminish undo-tree-mode
    :init
    (setq
     evil-normal-state-cursor 'box
     evil-insert-state-cursor 'bar
     evil-replace-state-cursor 'hollow)
    :config
    (use-package key-chord
      :ensure t
      :config (key-chord-mode 1)
      (key-chord-define-global "jk" 'evil-normal-state))
    ;; https://github.com/cofi/evil-leader
    (use-package evil-leader
      :ensure t
      :config
      (global-evil-leader-mode)
      (evil-leader/set-leader "<SPC>")
      (evil-mode 1))
    ;; https://github.com/timcharper/evil-surround
    (use-package evil-surround
      :ensure t
      :config (global-evil-surround-mode 1))
    ;; https://github.com/cofi/evil-numbers
    (use-package evil-numbers
      :ensure t
      :config (evil-leader/set-key
                "+" 'evil-numbers/inc-at-pt
                "-" 'evil-numbers/dec-at-pt))
    ;; https://github.com/redguardtoo/evil-nerd-commenter
    (use-package evil-nerd-commenter
      :ensure t
      :config (evil-leader/set-key
                "ci" 'evilnc-comment-or-uncomment-lines
                "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
                "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
                "cc" 'evilnc-copy-and-comment-lines
                "cp" 'evilnc-comment-or-uncomment-paragraphs
                "cr" 'comment-or-uncomment-region
                "cv" 'evilnc-toggle-invert-comment-line-by-line
                "\\" 'evilnc-comment-operator ; if you prefer backslash key
                ))
    ;; https://github.com/redguardtoo/evil-matchit
    (use-package evil-matchit
      :ensure t
      :config (global-evil-matchit-mode 1))
    ;; Now I'll do some gross things that are really just for me.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Enter should add a new line in normal state
    (evil-define-key 'normal global-map (kbd "RET") (kbd "o <escape>"))
    ;; Not sure if I want `evil-indent` or `evil-indent-line`. Line is more emacs like
    ;; but I think I'll benifit from evil-indent
    (evil-define-key 'normal global-map (kbd "TAB") 'evil-indent)
    ;; I like moving to the beggining like I did in emacs
    (evil-define-motion evil-jumpy-begin (count)
      :type inclusive
      (when (= (point) (progn (evil-first-non-blank) (point)))
        (evil-beginning-of-line)))
    (evil-define-key 'insert global-map (kbd "C-a") 'evil-jumpy-begin)
    (evil-define-key 'visual global-map (kbd "C-a") 'evil-jumpy-begin)
    (evil-define-key 'normal global-map (kbd "C-a") 'evil-jumpy-begin)
    (evil-define-key 'motion global-map (kbd "C-a") 'evil-jumpy-begin)

    (evil-define-key 'insert global-map (kbd "C-e") 'evil-end-of-line)
    (evil-define-key 'visual global-map (kbd "C-e") 'evil-end-of-line)
    (evil-define-key 'normal global-map (kbd "C-e") 'evil-end-of-line)
    (evil-define-key 'motion global-map (kbd "C-e") 'evil-end-of-line)

    (evil-define-key 'insert global-map (kbd "C-p") 'evil-previous-line)
    (evil-define-key 'insert global-map (kbd "C-n") 'evil-next-line)
    (evil-define-key 'insert global-map (kbd "C-k") (kbd "<escape> d $ a"))
    (evil-define-key 'insert global-map (kbd "C-d") 'evil-delete-char3)))

(provide 'keyconfig)
