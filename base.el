;;; -*- lexical-binding: t; -*-
;; Base packages/global packages
(use-package recentf
  :init (progn
          (setq recentf-save-file (concat-path user-cache-dir "recentf"))
          (recentf-mode)))

(use-package evil
  :defer .1
  :init
  (setq evil-search-module 'evil-search)
  (setq evil-want-integration nil)
  (setq evil-want-keybinding nil)
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

(use-package evil-org
  :hook (org-mode . evil-org-mode)
  :after org
  :config
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar)))

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
      [remap help-key-description] 'helpful-key)))

(use-package which-key
  :defer t
  :after general
  :delight
  :init
  (which-key-mode 1))

(use-package restart-emacs
  :commands (restart-emacs))

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
  (progn
    (general-define-key
     :keymap 'company-mode-map
     "TAB" #'company-indent-or-complete-common)))

(use-package helm
  :defer t
  :init
  (helm-mode 1)
  (helm-adaptive-mode 1)
  :delight
  :config
  (setq helm-adaptive-history-file (expand-file-name "helm-adaptive" user-cache-dir))
  (setq helm-M-x-fuzzy-match t)
  (setq helm-autoresize-mode t)
  (setq helm-window-prefer-horizontal-split t)
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
  :commands helm-swoop)

(use-package helm-rg
  :commands helm-rg)

(use-package eyebrowse
  :config
  (eyebrowse-mode t)
  (setq eyebrowse-new-workspace t)
  (general-defs '(normal visual motion)
    "g n" nil
    "g n" 'eyebrowse-create-window-config
    "g z" 'eyebrowse-close-window-config
    "g t" 'eyebrowse-next-window-config
    "g T" 'eyebrowse-prev-window-config
    "M-1" 'eyebrowse-switch-to-window-config-1
    "M-2" 'eyebrowse-switch-to-window-config-2
    "M-3" 'eyebrowse-switch-to-window-config-3
    "M-4" 'eyebrowse-switch-to-window-config-4
    "M-5" 'eyebrowse-switch-to-window-config-5
    "M-6" 'eyebrowse-switch-to-window-config-6
    "M-7" 'eyebrowse-switch-to-window-config-7
    "M-8" 'eyebrowse-switch-to-window-config-8
    "M-9" 'eyebrowse-switch-to-window-config-9
    "M-0" 'eyebrowse-switch-to-window-config-0
    "g TAB" 'eyebrowse-last-window-config
    ))

(use-package projectile
  :config
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
