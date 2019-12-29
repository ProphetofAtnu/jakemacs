;;; -*- lexical-binding: t; -*-

(defun js/ggtags-enable-and-update ()
  "Enable and setup ggtags.")

(leader-tert-def
  "g" '(:ignore t :wk "gtags")
  "g t" 'ggtags-mode)
