;; -*- lexical-binding: t; -*-
(setq active-configs '(utility emacs-lisp sexp lsp go))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq visible-bell nil
      bookmark-default-file (expand-file-name "bookmarks" user-cache-dir)
      comint-prompt-read-only t)


