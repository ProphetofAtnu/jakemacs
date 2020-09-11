;;; -*- lexical-binding: t; -*-


(use-package helm
  :init
  (setq helm-adaptive-history-file (expand-file-name "helm-adaptive" user-cache-dir))
  (setq helm-M-x-fuzzy-match t)
  (setq helm-display-function 'js/helm-display-child-frame)
  ;; (setq helm-window-prefer-horizontal-split t)
  (setq helm-mode-handle-completion-in-region nil)
  (setq helm-display-buffer-width 80)
  (setq helm-display-buffer-reuse-frame t)

  (helm-mode 1)
  (helm-adaptive-mode 1)
  (helm-autoresize-mode 1)
  :delight
  :config
  (general-define-key
   [remap find-file] #'helm-find-files
   [remap execute-extended-command] #'helm-M-x
   [remap bookmark-bmenu-search] #'helm-bookmarks
   [remap recentf-open-files] #'helm-recentf
   [remap switch-to-buffer] #'helm-buffers-list))


;; (use-package helm-posframe
;;   :init
;;   (setq helm-posframe-poshandler 'posframe-poshandler-frame-bottom-center)
;;   (setq helm-posframe-border-width 10)
;;   (setq helm-posframe-size-function
;;         )
;;   (helm-posframe-enable))

(use-package flx)

(use-package helm-flx
  :hook (helm-mode . helm-flx-mode))

(use-package helm-company
  :after (helm company)
  :commands (helm-company))

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

(use-package helm-projectile
  :after (projectile)
  :config
  (helm-projectile-on))

(defun *-popwin-help-mode-off ()
  "Turn `popwin-mode' off for *Help* buffers."
  (when (boundp 'popwin:special-display-config)
    (customize-set-variable 'popwin:special-display-config
                            (delq 'help-mode popwin:special-display-config))))

(defun *-popwin-help-mode-on ()
  "Turn `popwin-mode' on for *Help* buffers."
  (when (boundp 'popwin:special-display-config)
    (customize-set-variable 'popwin:special-display-config
                            (add-to-list 'popwin:special-display-config 'help-mode nil #'eq))))

(add-hook 'helm-minibuffer-set-up-hook #'*-popwin-help-mode-off)
(add-hook 'helm-cleanup-hook #'*-popwin-help-mode-on)

