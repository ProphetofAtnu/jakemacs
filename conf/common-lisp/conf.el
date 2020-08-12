;;; -*- lexical-binding: t; -*-
(defvar inferior-lisp-program "ros run")



;; Sly seems to be broken on this version of emacs?
;; Switching back to slime is now a toggle in configurations
(defun lisp-sly-init () 
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
    ;; (sp-with-modes '(sly-mrepl-mode)
    ;;   (sp-local-pair "'" "'" :actions nil)
    ;;   (sp-local-pair "`" "`" :actions nil))
    (add-hook 'sly-mrepl-mode-hook (lambda ()
                                     ;; (smartparens-mode -1)
                                     ;; (electric-pair-local-mode)
                                     (js/sly-add-contribs))))
  
  (use-package org
    :defer t
    :config
    (setq org-babel-lisp-eval-fn #'sly-eval)
    (require 'ob-lisp))

  (use-package sly-company
    :defer t
    :hook (sly-mode . sly-company-mode)
    :config
    (add-hook 'sly-mode-hook (lambda () 
                               (add-to-list (make-local-variable 'company-backends) 'sly-company))))


  (use-package sly-repl-ansi-color
    :hook (sly-mrepl . sly-repl-ansi-on)))


(defun lisp-slime-init ()
  (use-package slime)
  (use-package slime-company
    :commands (company-slime)
    :hook (slime-mode . (lambda ()
                          (company-mode-on)
                          (add-to-list 'company-backends 'company-slime))))
  (use-package slime-repl-ansi-color
    :hook (slime-repl-mode . slime-repl-ansi-color-mode)))

(if common-lisp-use-sly
    (lisp-sly-init)
  (lisp-slime-init))

