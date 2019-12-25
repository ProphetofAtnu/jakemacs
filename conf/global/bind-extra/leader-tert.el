;;; -*- lexical-binding: t; -*-

(general-create-definer leader-tert-def
  :states '(normal visual insert emacs override)
  :prefix leader-tertiary
  :non-normal-prefix alt-tertiary)

(leader-tert-def
  "t" 'term
  "w" 'eww
  "b" 'bookmark-bmenu-search
  "a" 'ace-window
  "o" 'ace-link
  "m" 'helm-mode-manager
  "l" 'avy-goto-line
  "\\" 'eval-expression)

(leader-tert-def
  "x" '(:ignore t :wk "Text")
  "x x" 'indent-region
  "x X" 'indent-rigidly
  "x u" 'downcase-region
  "x U" 'upcase-region
  "x t" 'transpose-words
  "x T" 'transpose-lines
  "x c" 'evil-align-center
  "x a" 'align-regexp
  "x A" 'align-entire
  "x s" 'sort-lines
  "x S" 'sort-lines-reverse
  "x k" 'keep-lines
  "x K" 'delete-matching-lines)
