;;; -*- lexical-binding: t; -*-

(general-define-key
 :prefix-command 'js/register-command
 :prefix-map 'js/register-prefix
 "SPC" 'point-to-register
 "v" 'view-register
 "r" 'jump-to-register
 "+" 'increment-register
 "p" 'prepend-to-register
 "M" 'bookmark-set-no-overwrite
 "U" 'undo-tree-restore-state-from-register
 "b" 'bookmark-jump
 "f" 'frameset-to-register
 "g" 'insert-register
 "i" 'insert-register
 "j" 'jump-to-register
 "l" 'bookmark-bmenu-list
 "m" 'bookmark-set
 "n" 'number-to-register
 "s" 'copy-to-register
 "u" 'undo-tree-save-state-to-register
 "w" 'window-configuration-to-register
 "x" 'copy-to-register

 "C-o" 'open-rectangle
 "C-r" 'copy-rectangle-to-register
 "C-y" 'yank-rectangle
 "C-w" 'copy-rectangle-as-kill
 "C-t" 'string-rectangle
 "C-k" 'kill-rectangle
 "C-c" 'clear-rectangle
 "C-n" 'rectangle-number-lines
 "C-d" 'delete-rectangle)

(with-eval-after-load "ivy"
  (general-defs 'js/register-prefix
    "." 'counsel-register))

(provide 'prefix/register)
