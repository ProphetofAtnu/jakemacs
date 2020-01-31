;;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :defer t
  :config
  (setq lsp-prefer-flymake :none
        lsp-session-file (expand-file-name ".lsp-session-v1" user-cache-dir)))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-flycheck-live-reporting nil
        lsp-ui-doc-position 'bottom))

(use-package company-lsp
  :config
  (add-hook 'lsp-mode-hook (lambda () 
                             (add-to-list (make-local-variable 'company-backends) 'company-lsp))))

(use-package helm-lsp
  :after (lsp-mode)
  :commands
  (helm-lsp-workspace-symbol
   helm-lsp-global-workspace-symbol))

(use-package dap-mode)
