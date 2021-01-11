;;; -*- lexical-binding: t; -*-

;; (use-package eshell-toggle
;;   :commands (eshell-toggle))

;; (general-define-key
;;  "C-'" 'eshell-toggle)

(leader-minor-def
  :states '(normal visual insert emacs override)
  :keymaps '(sh-mode-map)
  :major-modes t
  ":" 'sh-set-shell
  "." 'sh-cd-here
  "x" 'sh-set-indent
  "'" 'sh-show-shell
  "f" 'sh-end-of-command
  "b " 'sh-beginning-of-command
  "TAB" 'sh-indent-line
  "e" '(:ignore t :wk "Eval")
  "e e" 'sh-send-line-or-region-and-step
  "e r" 'sh-execute-region
  "e x" 'executable-interpret
  "h" '(:ignore t :wk "Help")
  "h h" 'sh-electric-here-document-mode
  "h m" 'woman
  "h s" 'shelldoc-toggle-doc-window
  ;; Indentation
  "s" '(:ignore t :wk "Style")
  "s r" 'sh-reset-indent-vars-to-global-values
  "s l" 'sh-learn-line-indent
  "s L" 'sh-learn-buffer-indent
  "s v" 'sh-show-indent
  "s s" 'sh-backslash-region
  "s TAB" 'sh-basic-indent-line
  "s S" 'sh-name-style
  "s L" 'sh-load-style
  "s h" 'sh-make-vars-local
  ;; Insertions
  "i" '(:ignore t :wk "Insert")
  "i a" 'sh-add
  "i c" 'sh-case
  "i f" 'sh-for
  "i F" 'sh-function
  "i i" 'sh-if
  "i l" 'sh-indexed-loop
  "i r" 'sh-repeat
  "i s" 'sh-select
  "i t" 'sh-tmp-file
  "i u" 'sh-until
  "i w" 'sh-while
  "i W" 'sh-while-getopts
  )
