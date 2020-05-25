;;; -*- lexical-binding: t; -*-

(use-package luarocks)

(use-package lua-mode)

(use-package company-lua
  :init
  (defun my-lua-mode-company-init ()
    (setq-local company-backends '((company-lua
                                    company-capf
                                    company-etags
                                    company-dabbrev-code
                                    company-yasnippet))))
  (add-hook 'lua-mode-hook #'my-lua-mode-company-init))


;; (use-package lsp
;;   :init
;;   (setq lsp-clients-emmy-lua-jar-path (expand-file-name "EmmyLua-LS-all.jar" user-cache-dir)))
