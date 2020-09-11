;;; -*- lexical-binding: t; -*-

(use-package selectrum
  :init
  (selectrum-mode)
  (selectrum-helm-mode))

(use-package mini-frame
  :init (mini-frame-mode)
  :config
  (setq resize-mini-frames t
        mini-frame-show-parameters
        '((top . 0)
          (width . 1.0)
          (left . 0.5)
          (height . 10))
        ))
