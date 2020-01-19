;; -*- lexical-binding: t; -*-
(setq active-configs '(ivy utility emacs-lisp sexp lsp go common-lisp org js shell flycheck))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq eshell-directory-name (ensure-dir user-cache-dir "eshell"))
(setq comint-prompt-read-only t)

(setq visible-bell nil
      bookmark-default-file (expand-file-name "bookmarks" user-cache-dir)
      comint-prompt-read-only t
      sentence-end-double-space nil
      save-place-file (expand-file-name "places" user-cache-dir))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq auto-save-list-file-prefix "~/.emacs.d/.cache/auto-save-list/.saves-")

(provide 'rootconf)
