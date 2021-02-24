;;; -*- lexical-binding: t; -*-

(use-package ibuffer) 

(use-package calendar
  :defer t
  :after '(window-purpose)
  :config
  (with-eval-after-load "window-purpose"
    (add-to-list 'purpose-x-popwin-major-modes 'calendar-mode)
    (purpose-x-popwin-update-conf))
  )

(use-package tramp)

(use-package counsel-tramp)
