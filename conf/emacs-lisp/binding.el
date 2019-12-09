;;; -*- lexical-binding: t; -*-


(leader-minor-def '(normal visual insert emacs override)
  'emacs-lisp-mode-map
  "m" 'macrostep-mode
  "e" '(:ignore t :wk "Eval")
  "e e" 'eval-last-sexp
  "e E" 'eval-sexp
  "e b" 'eval-buffer
  "e r" 'eval-region
  "i" '(:ignore t :wk "Ielm")
  "i i" 'ielm-other-window
  "i I" 'ielm
  "i r" 'comint-send-region)
