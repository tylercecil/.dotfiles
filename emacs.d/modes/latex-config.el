(use-package tex-site
  :ensure auctex
  :commands (LaTeX-mode plain-tex-mode)
  :config
  (TeX-fold-mode 1)
  (outline-minor-mode 1)

  ;; File viewing
  (setq TeX-view-program-list      '(("zathura" "zathura -P %(outpage) %o"))
        TeX-view-program-selection '((output-pdf "zathura")))

  ;; Mathmode and reftex
  (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'TeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)

  ;; File saving things
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  ;; LuaTeX stuff
  (setq-default TeX-PDF-mode t)
  (setq-default TeX-engine 'luatex)
  (setq-default TeX-command-extra-options "-shell-escape")

  ;; Make a "Make" command that uses latexmk
  ;; Note that I always cp the pdf.
  (push
   '("Make"
     "latexmk -outdir=./build -lualatex  -interaction=nonstopmode %t && cp ./build/%s.pdf ./"
     TeX-run-TeX nil t
     :help "Make pdf output using latexmk.")
   TeX-command-list)

  (setq TeX-command-default "Make")

  ;; Indentation
  (setq-default LaTeX-item-indent 0)

  ;; Evil configuration
  ;; 1 --- Text objects for latex.

  ;; Taken from this lovely answer :
  ;; http://stackoverflow.com/questions/18102004/emacs-evil-mode-how-to-create-a-new-text-object-to-select-words-with-any-non-sp
  ;; Allows me to define a new text object based on regexps in a modular way.
  ;; Maybe shouldn't be in my latex config. I'll consider rearanging if I end up
  ;; having more uses.
  ;; Also note that this globally defines a text object... not sure how to have
  ;; a mode-local evil-inner/outer-text-objects-map without some serious hackery...
  ;; will need to think on it.
  ;;
  ;; Consider the solution laid out by
  ;; https://github.com/hpdeifel/evil-latex-textobjects/blob/master/evil-latex-textobjects.el
  (defmacro define-and-bind-text-object (key start-regex end-regex)
    (let ((inner-name (make-symbol "inner-name"))
          (outer-name (make-symbol "outer-name")))
      `(progn
         (evil-define-text-object ,inner-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count nil))
         (evil-define-text-object ,outer-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count t))
         (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
         (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

  ;; Object for $$
  (define-and-bind-text-object "$" "\\$" "\\$")
  ;; Object for environment (without newlines)
  (define-and-bind-text-object "E" "\\\\begin{.*}" "\\\\end{.*}")
  ;; Object for environment (with newlines)
  (define-and-bind-text-object "e" "\\\\begin{.*}\n" "\n\\s-*\\\\end{.*}")
  ;; Object for a general macro (only works for single argument macros)
  (define-and-bind-text-object "m" "\\.*{" "}")
  ;; Object for a general macro (only works for single argument macros)
  (define-and-bind-text-object "\\" "\\\\\\[" "\\\\]")

  ;; 2 --- Operator for environments
  ;; Note that I think I may be dealing with the mark wrong... The problem is that
  ;; LaTeX-environment should be (interactive "*Pr") instead of (interactive "*P")
  (evil-define-operator evil-LaTeX-environment (beg end)
    "Evil operator, using LaTeX-environment."
    :repeat t
    :move-point nil
    (push-mark beg)
    (goto-char end)
    (setq mark-active t)
    (LaTeX-environment nil))

  (evil-define-operator evil-TeX-insert-macro (beg end)
    "Evil operator, using TeX-insert-macro."
    :repeat t
    :move-point nil
    (push-mark beg)
    (goto-char end)
    (setq mark-active t)
    (TeX-insert-macro nil))

  (evil-define-operator evil-preview-tex (beg end)
    "Evil operator to preview latex using preview region"
    :repeat t
    :move-point nil
    (push-mark beg)
    (goto-char end)
    (setq mark-active t)
    (preview-region nil))

  ;; 3 -- Some simple keys for things
  (evil-leader/set-key-for-mode 'latex-mode
    ;; General operations
    "me" `evil-LaTeX-environment
    "mm" `evil-TeX-insert-macro
    "m]" `LaTeX-close-environment
    ;; Preview commands
    "mp" `evil-preview-tex
    "mc" `preview-clearout-buffer))

    ;; "mpp" `preview-at-point
    ;; "mpe" `preview-environment
    ;; "mps" `preview-section
    ;; "mpr" `preview-region
    ;; "mpb" `preview-buffer
    ;; ;; un-Preivew commands
    ;; "mpcp" `preview-clearout-at-point
    ;; "mpce" `preview-clearout-environment
    ;; "mpcs" `preview-clearout-section
    ;; "mpcr" `preview-clearout-region
    ;; "mpcb" `preview-clearout-buffer))
