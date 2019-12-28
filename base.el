;;; -*- lexical-binding: t; -*-
;; Base packages/global packages
(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

;; For internal libs
(use-package save-sexp)

;; Used in a ton of packages
(use-package posframe)

(use-package recentf
  :init (progn
          (setq recentf-save-file (concat-path user-cache-dir "recentf"))
          (recentf-mode)))

(setq evil-want-integration t)
(setq evil-want-keybinding nil)

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
  (setq hydra-hint-display-type 'posframe))

(use-package general
  :init
  (load (concat-path user-emacs-directory "conf/global/bindings")))

(use-package helpful
  :init
  (progn
    (general-defs
      [remap describe-function] 'helpful-callable
      [remap describe-variable] 'helpful-variable
      [remap apropos] 'helpful-symbol
      [remap describe-symbol-at-point] 'helpful-at-point
      [remap describe-key] 'helpful-key)))

(use-package which-key
  :defer t
  :after general
  :delight
  :init
  (which-key-mode 1)
  (which-key-setup-minibuffer)
  )

;; ##QUARENTINED##
;; (use-package which-key-posframe
;;   :config (setq which-key-posframe-poshandler
;;                 'posframe-poshandler-frame-bottom-center)
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
    (general-defs
      :keymaps 'dired-mode-map
      "-" 'dired-up-directory)))

(use-package dired+
  :init
  (setq diredp-hide-details-initially-flag nil)
  :config 
  (progn
    (diredp-toggle-find-file-reuse-dir 1)))


(use-package smartparens
  :delight
  :init
  (progn
    (use-package smartparens-config)
    (use-package smartparens-html)
    (smartparens-global-mode 1)
    (show-smartparens-global-mode 1))
  :config
  (progn
    (sp-local-pair 'emacs-lisp-mode "`" nil :when '(sp-in-string-p))))

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
        (company-abbrev company-dabbrev))))

(use-package yasnippet
  :defer t
  :config
  (yas-global-mode))

(use-package swiper
  :commands (swiper))

(use-package helm
  :init
  (setq helm-adaptive-history-file (expand-file-name "helm-adaptive" user-cache-dir))
  (setq helm-M-x-fuzzy-match t)
  (setq helm-display-function 'helm-display-buffer-in-own-frame)
  (setq helm-autoresize-mode t)
  (setq helm-display-buffer-reuse-frame t)
  (setq helm-window-prefer-horizontal-split t)
  (setq helm-mode-handle-completion-in-region nil)
  (helm-mode 1)
  (helm-adaptive-mode 1)
  :delight
  :config
  (general-define-key
   [remap find-file] #'helm-find-files
   [remap execute-extended-command] #'helm-M-x
   [remap bookmark-bmenu-search] #'helm-bookmarks
   [remap recentf-open-files] #'helm-recentf
   [remap switch-to-buffer] #'helm-buffers-list))

(use-package helm-company
  :after (helm company))

(use-package helm-descbinds
  :after (helm))

(use-package helm-describe-modes
  :after (helm))

(use-package helm-mode-manager
  :after (helm))

(use-package helm-swoop
  :commands helm-swoop
  :config
  (setq helm-swoop-fontify-buffer-size-limit 'always))

(use-package helm-rg
  :commands helm-rg)

(use-package eyebrowse
  :config
  (eyebrowse-mode t)
  (setq eyebrowse-new-workspace t))

(use-package helm-projectile
  :after (projectile)
  :config
  (helm-projectile-on))

(use-package projectile
  :delight
  :config
  (setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-dir))
  (projectile-mode))

(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "Ahoy!"
        dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5)))
  (dashboard-setup-startup-hook))

(use-package eshell-prompt-extras
  :after (eshell)
  :commands (epe-theme-lambda)
  :init
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

(use-package eshell-z
  :after (eshell))
