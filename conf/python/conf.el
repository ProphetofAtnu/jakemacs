;;; -*- lexical-binding: t; -*-

;; (use-package anaconda-mode
;;   :commands (anaconda-mode)
;;   :hook (python-mode . anaconda-mode)
;;   :config
;;   (setq anaconda-mode-installation-directory
;;         (expand-file-name "anaconda-mode" user-cache-dir)))

;; (use-package company-anaconda
;;   :config
;;   (add-hook 'anaconda-mode-hook
;;             '(lambda ()
;;                (add-to-list (make-local-variable 'company-backends)
;;                             'company-anaconda))))

;; (use-package python
;;   :config)

;; (defvar js/use-elpy t)

;; (use-package elpy
;;   :init
;;   (elpy-enable)
;;   :config
;;   ;; (load "elpy")
;;   ;; (load "elpy-rpc")
;;   ;; (load "elpy-shell")
;;   ;; (load "elpy-profile")
;;   ;; (load "elpy-refactor")
;;   ;; (load "elpy-django")
;;   (require 'elpy-shell)
;;   (require 'elpy-rpc)
;;   (require 'elpy-profile)
;;   (require 'elpy-refactor)
;;   (require 'elpy-django)
;;   (add-to-list
;;    'python-shell-completion-native-disabled-interpreters
;;    "python3"))

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))  ; or lsp-deferred
(use-package python
  :init
  (setq python-shell-interpreter "python"
        python-shell-interpreter-args "-i"
        python-shell-prompt-detect-failure-warning nil)
  :config
  (add-to-list
   'python-shell-completion-native-disabled-interpreters
   "jupyter")
  )

(use-package counsel-pydoc
  :commands (counsel-pydoc))

(use-package yapfify
  :commands (yapfify-buffer
             yapfify-region
             yapfify-region-or-buffer))

(use-package live-py-mode
  :commands (live-py-mode))

(use-package flycheck
  :init
  (add-hook 'python-mode-hook 'flycheck-mode-on-safe))

;; (use-package anaconda-mode
;;   :hook (python-mode . anaconda-mode))



(use-package jupyter
  :config
  (add-hook 'jupyter-repl-mode-hook
            #'(lambda ()
                (setq-local evil-lookup-func 'jupyter-inspect-at-point))))
