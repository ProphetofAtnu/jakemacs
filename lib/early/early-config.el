;;; -*- lexical-binding: t; -*-

(require 'use-package)
(require 'auto-install)
(require 'load-relative)

(require 'no-littering)

(with-eval-after-load 'recentf
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory))

(provide 'early/early-config)
