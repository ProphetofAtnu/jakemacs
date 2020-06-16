;;; -*- lexical-binding: t; -*-

;; (setq-mode-local slime-mode
;;                  evil-lookup-func #'slime-documentation)

;; (leader-minor-def
;;   :keymaps 'slime-mode-map
;;   "," 'slime
;;   "'" 'slime-repl
;;   "a" 'slime-apropos
;;   "A" 'slime-apropos-all
;;   "p" 'slime-apropos-package
;;   "s" 'slime-scratch
;;   "i" 'slime-inspect-definition
;;   "I" 'slime-inspect
;;   "q" 'slime-reset
;;   "Q" 'slime-quit-lisp
;;   "D" 'slime-sync-package-and-default-directory
;;   "d" 'slime-set-default-directory
;;   "e" '(:ignore t :wk "Eval")
;;   "e e" 'slime-eval-last-expression-in-repl
;;   "e E" 'slime-eval-last-expression
;;   "e f" 'slime-eval-defun
;;   "e r" 'slime-eval-region
;;   "e b" 'slime-eval-buffer
;;   "c" '(:ignore t :wk "Compile")
;;   "c c" 'slime-compile-and-load-file
;;   "c f" 'slime-compile-file
;;   "c d" 'slime-compile-defun
;;   "c r" 'slime-compile-region
;;   "c n" 'slime-list-compiler-notes
;;   "w" '(:ignore t :wk "Who")
;;   "w s" 'slime-who-sets
;;   "w b" 'slime-who-binds
;;   "w w" 'slime-who-calls
;;   "w r" 'slime-who-references
;;   "w z" 'slime-who-specializes
;;   "w e" 'slime-who-macroexpands
;;   "w c" 'slime-calls-who
;;   )


;; Explicitly for sly
(leader-minor-def
  :states '(normal visual insert emacs override)
  :keymaps 'sly-mode-map
  "," 'sly
  "m" 'macrostep-mode
  "c" '(:ignore t :wk "Compile")
  "c c" 'sly-compile-file
  "c C" 'sly-compile-and-load-file
  "c f" 'sly-compile-defun
  "c l" 'sly-load-file
  "c n" 'sly-remove-notes
  "c r" 'sly-compile-region
  "e" '(:ignore t :wk "Eval")
  "e e" 'sly-eval-last-expression
  "e E" 'sly-eval-print-last-expression
  "e b" 'sly-eval-buffer
  "e r" 'sly-eval-region
  "e f" 'sly-eval-defun
  "e F" 'sly-undefine-function
  "r" '(:ignore t :wk "Sly-Repl")
  "r c" 'sly-mrepl-clear-repl
  "r q" 'sly-quit-lisp
  "r r" 'sly-restart-inferior-lisp
  "r s" 'sly-mrepl-sync
  "g" '(:ignore t :wk "Go To...")
  "g b" 'sly-pop-find-definition-stack
  "g d" 'sly-edit-definition
  "g D" 'sly-edit-definition-other-window
  "g n" 'sly-next-note
  "g N" 'sly-previous-note
  "g s" 'sly-stickers-next-sticker
  "g S" 'sly-stickers-prev-sticker
  "h" '(:ignore t :wk "Help")
  "h <" 'sly-who-calls
  "h >" 'sly-calls-who
  "h e" 'hyperspec-lookup-format
  "h #" 'hyperspec-lookup-reader-macro
  "h a" 'sly-apropos
  "h b" 'sly-who-binds
  "h d" 'sly-disassemble-symbol
  "h h" 'sly-describe-symbol
  "h H" 'sly-hyperspec-lookup
  "h m" 'sly-who-macroexpands
  "h p" 'sly-apropos-package
  "h r" 'sly-who-references
  "h s" 'sly-who-specializes
  "h S" 'sly-who-sets
  "s" '(:ignore t :wk "Stickers")
  "s b" 'sly-stickers-toggle-break-on-stickers
  "s c" 'sly-stickers-clear-defun-stickers
  "s C" 'sly-stickers-clear-buffer-stickers
  "s f" 'sly-stickers-fetch
  "s r" 'sly-stickers-replay
  "s s" 'sly-stickers-dwim
  "t" '(:ignore t :wk "Trace")
  "t t" 'sly-toggle-trace-fdefinition
  "t T" 'sly-toggle-fancy-trace
  "t u" 'sly-untrace-all)

