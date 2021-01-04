;;; -*- lexical-binding: t; -*-

(require 'winner)
(require 'general)

(general-define-key
 :prefix-command 'js/layout-command
 :prefix-map 'js/layout-prefix
 "," 'winner-undo
 "." 'winner-redo
 )

(provide 'prefix/layout)
