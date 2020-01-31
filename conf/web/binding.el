;;; -*- lexical-binding: t; -*-

(leader-minor-def
  :keymaps 'css-mode-map
  :major-mode t
  "c" 'css-comb
  "k" 'css-lookup-symbol
  "h" 'css-helper-explain)
