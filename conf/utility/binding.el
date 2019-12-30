;;; -*- lexical-binding: t; -*-

(defun js/ggtags-enable-and-update ()
  "Enable and setup ggtags.")

(leader-minor-def
  "'" '(:ignore t :wk "gtags")
  "' t" 'ggtags-mode)
