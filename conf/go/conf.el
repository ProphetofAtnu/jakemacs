;;; -*- lexical-binding: t; -*-

(use-package go-mode
  :config
  (load (expand-file-name "function" (file-name-directory load-file-name)))
  (setq-mode-local go-mode evil-lookup-func 'godoc-at-point))

;; (use-package company-go)

(use-package lsp-mode
  :hook (go-mode . lsp))

(use-package go-guru
  :hook
  (go-mode . go-guru-hl-identifier-mode))

(use-package go-rename
  :commands (go-rename)
  :after go-mode)

(use-package go-impl
  :commands (go-impl)
  :after go-mode)

(use-package go-eldoc
  :hook (go-mode . go-eldoc-setup))

(use-package go-tag
  :commands (go-tag-add go-tag-remove go-tag-refresh))

(use-package godoctor
  :commands godoctor-godoc godoctor-rename godoctor-toggle godoctor-extract)

(use-package go-fill-struct
  :commands (go-fill-struct))

(use-package go-gen-test
  :commands (go-gen-test-all go-gen-test-dwim go-gen-test-exported go-gen-test-functions))

(use-package flycheck
  :hook
  (go-mode . flycheck-mode))

(use-package flycheck-golangci-lint
  :hook (go-mode . flycheck-golangci-lint-setup)
  :after (flycheck-mode)
  :config 
  (flycheck-disable-checker 'go-errcheck)
  (flycheck-disable-checker 'go-staticcheck)
  (flycheck-disable-checker 'go-test))

