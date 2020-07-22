;;; -*- lexical-binding: t; -*-

(leader-minor-def
  :keymaps '(sql-mode-map)
  :major-mode t
  "," 'lsp-mssql-connect
  "q" 'lsp-mssql-disconnect
  "e" 'lsp-mssql-execute-region
  "b" 'lsp-mssql-execute-buffer
  "." 'lsp-mssql-object-explorer)

