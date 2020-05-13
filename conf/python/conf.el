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

(use-package elpy
  :init
  (elpy-enable))

(use-package python
  :config
  (setq
   ;; python-shell-interpreter "ipython"
   ;; python-shell-interpreter-args "--simple-prompt -i"
   python-indent-offset 4)
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
