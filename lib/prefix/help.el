;;; -*- lexical-binding: t; -*-

(general-define-key
 :prefix-command 'js/help-command
 :prefix-map 'js/help-prefix
 "v" 'describe-variable
 "f" 'describe-function
 "s" 'helpful-symbol
 "k" 'general-describe-keybindings
 "d" 'discover-my-major
 "D" 'discover-my-mode
 "w" 'which-key-show-keymap
 "," 'which-key-show-major-mode
 )


(provide 'prefix/help)
