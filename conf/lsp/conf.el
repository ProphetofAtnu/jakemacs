;;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :defer t
  :config
  (setq lsp-file-watch-threshold 10000
        ;; lsp-idle-delay 1
        lsp-enable-snippet t
        lsp-keep-workspace-alive t
        lsp-session-file (expand-file-name ".lsp-session-v1" user-cache-dir)))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq ;; lsp-ui-sideline-enable nil
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-use-webkit t)
  (setq ;; lsp-ui-flycheck-live-reporting nil
   lsp-ui-doc-position 'top
   lsp-ui-doc-max-width 80
   lsp-ui-doc-max-height 20
   lsp-ui-doc-include-signature t
   lsp-ui-peek-always-show t))

(use-package company
  :config
  ;; (setq company-lsp-enable-recompletion t)
  (add-hook 'lsp-mode-hook (lambda () 
                             (add-to-list
                              ;; (make-local-variable 'company-backends)
                              'company-backends
                              'company-capf))))

(use-package helm-lsp
  :after (lsp-mode)
  :commands
  (helm-lsp-workspace-symbol
   helm-lsp-global-workspace-symbol))

(use-package dap-mode)

(use-package treemacs
  :defer t)

(use-package lsp-treemacs
  :init
  (lsp-treemacs-sync-mode)) 
