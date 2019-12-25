;;; -*- lexical-binding: t; -*-
(defvar inferior-lisp-program "sbcl")

(use-package sly
  :defer t
  :hook (lisp-mode . sly-mode)
  :config
  (setq sly-net-coding-system 'utf-8-unix
        sly-mrepl-history-file-name (ensure-dir user-cache-dir "sly-mrepl-history")
        sly-complete-symbol-function 'sly-simple-completions))
        
