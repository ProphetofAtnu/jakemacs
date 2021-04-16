;;; -*- lexical-binding: t; -*-

(general-define-key
  :states '(normal motion)
  :keymaps 'elpy-mode-map
 "K" 'elpy-doc)

(leader-minor-def
  :keymaps 'python-mode-map
  :major-modes t
  "," 'elpy-shell-switch-to-shell
  "'" 'elpy-shell-kill-all
  "c" 'python-check
  "=" 'elpy-format-code
  "h" 'counsel-pydoc
  "p" 'python-shell-package-enable
  "q" 'elpy-rpc-restart
  ;; "r" 'python-run
  "k" 'python-describe-at-point
  "g" '(:ignore t :wk "Goto/Find")
  "g g" 'elpy-goto-assignment-other-window
  "g G" 'elpy-goto-assignment
  "g d" 'elpy-goto-definition-other-window
  "g D" 'elpy-goto-definition
  "g f" 'elpy-occur-definitions
  "e" '(:ignore t :wk "Eval")
  "e f" 'elpy-shell-send-file
  "e r" 'elpy-shell-send-region
  "e b" 'elpy-shell-send-buffer-and-go
  "e c" 'elpy-shell-send-defclass-and-step
  "e d" 'elpy-shell-send-defun-and-step
  "e g" 'elpy-shell-send-group-and-step-and-go
  "e e" 'elpy-shell-send-region-or-buffer-and-step
  "r" '(:ignore t :wk "Refactor")
  "r r" 'elpy-refactor-rename
  "r f" 'elpy-refactor-extract-function
  "r v" 'elpy-refactor-extract-variable
  "r i" 'elpy-refactor-inline
  "i" '(:ignore t :wk "Skel")
  "i i" 'python-skeleton-if
  "i d" 'python-skeleton-def
  "i f" 'python-skeleton-for
  "i t" 'python-skeleton-try
  "i c" 'python-skeleton-class
  "i w" 'python-skeleton-while
  "i m" 'python-skeleton-import
  "v" '(:ignore t :wk "Venv")
  "v v" 'pyvenv-workon
  "v a" 'pyvenv-activate
  "v d" 'pyvenv-deactivate
  "v c" 'pyvenv-create
  )
