;;; -*- lexical-binding: t; -*-

(require 'which-key)

(general-define-key
  :prefix-command 'js/projectile-command
  :prefix-map 'js/projectile-prefix
  "p" 'projectile-commander
  "c" 'org-projectile-capture-for-current-project
  "C" 'org-projectile-goto-location-for-project
  "r" 'projectile-recentf
  "d" 'projectile-find-dir
  "F" 'projectile-find-file-dwim
  "f" 'projectile-find-file
  "o" 'projectile-find-file-dwim-other-window
  "a" 'projectile-add-known-project
  "A" 'projecitle-remove-known-project
  "i" 'projectile-ibuffer
  "s" 'projectile-switch-project
  "~" 'projectile-browse-dirty-projects
  "l" 'projectile-find-file-in-known-projects
  "b" 'projectile-switch-to-buffer
  "B" 'projectile-switch-to-buffer-other-window
  "!" 'projectile-run-shell-command-in-root
  "&" 'projectile-run-async-shell-command-in-root
  ; "p g a" 'helm-projectile-ag
  "g r" 'projectile-ripgrep
  ; "p g k" 'helm-projectile-ack
  "g g" 'projectile-grep
  ;; Frames
)

(which-key-add-keymap-based-replacements
  js/projectile-prefix "g" "Project Search")

(provide 'prefix/projectile)
