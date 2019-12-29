;;; -*- lexical-binding: t; -*-

(use-package flycheck
  :defer t
  :init
  (setq flycheck-check-syntax-automatically '(save idle-change new-line)
        flycheck-emacs-lisp-initialize-packages 'auto
        flycheck-emacs-lisp-load-path 'inherit)
  :config
  (set-face-attribute 'flycheck-error nil :background 'unspecified :underline '(:color "red2" :style wave)))


