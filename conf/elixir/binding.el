;;; -*- lexical-binding: t; -*-

(leader-minor-def 'elixir-mode-map
  
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



  ;; "," 'mix-execute-task

  ;; "'" 'js/pop-to-iex
  ;; "?" 'elixir-mode-open-docs-stable

  ;; "c" 'mix-compile
  ;; "r" 'mix-last-command
  ;; "t" '(:ignore t :wk "Test...")
  ;; "t t" 'mix-test
  ;; "t b" 'mix-test-current-buffer
  ;; "t c" 'mix-test-current-test
  )

