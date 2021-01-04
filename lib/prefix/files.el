;;; -*- lexical-binding: t; -*-

(general-define-key
 :prefix-command 'js/files-command
 :prefix-map 'js/files-prefix
  "f" 'find-file
  "j" 'dired-jump
  "J" 'dired-jump-other-window
  "o" 'find-file-other-window 
  "d" 'dired
  "D" 'dired-other-window
  "r" 'recentf-open-files
  "s" 'save-buffer
  "S" 'evil-write-all
 )


(provide 'prefix/files)
