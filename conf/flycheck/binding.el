;;; -*- lexical-binding: t; -*-

(leader-primary-def '(normal visual insert emacs override)
  "e" '(:ignore t :wk "Errors")
  "e t" 'flycheck-mode
  "e c" 'flycheck-clear
  "e b" 'flycheck-buffer
  "e C" 'flycheck-compile
  "e n" 'flycheck-next-error
  "e l" 'flycheck-list-errors
  "e f" 'flycheck-first-error
  "e v" 'flycheck-verify-setup
  "e p" 'flycheck-previous-error
  "e s" 'flycheck-select-checker
  "e D" 'flycheck-disable-checker
  "e d" 'flycheck-describe-checker
  "e y" 'flycheck-copy-errors-as-kill
  "e e" 'flycheck-explain-error-at-point
  "e E" 'flycheck-display-error-at-point)
