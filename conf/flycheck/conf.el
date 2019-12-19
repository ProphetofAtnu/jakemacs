;;; -*- lexical-binding: t; -*-

(use-package flycheck
  :defer t
  :config
  (setq flycheck-check-syntax-automatically '(save idle-change)
        flycheck-idle-change-delay 2))


