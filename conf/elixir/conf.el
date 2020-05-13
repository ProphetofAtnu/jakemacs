;;; -*- lexical-binding: t; -*-

(defvar js/elixir-ls-subpath "elixir-ls/release")

(defvar js/elixir-ls-release-path
  (expand-file-name js/elixir-ls-subpath user-src-dir))

(use-package lsp-mode
    :commands lsp
    :diminish lsp-mode
    :hook
    (elixir-mode . lsp)
    :init
    (add-to-list 'exec-path js/elixir-ls-release-path))

(use-package elixir-mode
  :defer t)
