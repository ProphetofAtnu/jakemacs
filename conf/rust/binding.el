;;; -*- lexical-binding: t; -*-

'rustic-rustfix

  (leader-minor-def
  :keymaps '(rustic-mode)

  "=" 'rustic-format-buffer
  "+" 'rustic-cargo-fmt
  "o" 'rustic-cargo-outdated
  "d" 'rustic-docstring-dwim
  "k" 'rustic-racer-describe
  "f" 'rustic-cargo-clippy
  "t" 'rustic-cargo-test
  "x" 'rustic-cargo-run
  "F" 'rustic-cargo-check
  "B" 'rustic-recompile
  "b" 'rustic-compile
  "," 'rustic-popup)
