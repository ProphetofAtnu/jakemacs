;;; -*- lexical-binding: t; -*-

(general-define-key
 :prefix-command 'js/jump-command
 :prefix-map 'js/jump-prefix
 "j" 'avy-goto-symbol-1
 "l" 'avy-goto-line
 "r" 'jump-to-register
 )


(provide 'prefix/jump)
