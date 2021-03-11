;;; -*- lexical-binding: t; -*-

(use-package treemacs
  :defer t)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (require 'lsp-treemacs)
  (setq lsp-file-watch-threshold 10000
        lsp-idle-delay 0.5 
        lsp-enable-snippet t
        lsp-keep-workspace-alive t
        lsp-enable-file-watchers nil
        lsp-session-file (expand-file-name ".lsp-session-v1" user-cache-dir)))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq ;; lsp-ui-sideline-enable nil
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-use-webkit t)
  (setq
   lsp-ui-flycheck-live-reporting nil
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
  :after (lsp-mode helm)
  :commands
  (helm-lsp-workspace-symbol
   helm-lsp-global-workspace-symbol))

(use-package dap-mode)


