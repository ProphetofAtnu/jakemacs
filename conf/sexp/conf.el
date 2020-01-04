;;; -*- lexical-binding: t; -*-


(use-package highlight-quoted
  :hook
  ((emacs-lisp-mode lisp-mode) . highlight-quoted-mode))

(use-package lispy
  :delight
  :hook
  ((emacs-lisp-mode lisp-mode) . lispy-mode))

(use-package lispyville
  :delight
  :hook (lispy-mode . lispyville-mode)
  :config
  (lispyville-set-key-theme '(operators c-w additional)))
