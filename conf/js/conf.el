;;; -*- lexical-binding: t; -*-

(defvar js/use-flow t)

(use-package js2-mode
  :mode (("\\.m?js\\'"  . js2-mode)))

;; TODO: add jsx support (React)
(use-package rjsx-mode
  :defer t
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
   (setq-mode-local rjsx-mode
                    js2-mode-show-parse-errors nil
                    js2-mode-show-strict-warnings nil)))


;; (dolist (hook '(rjsx-mode-hook js2-mode-hook))
;;   (add-hook hook
;;             '(lambda ()
;;                (require 'js-doc)
;;                (require 'flycheck)
;;                (require 'js2-refactor)
;;                (add-node-modules-path)
;;                (js/company-js-setup)
;;                (flycheck-mode-on-safe))))

(use-package add-node-modules-path
  :commands (add-node-modules-path))

(use-package nodejs-repl
  :commands (nodejs-repl))

(use-package flow-minor-mode
  :defer t
  :delight
  :commands (flow-minor-mode)
  :hook ((js2-mode . flow-minor-enable-automatically)
         (rjsx-mode . flow-minor-enable-automatically)))

(use-package flow-js2-mode
  :defer t
  :delight
  :commands (flow-js2-mode)
  :hook ((js2-mode . flow-js2-mode)))

(use-package company-flow
  :defer t
  :delight
  :commands (company-flow)
  :config
  (push 'rjsx-mode company-flow-modes))

(use-package flycheck
  :commands (flycheck-mode-on-safe))

(use-package flycheck-flow
  :defer t
  :delight
  :after (flycheck)
  :delight
  :config
  (progn
    ;; Don't run flow if there's no @flow pragma
    (custom-set-variables '(flycheck-javascript-flow-args (quote ("--respect-pragma"))))
    ;; Run flow in rjsx-mode files
    (flycheck-add-mode 'javascript-flow 'rjsx-mode)
    ;; After running js-flow, run js-eslint
    ;; doing this in the other order causes a lot of repeated errors!!!
    (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))
  )

(use-package js2-refactor
  :hook ((rjsx-mode js2-mode) . js2-refactor-mode))

(use-package tern
  :defer t
  :delight
  :config
  (setq tern-command (append tern-command '("--no-port-file"))))

(use-package prettier-js
  :defer t
  :commands (prettier-js prettier-js-mode))

(use-package impatient-mode
  :defer t
  :commands (impatient-mode))

(use-package skewer-mode
  :defer t
  :commands (run-skewer)
  :delight
  :init
  (progn
    (require 'skewer-setup)
    (skewer-setup)))

(use-package livid-mode
  :defer t
  :commands (livid-mode))

(use-package json-mode
  :config
  (use-package json-navigator)
  (use-package json-reformat)
  (use-package json-snatcher))

(use-package eslintd-fix
  :commands (eslintd-fix eslintd-fix-mode))

(dolist (hook '(rjsx-mode-hook js2-mode-hook))
  (add-hook hook
            '(lambda ()
               (require 'js-doc)
               (require 'js2-refactor)
               (require 'nodejs-repl)
               (js/company-js-setup)
               (flycheck-mode-on-safe)
               (add-node-modules-path))))
