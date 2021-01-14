;;; -*- lexical-binding: t; -*-


(leader-tert-def
  "v" 'lsp)

(general-define-key
 :prefix-command 'js/lsp-command
 :prefix-map 'js/lsp-prefix
 "=" 'lsp-format-buffer
 "-" 'lsp-format-region
 "q" 'lsp-disconnect
 "r" 'lsp-rename
 "a" 'lsp-execute-code-action
 "i" 'lsp-ui-imenu
 "e" 'lsp-treemacs-errors-list
 "s" 'lsp-ui-sideline-toggle-symbols-info
 ;; Goto
 "g" '(:ignore t :wk "Goto")
 "g g" 'lsp-describe-thing-at-point
 "g d" 'lsp-goto-type-definition
 "g D" 'lsp-find-declaration
 "g f" 'lsp-find-definition
 "g F" 'lsp-find-type-definition
 "g i" 'lsp-find-implementation
 "g I" 'lsp-goto-implementation
 "g l" 'lsp-find-references
 ;; Workspace
 "w" '(:ignore t :wk "Workspace")
 "w w" 'lsp-describe-session
 "w a" 'lsp-workspace-folders-add
 "w o" 'lsp-workspace-folders-open
 "w d" 'lsp-workspace-folders-remove
 "w r" 'lsp-workspace-restart
 "w l" 'lsp-workspace-show-log
 "w q" 'lsp-workspace-shutdown
 "w R" 'lsp-workspace-blacklist-remove
 "p" '(:ignore t :wk "Peek")
 "p f" 'lsp-ui-peek-find-definitions
 "p i" 'lsp-ui-peek-find-implementation
 "p l" 'lsp-ui-peek-find-references
 "p s" 'lsp-ui-peek-find-workspace-symbol
 "p n" 'lsp-ui-peek-jump-backward
 "p p" 'lsp-ui-peek-jump-forward
 )

(which-key-add-keymap-based-replacements js/lsp-prefix
  "g" "Goto"
  "w" "Workspace"
  "p" "Peek")


(leader-minor-def
  :definer 'minor-mode
  :keymaps 'lsp-mode
  "l" '(:prefix-command js/lsp-command
        :prefix-map js/lsp-prefix
        :wk "LSP")
  )

(add-hook
 'lsp-mode-hook
 (lambda ()
   (setq-local
    evil-lookup-func
    #'lsp-describe-thing-at-point)))
