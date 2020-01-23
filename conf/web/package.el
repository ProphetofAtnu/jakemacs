;;; -*- lexical-binding: t; -*-

(straight-use-package 'web-mode)
(straight-use-package 'mmm-mode)
(straight-use-package 'css-mode)
(straight-use-package 'emmet-mode)
(straight-use-package 'prettier-js)

;; Tentatively installed. Will config as needed.
(straight-use-package 'pug-mode)
(straight-use-package 'sass-mode)
(straight-use-package 'stylus-mode)
(straight-use-package 'sws-mode)


(when (featurep 'ivy)
  (straight-use-package
   'counsel-css))

(when (featurep 'helm)
  (straight-use-package
   'helm-css-scss))
