;;; -*- lexical-binding: t; -*-

(use-package treemacs
  :init
  (add-to-list 'evil-motion-state-modes 'treemacs-mode)
  (setq treemacs-width 25))

(use-package treemacs-evil)

(use-package treemacs-projectile)

(use-package projectile
  :config
  (add-hook 'projectile-after-switch-project-hook 'js/treemacs-sync-project))
