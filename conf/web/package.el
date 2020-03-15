;;; -*- lexical-binding: t; -*-

(straight-use-package 'web-mode)
(straight-use-package 'mmm-mode)
(straight-use-package 'css-mode)
(straight-use-package 'css-helper)
(straight-use-package 'css-comb)
(straight-use-package 'css-eldoc)
(straight-use-package 'emmet-mode)
(straight-use-package 'prettier-js)
(straight-use-package 'company-web)

;; Syntax Highlighting for PHP
(straight-use-package 'php-mode)

;; Tentatively installed. Will config as needed.
(straight-use-package 'pug-mode)
(straight-use-package 'sass-mode)
(straight-use-package 'stylus-mode)
(straight-use-package 'sws-mode)
(straight-use-package 'tagedit)
(straight-use-package 'css-eldoc)

(when (featurep 'ivy)
  (straight-use-package
   'counsel-css))

(when (featurep 'helm)
  (straight-use-package
   'helm-css-scss))
