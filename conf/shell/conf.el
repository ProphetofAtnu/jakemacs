;;; -*- lexical-binding: t; -*-

(use-package shell
  :defer t)

(use-package sh-script)

(use-package shell-pop
  :config
  (setq shell-pop-full-span t
        shell-pop-universal-key "C-'")
  (general-defs "C-'" 'shell-pop))

(use-package xterm-color
  :demand t
  :config
  (setq comint-output-filter-functions
        (remove 'ansi-color-process-output comint-output-filter-functions))

  (add-hook 'comint-mode-hook
            (lambda ()
              ;; Disable font-locking in this buffer to improve performance
              (font-lock-mode -1)
              ;; Prevent font-locking from being re-enabled in this buffer
              (make-local-variable 'font-lock-function)
              (setq font-lock-function (lambda (_) nil))
              (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t))))

;; Also set TERM accordingly (xterm-256color) in the shell itself.

(use-package comint
  :config
  (setq comint-terminfo-terminal "xterm"
        comint-highlight-input nil))

(use-package vterm
  :config
  (general-defs 'js/inferior-shell-prefix-map
    "v" 'vterm
    "C-v" 'vterm-other-window)
  (defun js/vterm-reset-cursor-evil-hook ()
    (interactive)
    (add-hook 'evil-insert-state-entry-hook 'vterm-reset-cursor-point nil t))
  (add-hook 'vterm-mode-hook 'js/vterm-reset-cursor-evil-hook))

(use-package multi-vterm
  :general (:keymaps 'js/utility-prefix
            "'" 'multi-vterm-dedicated-toggle
            "v" 'multi-vterm)
  :config
  ;; (general-defs 'js/utility-prefix
  ;;   "'" 'multi-vterm-dedicated-toggle
  ;;   "v" 'multi-vterm)
  (add-to-list 'purpose-x-popwin-buffer-name-regexps "\\*vterminal.*dedicated\\*")
  (purpose-x-popwin-update-conf))


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
  ;; (require 'pcomplete-extension)
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
               (setq-local company-minimum-prefix-length 3)
               (company-mode))))

(use-package eshell-z
  :after (eshell))

(use-package native-complete
  :commands (native-complete-at-point
             native-complete-setup-bash)
  :init
  (native-complete-setup-bash)
  (add-to-list 'native-complete-style-regex-alist '("[a-zA-Z]+:.*\$" . bash))
  )
