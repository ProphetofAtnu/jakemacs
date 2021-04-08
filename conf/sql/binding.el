;;; -*- lexical-binding: t; -*-

;; (leader-minor-def
;;   :keymaps '(sql-mode-map)
;;   :major-modes t
;;   "," 'lsp-mssql-connect
;;   "q" 'lsp-mssql-disconnect
;;   "e" 'lsp-mssql-execute-region
;;   "b" 'lsp-mssql-execute-buffer
;;   "." 'lsp-mssql-object-explorer)


(leader-minor-def
  :keymaps '(sql-mode-map)
  :major-modes t
  "d" 'sql-set-dialect
  "," 'sql-product-interactive
  "t" 'sql-list-table
  "a" 'sql-list-all
  "b" 'sql-send-buffer)
