;;; -*- lexical-binding: t; -*-

(leader-minor-def
  :states '(normal visual insert emacs override)
  :keymaps '(emacs-lisp-mode-map emacs-lisp local)
  :major-modes t
  "m" 'macrostep-mode
  "d" 'elisp-def
  "e" '(:ignore t :wk "Eval")
  "e e" 'eval-last-sexp
  "e E" 'eval-sexp
  "e b" 'eval-buffer
  "e r" 'eval-region
  "i" '(:ignore t :wk "Ielm")
  "i i" 'ielm-other-window
  "i I" 'ielm
  "i r" 'comint-send-region
  "p" 'check-parens)
