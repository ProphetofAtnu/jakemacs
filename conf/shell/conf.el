;;; -*- lexical-binding: t; -*-

(use-package shell
  :defer t)

(use-package sh-script
  :defer t)

(use-package shell-pop
  :config
  (setq shell-pop-full-span t
        shell-pop-universal-key "C-'")
  (general-defs "C-'" 'shell-pop))

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
                ;; (delq 'pcomplete-completions-at-point completion-at-point-functions)
                ;; (setq-local company-backends '(company-capf
                ;;                                company-files))
                (add-to-list 'company-backends 'company-capf)
                (add-to-list 'company-backends 'company-files)
                (define-key
                  eshell-mode-map [remap eshell-pcomplete]
                  'company-complete-common-or-cycle)
                (company-mode))))

(use-package eshell-z
  :after (eshell))

;; (use-package esh-autosuggest
;;   :hook (eshell-mode . esh-autosuggest-mode))
