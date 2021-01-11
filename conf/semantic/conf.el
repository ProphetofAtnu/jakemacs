;;; -*- lexical-binding: t; -*-

;; (use-package semantic
;;   :config
;;   (semantic-mode))

(use-package semantic
  :commands (semantic-mode)
  :init
  (setq semantic-default-submodes
    '(;; Default
      global-semantic-idle-scheduler-mode
      global-semanticdb-minor-mode
      ;; Aux
      ;; global-semantic-idle-summary-mode
      ;; global-semantic-idle-completions-mode
      ;; global-semantic-decoration-mode
      global-semantic-highlight-func-mode
      ;; global-semantic-stickyfunc-mode
      global-semantic-mru-bookmark-mode))
  (semantic-mode)
  :config
  ;; (add-to-list 'semantic-new-buffer-setup-functions '(emacs-lisp-mode . semantic-default-elisp-setup))
  (semantic-idle-scheduler-add 'semanticdb-save-all-db-idle)
  ;; (setq semantic-default-submodes enabled-semantic-submodes)
  (setq semanticdb-find-default-throttle '(local project)))
