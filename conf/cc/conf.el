;;; -*- lexical-binding: t; -*-


(use-package lsp
  :init
  (add-hook 'c++-mode-hook 'lsp))

(use-package ccls
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

(use-package modern-cpp-font-lock
  :hook (c++mode . modern-cpp-font-lock-mode))

(use-package cpp-auto-include)

(use-package company-c-headers
  :commands (company-c-headers))

(use-package company-ctags
  :commands (company-ctags))

(use-package clang-format+)

(use-package xcscope)
