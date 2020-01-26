;;; -*- lexical-binding: t; -*-
(use-package web-mode
  :commands (web-mode)
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package css-mode)

(use-package emmet-mode
  :hook ((css-mode . emmet-mode)
         (html-mode . emmet-mode)
         (web-mode . emmet-mode)
         (nxml-mode . emmet-mode)
         (rjsx-mode . emmet-mode)))

(use-package prettier-js)

(use-package lsp-html
  :hook ((web-mode . lsp)
         (html-mode . lsp)))

(use-package lsp-css
  :hook (css-mod . lsp))
  
(use-package pug-mode)
(use-package sass-mode)
(use-package sws-mode)
(use-package stylus-mode)
(use-package counsel-css)
