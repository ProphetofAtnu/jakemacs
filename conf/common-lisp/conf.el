;;; -*- lexical-binding: t; -*-
(defvar inferior-lisp-program "sbcl")

(defun js/sly-add-contribs ()
  "Add all contribs to sly on repl init"
  (dolist (contr '(sly-autodoc
                   sly-mrepl
                   sly-fancy-inspector
                   sly-fancy-trace
                   sly-scratch
                   sly-package-fu
                   sly-fontifying-fu
                   sly-trace-dialog
                   sly-stickers
                   sly-indentation
                   sly-tramp
                   sly-quicklisp
                   sly-macrostep
                   sly-fancy
                   sly-asdf))
    (sly-enable-contrib contr)))

(use-package sly
  :defer t
  :hook (lisp-mode . sly-mode)
  :config
  (setq sly-net-coding-system 'utf-8-unix
        sly-mrepl-history-file-name (concat-path user-cache-dir "sly-mrepl-history")
        sly-complete-symbol-function 'sly-simple-completions)
  (sp-with-modes '(sly-mrepl-mode)
    (sp-local-pair "'" "'" :actions nil)
    (sp-local-pair "`" "`" :actions nil))
  (add-hook 'sly-mrepl-mode-hook (lambda ()  (js/sly-add-contribs))))

(use-package sly-company
  :hook (sly-mode . sly-company-mode)
  :config
  (add-hook 'sly-mode-hook (lambda () 
                             (add-to-list (make-local-variable 'company-backends) 'sly-company))))


(use-package sly-repl-ansi-color
  :hook (sly-mrepl . sly-repl-ansi-on))
