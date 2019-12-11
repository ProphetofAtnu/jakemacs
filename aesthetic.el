;; (use-package powerline
;;   :init
;;   (powerline-default-theme))

;; (use-package moe-theme
;;   :init
;;   (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0)
;; 	moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0)
;; 	moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))
;;   :config
;;   (progn
;;     (moe-dark)))

(use-package doom-modeline
  :commands (doom-modeline-mode)
  :init (doom-modeline-mode))

(use-package cyberpunk-theme
  :init
  (load-theme 'cyberpunk t))
