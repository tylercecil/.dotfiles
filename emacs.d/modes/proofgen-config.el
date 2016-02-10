;; Poof-general is loaded separately.
(load "~/.emacs.d/PG/generic/proof-site.el")

;; Set coqtop executable
(setq coq-prog-name "/usr/bin/coqtop")

;; Defaults for look of proof-general
;; See http://proofgeneral.inf.ed.ac.uk/htmlshow.php?title=Proof+General+user+manual&file=releases%2FProofGeneral%2Fdoc%2FProofGeneral%2FProofGeneral_9.html#Customizing-Proof-General
(setq proof-three-window-enable  t
      proof-delete-empty-windows nil
      proof-splash-enable        nil)

(add-hook 'proof-mode-hook (lambda () (electric-indent-local-mode -1)))

(eval-after-load "proof-script"
  '(progn
     ;; Set up keys (this is on coq-mode... not yet sure how to make it proof-general)
     ;; See http://proofgeneral.inf.ed.ac.uk/htmlshow.php?title=Proof_General+manual&file=releases%2FProofGeneral-latest%2Fdoc%2FProofGeneral%2FProofGeneral_3.html#Script-editing-commands
     (evil-leader/set-key-for-mode 'coq-mode
       ;; Movement. "mg" is short for "mode/goto/..."
       "mg0" 'proof-goto-command-start
       "mg$" 'proof-goto-command-end
       "mg." 'proof-goto-end-of-locked

       ;; Script processing.
       ;; Needs to be organized
       "mn"           'proof-assert-next-command-interactive
       "mu"           'proof-undo-last-successful-command
       "m <backspace>" 'proof-undo-and-delete-successful-command
       "m <RET>"       'proof-goto-point
       "mb"           'proof-process-buffer
       "mr"           'proof-retract-buffer

       ;; Proof assistant commands.
       "ma" 'coq-SearchAbout
       "ml" 'proof-display-some-buffers
       "mp" 'proof-prf
       "mt" 'proof-ctxt
       "mh" 'proof-help
       "mi" 'proof-query-identifier
       "mf" 'proof-find-theorems
       "mw" 'pg-response-clear-displays
       "mc" 'proof-interrupt-process
       "mv" 'proof-minibuffer-cmd
       "ms" 'proof-shell-start
       "mx" 'proof-shell-exit)))
