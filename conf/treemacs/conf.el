;;; -*- lexical-binding: t; -*-

(use-package treemacs
  :init
  (add-to-list 'evil-motion-state-modes 'treemacs-mode)
  (setq treemacs-width 25))

(use-package treemacs-evil)

(use-package treemacs-projectile)

;; (use-package treemacs-persp)

(use-package projectile)
