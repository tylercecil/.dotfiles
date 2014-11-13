;; TODO: Make sure readline-complete is working.
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)
(setq explicit-shell-file-name "bash")
(setq explicit-bash-args
      '("-c" "export EMACS=; stty echo; bash"))
(setq comint-process-echoes t)
