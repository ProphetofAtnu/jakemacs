;;; -*- lexical-binding: t; -*-

(defun js/treemacs-sync-project ()
  "Sync the project with the current workspace"
  (interactive)
  (when-let ((project (projectile-project-p default-directory)))
    (save-window-excursion 
      (treemacs-display-current-project-exclusively))))


(defun js/directory-basename (path)
  (let ((dn (directory-file-name path)))
    (car
     (nreverse
      (split-string dn "[\\/]")))))

(defun js/treemacs-project-names (workspace)
  (let ((projects
         (treemacs-workspace->projects
          workspace)))
    (mapcar #'treemacs-project->name projects)))

(defun js/treemacs-clear-current-workspace ()
  (letf ((proj (treemacs-workspace->projects
                (treemacs-current-workspace)))
         (test
          (lambda (proj)
            (treemacs-do-remove-project-from-workspace
             proj
             t))))
    (mapcar test proj)))

(defun js/treemacs-relocate-here ()
  (interactive)
  (js/treemacs-clear-current-workspace)
  (treemacs-add-project default-directory))
