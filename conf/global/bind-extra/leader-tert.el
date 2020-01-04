;;; -*- lexical-binding: t; -*-

(use-package magit
  :commands (magit))

(general-create-definer leader-tert-def
  :states '(normal visual insert emacs override)
  :prefix leader-tertiary
  :non-normal-prefix alt-tertiary)

(leader-tert-def
  "t" 'term
  "e" 'eww
  "b" 'bookmark-bmenu-search
  "a" 'ace-window
  "g" 'magit
  "RET" 'ace-link
  ;; "m" 'helm-mode-manager
  ;; "\\" 'helm-mini
  "\\" 'counsel-tmm
  "l" 'avy-goto-line)

(leader-tert-def
  "x" '(:ignore t :wk "Text")
  "x x" 'indent-region
  "x X" 'indent-rigidly
  "x q" 'fill-paragraph
  "x Q" 'auto-fill-mode
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

