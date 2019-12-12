;;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :defer t
  :config
  (setq lsp-session-file (expand-file-name ".lsp-session-v1" user-cache-dir)))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :config
  (add-to-list 'company-backends 'company-lsp))

(use-package helm-lsp
  :commands
  (helm-lsp-workspace-symbol
   helm-lsp-global-workspace-symbol))

