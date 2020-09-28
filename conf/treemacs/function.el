;;; -*- lexical-binding: t; -*-

(defun js/treemacs-sync-project ()
  "Sync the project with the current workspace"
  (interactive)
  (when-let ((project (projectile-project-p default-directory)))
    (save-window-excursion 
      (treemacs-display-current-project-exclusively))))
