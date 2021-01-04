;;; -*- lexical-binding: t; -*-


(general-define-key
 :prefix-command 'js/buffer-command
 :prefix-map 'js/buffer-prefix
 "b" 'switch-to-buffer
 "i" 'ibuffer
 "o" 'switch-to-buffer-other-window
 "f" 'switch-to-buffer-other-frame
 "d" 'kill-current-buffer
 "D" 'kill-other-buffers
 "r" 'revert-buffer
 "R" 'rename-buffer
 "e" 'ediff-buffers
 "k" 'kill-buffer-and-window
 )


(provide 'prefix/buffer)
