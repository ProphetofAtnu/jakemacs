;;; -*- lexical-binding: t; -*-

(defvar js/elixir-ls-subpath "elixir-ls/release")

(defvar js/elixir-ls-release-path
  (expand-file-name js/elixir-ls-subpath user-src-dir))

(use-package lsp-mode
    :commands lsp
    :diminish lsp-mode
    :hook
    (elixir-mode . lsp-deferred)
    :init
    (add-to-list 'exec-path js/elixir-ls-release-path)
    :config
    (setq-mode-local elixir-mode evil-lookup-func
                     #'lsp-describe-thing-at-point))

(use-package alchemist
  :config
  (add-to-list 'purpose-x-popwin-buffer-names "*alchemist-info-mode*")
  (add-to-list 'purpose-x-popwin-buffer-names "*alchemist mix*")
  (add-to-list 'purpose-x-popwin-buffer-names "*Alchemist-IEx*")
  (purpose-x-popwin-update-conf))

(require 'after/company-after)

(js/company-localize-backends
 elixir-mode
 (company-capf (company-dabbrev-code company-gtags company-etags company-keywords)))

(use-package elixir-mode
  :defer t)

(use-package mix
  :hook (elixir-mode . mix-minor-mode))
