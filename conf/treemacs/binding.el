;;; -*- lexical-binding: t; -*-

;; (leader-primary-def '(normal visual motion insert emacs override)
;;   ";" 'treemacs-select-window)

(leader-minor-def
  :keymaps '(treemacs-mode-map)
  "," 'treemacs-switch-workspace
  "a" 'treemacs-add-project-to-workspace
  "r" 'treemacs-remove-project-from-workspace
  "w" 'treemacs-create-workspace
  "d" 'treemacs-remove-workspace
  "e" 'treemacs-edit-workspaces
  )

(general-def 'js/files-prefix
  "l" 'js/treemacs-relocate-here
  "a" 'treemacs-add-project-to-workspace
  "p" 'treemacs-display-current-project-exclusively)
