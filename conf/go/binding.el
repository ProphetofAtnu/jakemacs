;;; -*- lexical-binding: t; -*-

(leader-minor-def
  :states '(normal visual insert emacs override)
  :keymaps '(go-mode-map local)
  :major-modes t
  "g" '(:ignore t :wk "Go-To...")
  "g f" 'go-goto-function-name
  "g i" 'go-goto-imports
  "g m" 'go-goto-method-receiver
  "g r" 'go-goto-return-values
  "g i" 'go-mode-insert-and-indent
  "g m" 'go-mode-menu
  "q" '(:ignore t :wk "QA (Test)")
  "q a" 'go-gen-test-all
  "q d" 'go-gen-test-dwim
  "q e" 'go-gen-test-exported
  "q f" 'go-gen-test-functions
  "h" '(:ignore t :wk "(Go) Help")
  "h c" 'go-guru-callees
  "h d" 'go-guru-describe
  "h p" 'go-guru-pointsto
  "h r" 'go-guru-referrers
  "h w" 'go-guru-whicherrs
  "h g" 'godoc
  "h G" 'godoc-at-point
  "i" '(:ignore t :wk "Insert/Add")
  "i a" 'go-import-add
  "i t" 'go-tag-add
  "i o" 'go-tag-open-github
  "i r" 'go-tag-refresh
  "i d" 'go-tag-remove
  "r" '(:ignore t :wk "Refractor")
  "r g" 'godoctor-godoc
  "r r" 'godoctor-rename
  "r t" 'godoctor-toggle
  "r e" 'godoctor-extract
  "r s" 'godoctor-set-scope
  "r d" '(:ignore t :wk "Dry Run")
  "r d d" 'godoctor-godoc-dry-run
  "r d t" 'godoctor-toggle-dry-run
  "r d r" 'godoctor-rename-dry-run
  "r d e" 'godoctor-extract-dry-run
  "x" '(:ignore t :wk "Execute")
  "x r" 'gorepl-run
  "x l" 'gorepl-run-load-current-file
  "x x" 'js/gorun
  "b" '(:ignore t :wk "Build/Run")
  "=" 'gofmt)


