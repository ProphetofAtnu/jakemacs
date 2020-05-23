;;; -*- lexical-binding: t; -*-



(leader-minor-def
  :keymaps '(treemacs-mode-map)
  "," 'treemacs-switch-workspace
  "a" 'treemacs-add-project-to-workspace
  "r" 'treemacs-remove-project-from-workspace
  "d" 'treemacs-remove-workspace
  "e" 'treemacs-edit-workspaces
  )
