;; Base packages/global packages
(require 'use-package)
(require 'auto-minor-mode)

(use-package recentf
  :init (setq recentf-save-file (concat-path user-cache-dir "recentf"))
  :config (recentf-mode))

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
  (evil-define-key 'normal global-map "s" 'evil-surround-edit)
  (evil-define-key 'normal global-map "S" 'evil-surround-edit)
  (evil-define-key 'operator global-map "s" 'evil-surround-edit)
  (evil-define-key 'operator global-map "S" 'evil-surround-edit)
  (evil-define-key 'visual global-map "s" 'evil-surround-region)
  (evil-define-key 'visual global-map "S" 'evil-Surround-region))

(use-package evil-commentary
  :bind (:map evil-normal-state-map
	      ("gc" . evil-commentary)))

;; Autoload before general
(use-package dired
  :commands (dired dired-jump))

(use-package general
  :init
  (load "~/.emacs.d/bindings.el"))

(use-package which-key
  :defer t
  :after general
  :init
  (which-key-mode 1))

(use-package restart-emacs
  :commands (restart-emacs))

(use-package smartparens
  :init
  (show-smartparens-global-mode 1)
  (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil))

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
  (general-define-key
   :states '(insert emacs)
   :keymaps 'local
   "TAB" #'company-complete-common-or-cycle))


(use-package helm
  :defer t
  :init
  (helm-mode 1)
  (helm-adaptive-mode 1)
  :config
  (setq helm-adaptive-history-file (expand-file-name "helm-adaptive" user-cache-dir))
  (setq helm-M-x-fuzzy-match t)
  (setq helm-autoresize-mode t)
  (setq helm-window-prefer-horizontal-split t)
  (general-define-key
   [remap find-file] #'helm-find-files
   [remap execute-extended-command] #'helm-M-x
   [remap switch-to-buffer] #'helm-buffers-list))
