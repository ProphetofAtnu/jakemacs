;;; -*- lexical-binding: t; -*-
;; Base packages/global packages
;; For internal libs
(require 'better-defaults)
(require 'delight)
(require 'use-package)
(require 'auto-minor-mode)
(require 'load-relative)
(require 'mode-local)
(require 'async)

(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

(use-package save-sexp)
;; Used in a ton of packages
(use-package posframe)

(use-package recentf
  :init (progn
          (setq recentf-save-file (concat-path user-cache-dir "recentf"))
          (recentf-mode)))

(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(defvar evil-disable-insert-state-bindings t)

(use-package evil
  :init
  (setq evil-search-module 'evil-search)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-goggles
  :delight
  :config
  (evil-goggles-use-diff-faces)
  (evil-goggles-mode))

(use-package evil-surround
  :commands
  (evil-surround-edit
   evil-Surround-edit
   evil-surround-region
   evil-Surround-region)
  :init
  (evil-define-key 'operator global-map "s" 'evil-surround-edit)
  (evil-define-key 'operator global-map "S" 'evil-surround-edit)
  (evil-define-key 'visual global-map "s" 'evil-surround-region)
  (evil-define-key 'visual global-map "S" 'evil-Surround-region))

(use-package evil-commentary
  :bind
  (:map evil-normal-state-map)
  ("gc" . evil-commentary))

(use-package discover-my-major
  :commands (discover-my-major discover-my-mode))

(use-package hydra
  :config
  (setq hydra-hint-display-type 'posframe)
  (plist-put hydra-posframe-show-params :poshandler 'posframe-poshandler-frame-bottom-center))

(use-package general
  :init
  (load (concat-path user-emacs-directory "conf/global/bindings")))

(use-package window-purpose
  :config
  (purpose-mode 1)
  (purpose-x-popwin-setup)
  (purpose-x-magit-multi-on)
  ;; (purpose-x-popwin-update-conf)
  ;;(purpose-x-popupify-purpose 'info 'purpose-display-at-right)
  )

(use-package helpful
  :init
  ;;(purpose-add-user-purposes :modes '((helpful-mode . info)))
  ;; (add-to-list 'purpose-x-popwin-major-modes 'helpful-mode)
  ;;(purpose-compile-user-configuration)
  ;;(purpose-x-popwin-update-conf)
  (progn
    (general-defs
      [remap describe-function] 'helpful-callable
      [remap describe-variable] 'helpful-variable
      [remap apropos] 'helpful-symbol
      [remap describe-symbol-at-point] 'helpful-at-point
      [remap describe-key] 'helpful-key))
  :config
  (with-eval-after-load 'window-purpose
    (add-to-list 'purpose-x-popwin-major-modes 'helpful-mode)
    (purpose-x-popwin-update-conf)))

(use-package which-key
  :defer t
  :after general
  :delight
  :init
  (which-key-mode 1)
  (which-key-setup-side-window-bottom)
  )

;; (use-package which-key-posframe
;;   :init
;;   (setq which-key-posframe-poshandler 'posframe-poshandler-frame-bottom-center
;;         which-key-posframe-border-width 1)
;;   :config 
;;   (set-face-attribute 'which-key-posframe-border nil :background "LightSlateBlue")
;;   (which-key-posframe-mode))

(use-package restart-emacs
  :commands (restart-emacs))

(use-package eval-sexp-fu
  :config
  (turn-on-eval-sexp-fu-flash-mode))

(use-package dired
  :hook (dired-mode . auto-revert-mode)
  :config
  (progn
    (dired-async-mode)
    (general-defs
      :keymaps 'dired-mode-map
      "-" 'dired-up-directory)))

(use-package diredfl
  :hook (dired-mode . diredfl-global-mode))

(use-package dired+
  :init
  (setq diredp-hide-details-initially-flag nil)
  :config 
  (progn
    (diredp-toggle-find-file-reuse-dir 1)))


;; (use-package smartparens
;;   :delight
;;   :init
;;   (progn
;;     (use-package smartparens-config)
;;     (use-package smartparens-html)
;;     (smartparens-global-mode 1)
;;     (show-smartparens-global-mode 1))
;;   :config
;;   (progn
;;     (sp-local-pair 'emacs-lisp-mode "`" nil :when '(sp-in-string-p))))

(use-package elec-pair
  :config
  (electric-pair-mode +1))

(use-package undo-tree
  :delight)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package company
  :commands (company-mode)
  :init
  (setq company-idle-delay 0.2)
  :hook
  (prog-mode . company-mode)
  (comint-mode . company-mode)
  :config
  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf
           company-yasnippet)
          (company-abbrev company-dabbrev)))
  (general-defs 'company-active-map
    "C-n" 'company-select-next
    "C-p" 'company-select-previous
    "<escape>" 'company-abort
    "<return>" 'company-complete-selection
    "SPC" '(lambda ()
             (interactive)
             (when (company-explicit-action-p)
               (company-complete-selection))
             (unless (looking-back "[[:blank:]]")
               (self-insert-command 1)))))

;; (use-package semantic
;;   :commands (semantic-mode)
;;   :init
;;   (setq semantic-default-submodes
;;     '(;; Default
;;       global-semantic-idle-scheduler-mode
;;       global-semanticdb-minor-mode
;;       ;; Aux
;;       global-semantic-idle-summary-mode
;;       ;; global-semantic-idle-completions-mode
;;       global-semantic-decoration-mode
;;       global-semantic-highlight-func-mode
;;       global-semantic-stickyfunc-mode
;;       global-semantic-mru-bookmark-mode))
;;   (semantic-mode)
;;   :config
;;   (add-to-list 'semantic-new-buffer-setup-functions '(emacs-lisp-mode . semantic-default-elisp-setup))
;;   (semantic-idle-scheduler-add 'semanticdb-save-all-db-idle)
;;   ;; (setq semantic-default-submodes enabled-semantic-submodes)
;;   (setq-default semanticdb-find-default-throttle '(local project))
;;   (setq-mode-local emacs-lisp-mode 
;;    semanticdb-find-default-throttle '(local project))
;;   (use-package cedet-global
;;     :commands (cedet-gnu-global-version-check))
;;   (when (cedet-gnu-global-version-check t)
;;     (semanticdb-enable-gnu-global-databases 'c-mode)
;;     (semanticdb-enable-gnu-global-databases 'c++-mode)))

(use-package yasnippet
  :defer t
  :delight
  :config
  (yas-global-mode))

(use-package swiper
  :commands (swiper))

(use-package eyebrowse
  :init
  (setq eyebrowse-new-workspace t)
  :config
  (eyebrowse-init)
  (eyebrowse-mode t)
  (require 'general)
  (general-defs '(normal visual motion)
    "g t" 'eyebrowse-next-window-config
    "g T" 'eyebrowse-prev-window-config
    "g z" 'eyebrowse-close-window-config
    "z x" 'eyebrowse-last-window-config
    "z w" 'eyebrowse-create-window-config))

(use-package window-purpose
  :config
  (purpose-mode 1)
  (purpose-x-popwin-setup)
  (purpose-x-magit-multi-on))

;; (use-package popwin
;;   :config
;;   (popwin-mode 1)
;;   (push '(helpful-mode :noselect t :position left) popwin:special-display-config)
;;   (push '("*Shell Command Output*" :regexp t :noselect t :position right) popwin:special-display-config)
;;   (leader-tert-def
;;     "q" '(:keymap popwin:keymap :which-key "Popwin")))

(use-package projectile
  :delight
  :config
  (setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-dir))
  (projectile-mode)
  )

(use-package magit
  :commands (magit))

(use-package evil-magit
  :hook (magit-mode . evil-magit-init))

(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "Ahoy!"
        dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5)))
  (dashboard-setup-startup-hook))

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
                (add-to-list (make-local-variable 'company-backends) 'company-pcomplete)
                (define-key eshell-mode-map [remap eshell-pcomplete] 'company-complete-common-or-cycle)
                (setq-local company-frontends '(company-preview-frontend))
                (company-mode)))
   )

;; (use-package esh-autosuggest
;;   :hook (eshell-mode . esh-autosuggest-mode))


(use-package eshell-z
  :after (eshell))

(use-package transient
  :defer t
  :init
  (setq
   transient-levels-file (expand-file-name "transient/levels.el" user-cache-dir)
   transient-values-file (expand-file-name "transient/values.el" user-cache-dir)
   transient-history-file (expand-file-name "transient/history.el" user-cache-dir)))

;; Imenu
(use-package imenu
  :demand t)

(with-eval-after-load 'imenu
  (use-package find-where)
  (use-package imenu+)
  (use-package imenu-list)
  (use-package imenu-anywhere))

(provide 'base)
