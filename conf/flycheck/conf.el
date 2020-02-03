;;; -*- lexical-binding: t; -*-

(defvar flycheck-disabled-checkers nil)

(use-package flycheck
  :defer t
  :delight " ✅ "
  :init
  (setq flycheck-check-syntax-automatically '(save idle-change new-line)
        flycheck-emacs-lisp-initialize-packages 'auto
        flycheck-emacs-lisp-load-path 'inherit)
  (add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc)
  :config
  (set-face-attribute 'flycheck-error nil :background 'unspecified :underline '(:color "red2" :style wave)))
