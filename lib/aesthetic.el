;; (use-package powerline
;;   :init
;;   (powerline-default-theme))


(use-package moe-theme
  :straight t
  :init
  (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0)
	moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0)
	moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))
  :config
  (progn
    (moe-dark)
    (set-face-foreground 'ivy-minibuffer-match-face-1 "grey18" nil)
    (set-face-foreground 'ivy-minibuffer-match-face-2 "grey18" nil)
    (set-face-foreground 'ivy-minibuffer-match-face-3 "grey18" nil)
    (set-face-foreground 'ivy-minibuffer-match-face-4 "grey18" nil)
    ))

(use-package doom-modeline
  :commands (doom-modeline-mode)
  :init (doom-modeline-mode)
  :config
  (setq doom-modeline-minor-modes t
        doom-modeline-current-window ))


;; (use-package cyberpunk-theme
;;   :init
;;   (load-theme 'cyberpunk t))

(provide 'aesthetic)
