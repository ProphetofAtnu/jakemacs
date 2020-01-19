;;; -*- lexical-binding: t; -*-

(use-package shell
  :defer t
  :config
  (setq shell-file-name "/bin/bash"
        explicit-shell-file-name "/bin/bash"))

(use-package sh-script
  :defer t)

(use-package company
  :defer t
  :config
  (add-hook 'sh-mode '(lambda ()
                        (add-to-list
                         (make-local-variable 'company-backends) 'company-shell)))
  (add-hook 'shell-mode-hook
            '(lambda ()
               ;; (add-to-list (make-local-variable 'company-backends) 'company-shell)
               (general-define-key :keymaps '(shell-mode-map)
                                   "TAB" 'company-complete)
               (setq-local company-frontends '(company-preview-frontend))
               (company-mode)))
  )

(use-package bash-completion
  :commands (bash-completion-dynamic-complete
             bash-completion-setup)
  :hook (shell-mode . bash-completion-setup))

(use-package company-shell
  :commands (company-shell))

;; (when (and (executable-find "fish")
;;            (require 'fish-completion nil t))
;;   (setq fish-completion-fallback-on-bash-p t)
;;   (global-fish-completion-mode))

(use-package purpose
  :defer t
  :config
  (add-to-list 'purpose-x-popwin-major-modes
               'shell-mode)
  (purpose-x-popwin-update-conf)
  )

(use-package shelldoc
  :commands (shelldoc-minor-mode
             shelldoc-toggle-doc-window)
  :hook (shell-mode . shelldoc-minor-mode)
  )
