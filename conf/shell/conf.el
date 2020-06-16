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
  (add-hook 'sh-mode-hook '(lambda ()
                             (add-to-list
                              ;; (make-local-variable 'company-backends)
                              'company-backends
                              '(company-capf company-shell company-files company-keywords))
                             (company-mode)))
  (add-hook 'shell-mode-hook
            '(lambda ()
               (add-to-list
                ;; (make-local-variable 'company-backends)
		'company-backends
                '(company-capf company-shell company-files company-keywords))
               (general-define-key :keymaps '(shell-mode-map)
                                   "TAB" 'company-complete)
               ;; (setq-local company-frontends '(company-preview-frontend))
               (company-mode)))
  )


(use-package bash-completion
  :commands (bash-completion-dynamic-complete
             bash-completion-setup)
  :hook (shell-mode . bash-completion-setup))

(use-package company-shell
  :commands (company-shell))

(when (and (executable-find "fish")
           (require 'fish-completion nil t))
  (setq fish-completion-fallback-on-bash-p t)
  (global-fish-completion-mode))

;; (use-package company-native-complete
;;   :commands (company-native-complete)
;;   :init
;;   (add-hook 'comint-mode-hook
;;             '(lambda ()
;;                (add-to-list (make-local-variable 'company-backends) 'company-native-complete)))
;;   (add-hook 'shell-mode-hook
;;             '(lambda ()
;;                (add-to-list (make-local-variable 'company-backends) 'company-native-complete))))

(use-package purpose
  :defer t
  :config
  (add-to-list 'purpose-x-popwin-major-modes
               'shell-mode)
  (add-to-list 'purpose-x-popwon-major-modes
               'term-mode)
  (purpose-x-popwin-update-conf))

;; (use-package shelldoc
;;   :commands (shelldoc-minor-mode
;;              shelldoc-toggle-doc-window)
;;   ;; :hook ((shell-mode . shelldoc-minor-mode)
;;   ;;        (shelldoc-minor-mode . shelldoc-toggle-doc-window))
;;   )

;; (use-package shell-pop
;;   :custom
;;   (shell-pop-full-span t)
;;   (shell-pop-shell-type
;;    '("ansi-term" "*ansi-term*"
;;      (lambda nil
;;        (ansi-term shell-pop-term-shell))))
;;   (shell-pop-universal-key "C-'")
;;   :config
;;   (setq shell-pop-term-shell "/bin/bash"
;;         shell-pop-shell-type '("ansi-term" "*ansi-term*"
;;                                (lambda nil
;;                                  (ansi-term shell-pop-term-shell)))
;;         shell-pop-full-span t
;;         shell-pop-universal-key "C-'"))

(use-package eshell-prompt-extras
  :after (eshell)
  :commands (epe-theme-lambda)
  :init
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))



(use-package eshell
  :defer t
  :config
   (setq pcomplete-cycle-completions nil)
   (require 'pcomplete-extension)
   ;; (add-hook 'eshell-mode-hook
   ;;           '(lambda ()
   ;;              (setq-local company-frontends
   ;;                          '(company-preview-frontend))))
   ;; Thanks to spacemacs for this one
   (add-hook 'eshell-after-prompt-hook
             '(lambda
                ()
                (let ((inhibit-field-text-motion t))
                  (add-text-properties
                   (point-at-bol)
                   (point)
                   '(rear-nonsticky t
                                    inhibit-line-move-field-capture t
                                    field output read-only t
                                    front-sticky (field inhibit-line-move-field-capture))))))
   (add-hook 'eshell-mode-hook
             '(lambda ()
                (delq 'pcomplete-completions-at-point completion-at-point-functions)
                (add-to-list 'company-backends 'company-shell)
                (define-key
                  eshell-mode-map [remap eshell-pcomplete]
                  'company-complete-common-or-cycle)
                (company-mode))))

(use-package eshell-z
  :after (eshell))

;; (use-package esh-autosuggest
;;   :hook (eshell-mode . esh-autosuggest-mode))
