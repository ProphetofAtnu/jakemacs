;;; -*- lexical-binding: t; -*-

(general-unbind
  '(c++-mode-map c-mode-base-map)
  ","
  )

(general-defs
  '(insert emacs)
  '(c++-mode c-mode-base-map)
  "," 'c-electric-semi&comma)


(leader-minor-def
  :keymaps 'c++-mode-map
  )

