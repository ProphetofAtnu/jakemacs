;;; -*- lexical-binding: t; -*-

;; (leader-minor-def
;;   :map lisp-mode-map

;;   )
(defun js/sly-bind-local ()
  "Make sly bindings local to sly buffers"
  (leader-minor-def
    :states '(normal visual insert emacs override)
    :keymaps '(local)
    :major-modes t
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
    "t u" 'sly-untrace-all))

(add-hook 'sly-mode-hook #'js/sly-bind-local)
