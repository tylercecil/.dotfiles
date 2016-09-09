(defun gconfig-init ()
  (use-package google
    :config

    (defun toggle-g3-coverage ()
      "Either run google3-display-coverage, or googl3-display-coverage-clear."
      (interactive)
      (if (null google3-display-coverage--overlays)
          (google3-display-coverage)
        (google3-display-coverage-clear)
        (message "Coverage cleared")))
    ;; Need to default overlays to nil
    (setq google3-display-coverage--overlays nil)

    (defun prompt-autogen-hook ()
      "Call google-autogen-file-not-found-hook only if the user gives the ok."
      ;; I don't like dialog boxes.
      ;; See Yes-or-No Queries in the emacs manual.
      (setq last-nonmenu-event "no box, please!")
      (when (y-or-n-p "File does not exist. Should it be google-autogend?")
        (autogen-file-not-found)))
    (add-hook 'find-file-not-found-functions #'prompt-autogen-hook)

    ;; Will use "g" for a google prefix... this may one day conflict with a
    ;; concept of "going", but I suspect I will stick with autojump forever.
    (evil-leader/set-key
      "gt" 'toggle-g3-coverage
      "ga" 'autogen
      "gb" 'google3-build
      "gl" 'google-lint)))

(provide 'gconfig)
