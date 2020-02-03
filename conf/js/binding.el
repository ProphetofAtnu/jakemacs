;;; -*- lexical-binding: t; -*-

(general-define-key :states '(insert emacs)
                    :keymaps '(js2-mode-map rjsx-mode-map)
                    [return] 'js/maybe-pretty-brackets
                    "RET" 'js/maybe-pretty-brackets)

;; Both JS2 & React
(leader-minor-def
  :keymaps '(js2-mode-map)
  :major-mode t
  "=" 'prettier-js
  "-" 'eslintd-fix
  "z" '(:ignore t :wk "Fold")
  "z c" 'js2-mode-hide-element
  "z o" 'js2-mode-show-element
  "z r" 'js2-mode-show-all
  "z e" 'js2-mode-toggle-element
  "z F" 'js2-mode-toggle-hide-functions
  "z C" 'js2-mode-toggle-hide-comments
  ;; Refractor
  "r" '(:ignore t :wk "Refactor")
  "r a" '(:ignore t :wk "Add")
  "r a g" 'js2r-add-to-globals-annotation
  "r a o" 'js2r-arguments-to-object
  "r b" '(:ignore t :wk "Barf")
  "r b a" 'js2r-forward-barf
  "r c" '(:ignore t :wk "Contract")
  "r c a" 'js2r-contract-array
  "r c o" 'js2r-contract-object
  "r c u" 'js2r-contract-function
  "r e" '(:ignore t :wk "Exp/Ext")
  "r e a" 'js2r-expand-array
  "r e f" 'js2r-extract-function
  "r e m" 'js2r-extract-method
  "r e o" 'js2r-expand-object
  "r e u" 'js2r-expand-function
  "r e v" 'js2r-extract-var
  "r i" '(:ignore t :wk "Inj/Intr")
  "r i g" 'js2r-inject-global-in-iife
  "r i p" 'js2r-introduce-parameter
  "r i v" 'js2r-inline-var
  "r l" '(:ignore t :wk "Log/Loc")
  "r l p" 'js2r-localize-parameter
  "r l t" 'js2r-log-this
  "r r" '(:ignore t :wk "Rename")
  "r r v" 'js2r-rename-var
  "r r i" 'js2r-ternary-to-if
  "r s" '(:ignore t :wk "Slrp/Splt")
  "r s l" 'js2r-forward-slurp
  "r s s" 'js2r-split-string
  "r s v" 'js2r-split-var-declaration
  "r t" '(:ignore t :wk "Toggle")
  "r t f" 'js2r-toggle-function-expression-and-declaration
  "r v t" 'js2r-var-to-this
  "r w" '(:ignore t :wk "[Un]Wrap")
  "r w i" 'js2r-wrap-buffer-in-iife
  "r w l" 'js2r-wrap-in-for-loop
  "r w u" 'js2r-unwrap
  "k" 'js2r-kill
  "r m" '(:ignore t :wk "Move Line")
  "r m j" 'js2r-move-line-down
  "r m k" 'js2r-move-line-up
  ;; Node
  ;; "n" '(:ignore t :wk "Node-Repl")
  ;; "n '" 'nodejs-repl
  ;; "n s" 'nodejs-repl
  ;; "n i" 'nodejs-repl-switch-to-repl
  ;; "n e" 'nodejs-repl-send-last-expression
  ;; "n E" '(#'(lambda ()
  ;;             (interactive)
  ;;             (nodejs-repl-send-last-expression)
  ;;             (nodejs-repl-switch-to-repl)) :wk "Send LE+F")
  ;; "n b" 'nodejs-repl-send-buffer
  ;; "n B" '(#'(lambda ()
  ;;          (interactive)
  ;;          (nodejs-repl-send-buffer)
  ;;          (nodejs-repl-switch-to-repl)) :wk "Send Buff+F")
  ;; "n l" 'nodejs-repl-send-line
  ;; "n L" '(#'(lambda ()
  ;;             (interactive)
  ;;             (nodejs-repl-send-line)
  ;;             (nodejs-repl-switch-to-repl)) :wk "Send Line+F")
  ;; "n r" 'nodejs-repl-send-region
  ;; "n R" '(#'(lambda (start end)
  ;;             (interactive "r")
  ;;             (nodejs-repl-send-region start end)
  ;;             (nodejs-repl-switch-to-repl)) :wk "Send Region+F")
  )


(leader-minor-def
  :keymaps '(js2-mode-map rjsx-mode-map)
  :major-mode t
  "m" '(:ignore t :wk "Tide")
  "m x" 'tide-fix
  "m n" 'tide-nav
  "m =" 'tide-format
  "m t" 'tide-refactor
  "m f" 'tide-references
  "m d" 'tide-jump-to-definition
  "m D" 'tide-jump-back
  "m R" 'tide-rename-file
  "m q" 'tide-restart-server
  "m Q" 'tide-kill-server
  "m v" 'tide-verify-setup
  "m s" 'tide-list-servers
  "m c" 'tide-compile-file
  "m r" 'tide-rename-symbol
  "m i" 'tide-jsdoc-template)


;; Indium
(leader-minor-def
  :keymaps '(js2-mode-map rjsx-mode-map)
  :major-mode t
  "." 'indium-switch-to-debugger
  "'" 'indium-switch-to-repl-buffer
  ", ," 'indium-eval
  ", l" 'indium-launch
  ", L" 'indium-connect 
  ", s" 'indium-scratch
  ", b" 'indium-add-breakpoint
  ", B" 'indium-remove-breakpoint
  ", c" 'indium-deactivate-breakpoints
  ", C" 'indium-activate-breakpoints
  ", d" 'indium-debugger-evaluate
  ", e" 'indium-eval-last-node
  ", k" 'indium-remove-all-breakpoints-from-buffer
  ", f" 'indium-eval-defun
  ", b" 'indium-eval-buffer
  ", v" 'indium-list-breakpoints)

(leader-minor-def
  :keymaps '(js2-mode-map rjsx-mode-map)
  :major-mode t
  "d" '(:ignore t :wk "JSDoc")
  "d t" 'js-doc-insert-tag
  "d d" 'js-doc-describe-tag
  "d f" 'js-doc-insert-function-doc
  "d F" 'js-doc-insert-file-doc
  "d s" 'js-doc-insert-function-doc-snippet)


(leader-minor-def
  :keymaps '(emmet-mode-keymap)
  :minor-mode t
  "i" '(:ignore t :wk "Emmet")
  "i i" 'emmet-expand-line
  "i p" 'emmet-preview
  "i w" 'emmet-wrap-with-markup)

(leader-minor-def
  :keymaps '(flow-minor-mode-map)
  "f" '(:ignore t :wk "Flow")
  "fb" 'xref-pop-marker-stack
  "fd" 'flow-minor-jump-to-definition
  "fc" 'flow-minor-status
  "ff" 'flow-minor-suggest
  "fo" 'flow-minor-coverage
  "ft" 'flow-minor-type-at-pos)
