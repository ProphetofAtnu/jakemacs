;;; -*- lexical-binding: t; -*-

(use-package lsp-mssql
  ;; :hook (sql-mode . (lambda ()
  ;;                     (require 'lsp-mssql)
  ;;                     (lsp-deferred)))
  :config (setq lsp-mssql-connections
                '[(:server "localhost"
                           :database "master"
                           :user "sa"
                           :password "With$ap0wer")]))


(use-package sql)

