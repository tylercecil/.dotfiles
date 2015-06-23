;; TODO: Clean this up with an autoload of some kind

;; Poof-general is loaded separately.
(load "~/.emacs.d/proof-general/generic/proof-site.el")

;; This tells proof general WHICH coqtop to use. It will inject
;; `-emacs` itself.
(setq coq-prog-name "/usr/local/bin/coqtop")
