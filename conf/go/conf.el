;;; -*- lexical-binding: t; -*-

(require 'use-package)

(use-package go-mode
  :init
  (setq gofmt-command "goimports")
  :config
  (add-hook 'before-save-hook 'gofmt-before-save nil t)
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
  :hook (go-mode . go-eldoc-setup)
  :config (eldoc-mode-set-explicitly))

(use-package go-tag
  :commands (go-tag-add go-tag-remove go-tag-refresh))

(use-package godoctor
  :commands godoctor-godoc godoctor-rename godoctor-toggle godoctor-extract)

(use-package go-fill-struct
  :commands (go-fill-struct))

(use-package go-gen-test
  :commands (go-gen-test-all go-gen-test-dwim go-gen-test-exported go-gen-test-functions))

(use-package flycheck-golangci-lint
  :commands (flycheck-golangci-lint-setup)
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-golangci-lint-setup nil t)
  (dolist (checker '(go-errcheck
                     go-staticcheck
                     go-test))
    (add-to-list 'flycheck-disabled-checkers checker)))

(use-package gorepl-mode
  :config
  (setenv "GOROOT" "/usr/local/go")
  (setenv "GOPATH" (expand-file-name "~/go")))

(use-package go-imenu
  :hook (go-mode . go-imenu-setup))

(use-package flycheck
  :hook (go-mode . flycheck-mode))

(use-package go-imports
  :commands (go-imports-reload-packages-list go-imports-insert-import))

(use-package go-playground
  :config
  (add-hook 'go-playground-mode-hook '(lambda ()
                                        (add-to-list
                                         ;; (make-local-variable 'company-backends)
                                         'company-backends
                                         'company-go))))

(use-package org
  :defer t
  :config
  (require 'ob-go))
