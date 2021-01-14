;;; -*- lexical-binding: t; -*-


(general-define-key :states '(insert emacs)
                    :keymaps 'go-mode-map
                    "}" 'go-mode-insert-and-indent
                    ")" 'go-mode-insert-and-indent
                    (kbd "<C-return>") 'go-fill-struct)

(leader-minor-def
  :states '(normal visual insert emacs override)
  :keymaps 'go-mode-map
  :major-modes t
  "g" '(:ignore t :wk "Go-To...")
  "g f" 'go-goto-function-name
  "g F" 'go-goto-function
  "g a" 'go-goto-arguments
  "g d" 'go-goto-docstring
  "g i" 'go-goto-imports
  "g m" 'go-goto-method-receiver
  "g r" 'go-goto-return-values
  "q" '(:ignore t :wk "Gen Test")
  "q a" 'go-gen-test-all
  "q d" 'go-gen-test-dwim
  "q e" 'go-gen-test-exported
  "q f" 'go-gen-test-functions
  "t" '(:ignore t :wk "Test")
  "t t" 'go-test-current-test
  "t p" 'go-test-current-project
  "t f" 'go-test-current-file
  "h" '(:ignore t :wk "(Go) Help")
  "h ." 'go-guru-set-scope
  "h /" 'go-guru-hl-identifier
  "h c" 'go-guru-callees
  "h C" 'go-guru-callers
  "h d" 'go-guru-describe
  "h e" 'go-guru-expand-region
  "h f" 'go-guru-freevars
  "h i" 'go-guru-implements
  "h k" 'go-guru-definition-other-window
  "h K" 'go-guru-definition
  "h p" 'go-guru-peers
  "h P" 'go-guru-pointsto
  "h r" 'go-guru-referrers
  "h s" 'go-guru-callstack
  "h w" 'go-guru-whicherrs
  "h g" 'godoc
  "h G" 'godoc-at-point
  "i" '(:ignore t :wk "Insert/Add")
  "i i" 'go-imports-insert-import
  "i I" 'go-imports-reload-packages-list
  "i a" 'go-import-add
  "i t" 'go-tag-add
  "i o" 'go-tag-open-github
  "i r" 'go-tag-refresh
  "i d" 'go-tag-remove
  "i n" 'go-impl
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
  "x x" 'js/gorun-file
  "x p" 'js/gorun-package
  "e" '(:ignore t :wk "Repl")
  "e t" 'gorepl-run
  "e l" 'gorepl-run-load-current-file
  "e e" 'gorepl-eval
  "e r" 'gorepl-eval-region
  "e l" 'gorepl-eval-line
  "e j" 'gorepl-eval-line-goto-next-line
  "d" 'godef-describe
  "j" 'godef-jump-other-window
  "J" 'godef-jump
  "=" 'gofmt
  "," 'gofmt
  "p" 'go-playground
  "P" 'go-playground-rm)


