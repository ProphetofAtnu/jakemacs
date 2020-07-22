;;; -*- lexical-binding: t; -*-

(leader-minor-def
  :keymaps 'dart-mode-map
  :major-modes t
  "," 'lsp-dart-show-outline
  "." 'lsp-dart-show-flutter-outline
  "=" 'dart-server-format
  "g" 'dart-server-goto
  ;; Lsp generic
  "G" 'lsp-find-definition
  "f" 'lsp-find-references
  "F" 'dart-server-find-refs
  "t" 'lsp-goto-type-definition
  "i" 'lsp-goto-implementation
  "k" 'lsp-describe-thing-at-point
  "q" 'lsp-workspace-restart
  "Q" 'lsp-disconnect
  "v" 'lsp-describe-session
  "V" 'lsp-diagnose
  "r" 'lsp-rename
  ;; flutter
  "c" '(:ignore t :wk "Flutter")
  "c c" 'flutter-run-or-hot-reload
  "c C" 'flutter-run
  "c r" 'flutter-hot-reload
  "c R" 'flutter-hot-restart
  "c i" 'flutter-inspector
  "x l" 'flutter-layers
  "c h" 'flutter-help
  "c x" 'flutter-test-all
  "c X" 'flutter-test-all
  "c o" 'flutter-operating-systems
  "c t" 'flutter-rendering-tree
  "c w" 'flutter-widget-hierarchy
  "c e" 'flutter-timeline-events
  "c d" 'flutter-detatch
  "c q" 'flutter-quit
  "x" '(:ignore t :wk "Hover")
  "x x" 'hover-run-or-hot-reload
  "x X" 'hover-run
  "x r" 'hover-hot-reload
  "x R" 'hover-hot-restart
  "x i" 'hover-inspector
  "x l" 'hover-layers
  "x h" 'hover-help
  "x o" 'hover-operating-systems
  "x t" 'hover-rendering-tree
  "x w" 'hover-widget-hierarchy
  "x e" 'hover-timeline-events
  "x d" 'hover-detatch
  "x q" 'hover-quit
  )
        
