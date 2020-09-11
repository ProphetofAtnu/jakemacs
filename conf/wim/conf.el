;;; -*- lexical-binding: t; -*-

(use-package eyebrowse
  :init
  (setq eyebrowse-new-workspace t
        eyebrowse-wrap-around t)
  :config
  (eyebrowse-init)
  (eyebrowse-mode t))
  ;; (require 'general)
  ;; (general-defs '(normal visual motion)
  ;;   "g t" 'eyebrowse-next-window-config
  ;;   "g T" 'eyebrowse-prev-window-config
  ;;   "g z" 'eyebrowse-close-window-config
  ;;   "z x" 'eyebrowse-last-window-config
  ;;   "z w" 'eyebrowse-create-window-config)

(use-package perspective
  :init
  (persp-mode)
  (require 'window-purpose)
  (purpose-x-persp-setup))

;; (use-package persp-projectile)
