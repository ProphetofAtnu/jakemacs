;;; -*- lexical-binding: t; -*-

(general-define-key
 :prefix-command 'js/insert-command
 :prefix-map 'js/insert-prefix
 "n" 'yas-new-snippet
 "i" 'yas-insert-snippet
 )


(provide 'prefix/insert)
