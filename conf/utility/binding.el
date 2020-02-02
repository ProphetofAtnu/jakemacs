;;; -*- lexical-binding: t; -*-

(defun js/ggtags-enable-and-update ()
  "Enable and setup ggtags.")

(leader-minor-def
  "'" '(:ignore t :wk "gtags")
  "' t" 'ggtags-mode)

(add-hook 'ggtags-mode-hook
          '(lambda () 
             (leader-minor-def
               :keymaps '(local)
               "' u" 'helm-gtags-update-tags
               "' p" 'helm-gtags-parse-file
               "' C" 'helm-gtags-create-tags
               "' f" 'helm-gtags-find-tag
               "' '" 'helm-gtags-dwim
               "' n" 'helm-gtags-next-history 
               "' p" 'helm-gtags-previous-history
               "' s" 'helm-gtags-select
               "' d" 'helm-gtags-find-tag
               "' D" 'helm-gtags-find-tag-other-window)))


(leader-primary-def
  :keymaps 'override
  "f z z" 'fzf
  "f z d" 'fzf-directory
  "f z g" 'fzf-git-files
  "f z p" 'fzf-projectile)

(leader-tert-def
  :keymaps 'override
  "p" 'list-processes)

(general-define-key
 :states '(normal visual motion)
 :keymaps '(process-menu-mode-map)
 :major-mode t
 "x" 'process-menu-delete-process)
