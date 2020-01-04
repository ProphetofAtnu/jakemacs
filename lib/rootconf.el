;; -*- lexical-binding: t; -*-
(setq active-configs '(ivy utility emacs-lisp sexp lsp go common-lisp org flycheck))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq eshell-directory-name (ensure-dir user-cache-dir "eshell"))
(setq comint-prompt-read-only t)

(setq visible-bell nil
      bookmark-default-file (expand-file-name "bookmarks" user-cache-dir)
      comint-prompt-read-only t
      sentence-end-double-space nil)

(provide 'rootconf)
