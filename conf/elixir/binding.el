;;; -*- lexical-binding: t; -*-

(leader-minor-def
  :keymaps 'elixir-mode-map
  :major-modes t
  "" 'alchemist-mode-keymap 
  "f" '(:ignore t :wk "Info")
  "v" '(:ignore t :wk "Eval")
  "i" '(:ignore t :wk "IEx")
  "p" '(:ignore t :wk "Project")
  "h" '(:ignore t :wk "Help")
  "e" '(:ignore t :wk "Execute")
  "c" '(:ignore t :wk "Compile")
  "o" '(:ignore t :wk "Macroexpand")
  "m" '(:ignore t :wk "Mix")
  "m t" '(:ignore t :wk "Test")
  "X" '(:ignore t :wk "Hex")
  "=" 'elixir-format
  )

