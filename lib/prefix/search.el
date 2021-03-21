;;; -*- lexical-binding: t; -*-
(general-define-key
 :prefix-command 'js/search-command
 :prefix-map 'js/search-prefix
  "o" 'occur
  "r" 'query-replace
  "c" 'evil-ex-nohighlight
  "e" 'iedit-mode
 )


(provide 'prefix/search)
