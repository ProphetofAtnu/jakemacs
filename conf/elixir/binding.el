;;; -*- lexical-binding: t; -*-

(leader-minor-def 'elixir-mode-map
  "," 'mix-execute-task

  "'" 'js/pop-to-iex
  "=" 'elixir-format
  "?" 'elixir-mode-open-docs-stable

  "c" 'mix-compile
  "r" 'mix-last-command
  "t" '(:ignore t :wk "Test...")
  "t t" 'mix-test
  "t b" 'mix-test-current-buffer
  "t c" 'mix-test-current-test
  )

