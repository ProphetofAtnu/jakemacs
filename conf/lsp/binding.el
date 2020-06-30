;;; -*- lexical-binding: t; -*-


(add-hook
 'lsp-mode-hook
 (lambda () 
   (setq-local evil-lookup-func #'lsp-describe-thing-at-point)
   (leader-minor-def
     :keymaps 'local
     "l" '(:ignore t :wk "LSP")
     "l =" 'lsp-format-buffer
     "l -" 'lsp-format-region
     "l q" 'lsp-disconnect
     "l c" 'lsp-rename
     ;; Goto
     "l g" '(:ignore t :wk "Goto")
     "l g g" 'lsp-describe-thing-at-point
     "l g d" 'lsp-goto-type-definition
     "l g D" 'lsp-find-declaration
     "l g f" 'lsp-find-definition
     "l g F" 'lsp-find-type-definition
     "l g i" 'lsp-find-implementation
     "l g I" 'lsp-goto-implementation
     "l g l" 'lsp-find-references
     ;; Workspace
     "l w" '(:ignore t :wk "Workspace")
     "l w w" 'lsp-describe-session
     "l w a" 'lsp-workspace-folders-add
     "l w o" 'lsp-workspace-folders-open
     "l w d" 'lsp-workspace-folders-remove
     "l w r" 'lsp-workspace-restart
     "l w l" 'lsp-workspace-show-log
     "l w q" 'lsp-workspace-shutdown
     "l w R" 'lsp-workspace-blacklist-remove)))

(add-hook
 'lsp-ui-mode-hook
 (lambda ()
   (leader-minor-def
     :keymaps 'local
     "l " '(:ignore t :wk "Workspace")
     "l p" '(:ignore t :wk "Peek")
     "l p f" 'lsp-ui-peek-find-definitions
     "l p i" 'lsp-ui-peek-find-implementation
     "l p l" 'lsp-ui-peek-find-references
     "l p s" 'lsp-ui-peek-find-workspace-symbol
     "l p n" 'lsp-ui-peek-jump-backward
     "l p p" 'lsp-ui-peek-jump-forward)))
