;;; -*- lexical-binding: t; -*-

(use-package js2-mode
  :mode (("\\.m?js\\'"  . js2-mode))
  :delight
  :init
  (setq js-indent-level 2))

;; TODO: add jsx support (React)
(use-package rjsx-mode
  :defer t
  :delight "REACT"
  :init
  ;; Again, thank you spacemacs. 
  (progn
   (defun +javascript-jsx-file-p ()
     (and buffer-file-name
          (or (equal (file-name-extension buffer-file-name) "js")
              (equal (file-name-extension buffer-file-name) "jsx"))
          (re-search-forward "\\(^\\s-*import React\\|\\( from \\|require(\\)[\"']react\\)"
                             magic-mode-regexp-match-limit t)
          (progn (goto-char (match-beginning 1))
                 (not (spacemacs//react-inside-string-or-comment-q)))))
   (add-to-list 'magic-mode-alist (cons #'+javascript-jsx-file-p 'rjsx-mode))
   ;; This should be an illustration of how fed up I am with
   ;; configuring Javascript crap
   ;; See the react layer funcs.el
   (defun spacemacs/react-emmet-mode ()
     "Activate `emmet-mode' and configure it for local buffer."
     (emmet-mode 1)
     (setq-local emmet-expand-jsx-className? t))
   (add-hook 'rjsx-mode-hook 'spacemacs/react-emmet-mode)
   ;; (add-hook 'rjsx-mode-hook '(lambda ()
   ;;                              (smartparens-mode -1)))
   (setq-mode-local rjsx-mode
                    js2-mode-show-parse-errors nil
                    js2-mode-show-strict-warnings nil)))

(use-package npm)

(use-package add-node-modules-path
  :commands (add-node-modules-path)
  :hook ((js2-mode rjsx-mode typescript-mode) . add-node-modules-path))

(use-package nodejs-repl
  :commands (nodejs-repl))

(use-package flycheck
  :commands (flycheck-mode-on-safe)
  :hook ((js2-mode rjsx-mode typescript-mode) . flycheck-mode-on-safe))

(use-package js2-refactor
  :delight 
  :hook ((rjsx-mode js2-mode) . js2-refactor-mode))

(use-package prettier-js
  :defer t
  :commands (prettier-js prettier-js-mode))

(use-package lsp-mode
  :commands (lsp)
  :init
  (add-hook 'js2-mode-hook 'lsp)
  (add-hook 'rjsx-mode-hook 'lsp)
  (add-hook 'typescript-mode-hook 'lsp)
  :config
  (setq lsp-vetur-use-workspace-dependencies t
        lsp-vetur-format-default-formatter-ts "prettier"
        lsp-typescript-references-code-lens-enabled t
        ;; lsp-typescript-disable-automatic-type-acquisition t
        lsp-typescript-implementations-code-lens-enabled t))

(use-package json-mode
  :config
  (use-package json-navigator)
  (use-package json-reformat)
  (use-package json-snatcher))

(use-package eslintd-fix
  :commands (eslintd-fix eslintd-fix-mode))

(use-package js-doc
  :commands (js-doc-insert-tag
             js-doc-describe-tag
             js-doc-insert-file-doc
             js-doc-insert-function-doc
             js-doc-insert-function-doc-snippet
             js/dash-open-docset-path))

(use-package typescript-mode)


;;;;;;; QUARENTINE
;; (use-package tern
;;   :init
;;   (add-hook 'js2-mode-hook #'tern-mode)
;;   (add-hook 'rjsx-mode-hook #'tern-mode)
;;   :config
;;   (load (expand-file-name "misc/company-tern" user-emacs-directory))
;;   (setq tern-command (append tern-command '("--no-port-file")))
;;   (add-hook 'tern-mode-hook (lambda ()
;;                               (add-to-list (make-local-variable 'company-backends)
;;                                            'company-tern))))

;; (use-package company-tern
;;   :hook (tern-mode . (lambda ()
;;                        (add-to-list
;;                         (make-local-variable
;;                          'company-backends)
;;                         'company-tern))))

;; (use-package impatient-mode
;;   :defer t
;;   :commands (impatient-mode))

;; (use-package skewer-mode
;;   :defer t
;;   :commands (run-skewer)
;;   :delight
;;   :init
;;   (progn
;;     (require 'skewer-setup)
;;     (skewer-setup)))

;; (use-package livid-mode
;;   :defer t
;;   :commands (livid-mode))

;; (use-package tide
;;   :commands (tide-setup)
;;   :delight " ≋ "
;;   :config
;;   (setq tide-completion-detailed t
;;         tide-completion-ignore-case t)
  
;;   :init
;;   (defun setup-tide-mode ()
;;     (interactive)
;;     (unless (and
;;              (featurep 'flow-minor-mode)
;;              (flow-minor-configured-p)
;;              (flow-minor-tag-present-p))
;;         ;; (make-local-variable 'company-backends)
;;         (tide-setup)
;;         (add-to-list 'company-backends 'company-tide)
;;         (flycheck-mode +1)
;;         (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;         (eldoc-mode +1)
;;         (tide-hl-identifier-mode +1)
;;         ;; company is an optional dependency. You have to
;;         ;; install it separately via package-install
;;         ;; `M-x package-install [ret] company`
;;         (company-mode +1))))
;;   ;; (add-hook 'js2-mode-hook 'setup-tide-mode)
;;   ;; (add-hook 'rjsx-mode-hook 'setup-tide-mode)
;;   ;; (add-hook 'typescript-mode-hook 'setup-tide-mode))

;; (use-package web-mode
;;   :init
;;   (define-derived-mode web-tsx-mode web-mode "React-TSX"
;;     "Derived mode from web-mode to make bindings easier"
;;     :syntax-table nil)
;;   (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-tsx-mode))
;;   (add-hook 'web-tsx-mode-hook 'lsp)
;;   (add-hook 'web-tsx-mode-hook
;;             (lambda ()
;;               (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;                 ;; (setup-tide-mode)
;;                 (add-to-list 'company-backends '(company-capf company-web-html))
;;                 (lsp))))
;;   :config
;;   ;; enable typescript-tslint checker
;;   (with-eval-after-load 'tide
;;     (require 'flycheck)
;;     (flycheck-add-mode 'tsx-tide 'web-tsx-mode)
;;     (flycheck-add-mode 'typescript-tide 'web-tsx-mode)
;;     (flycheck-add-mode 'javascript-eslint 'web-tsx-mode)))

;; (use-package indium
;;   :init
;;   (add-hook 'indium-interaction-mode-hook '(lambda ()
;;                                              (tide-mode 0)
;;                                              (tide-hl-identifier-mode 0)))
;;   (setq
;;    indium-chrome-executable "google-chrome"
;;    indium-chrome-use-temporary-profile nil
;;    indium-chrome-data-dir (expand-file-name "indium-profile" user-cache-dir) )
;;   )
