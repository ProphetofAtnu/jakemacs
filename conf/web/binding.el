;;; -*- lexical-binding: t; -*-

;; (general-define-key
;;  :keymaps 'css-mode-map
 ;; [return] 'js/maybe-pretty-brackets)

(leader-minor-def
  :keymaps 'css-mode-map
  :major-mode t
  "c" 'css-comb
  "k" 'css-lookup-symbol
  "h" 'css-helper-explain
  "=" 'prettier-js)
