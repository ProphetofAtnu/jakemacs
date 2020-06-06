;;; -*- lexical-binding: t; -*-

(require 'use-package)
(require 'auto-install)
(require 'load-relative)

(setq no-littering-etc-directory (expand-file-name "nletc" user-cache-dir)
      no-littering-var-directory (expand-file-name "nlvar" user-cache-dir))

(require 'no-littering)

(with-eval-after-load 'recentf
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory))

(provide 'early/early-config)
