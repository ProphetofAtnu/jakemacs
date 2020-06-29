;;; -*- lexical-binding: t; -*-

(use-package dart-mode)

(use-package lsp-mode)

(use-package lsp-dart
  :hook (dart-mode . lsp)
  :init
  (setq lsp-dart-sdk-dir
        (expand-file-name
         "~/git/install/flutter/bin/cache/dart-sdk")))

(use-package flutter)

(use-package hover)
