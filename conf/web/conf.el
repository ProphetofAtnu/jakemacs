;;; -*- lexical-binding: t; -*-
(require 'after/company-after)

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
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  :config
  (smartparens-mode -1))

(use-package css-mode
  :defer t
  :config
  (dash-docs-activate-docset "CSS"))

(use-package css-eldoc
  :config
  (css-eldoc-enable)
  (add-hook 'scss-mode-hook #'turn-on-css-eldoc))

(use-package html-mode
  :defer t
  :config
  (dash-docs-activate-docset "HTML"))

(use-package tagedit
  :defer t
  :config
  (progn
    ;; (tagedit-add-experimental-features)
    (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

(use-package emmet-mode
  :delight " </> "
  :hook ((css-mode . emmet-mode)
         (html-mode . emmet-mode)
         (web-mode . emmet-mode)
         (nxml-mode . emmet-mode)
         (rjsx-mode . emmet-mode))
  :config
  (general-defs 'emmet-mode-keymap
    "<tab>" 'spacemacs/emmet-expand
    "TAB" 'spacemacs/emmet-expand))

(use-package company-web
  :init
  (js/company-localize-backends
   web-mode
   (company-lsp company-web)))

(use-package prettier-js)

(use-package lsp-html
  :hook ((web-mode . lsp)
         (html-mode . lsp)))

;; (use-package lsp-css
;;   :hook (css-mode . lsp))

(use-package css-eldoc
  :commands (css-eldoc-enable)
  :init (css-eldoc-enable))

(use-package pug-mode)

(use-package sass-mode)

(use-package sws-mode)

(use-package stylus-mode)

(use-package counsel-css)
