;; (use-package powerline
;;   :init
;;   (powerline-default-theme))

(set-face-attribute 'default t :font "Fira Code-12")
(set-frame-font "Fira Code-12" nil t)


(add-hook 'prog-mode-hook 'prettify-symbols-mode)
(defvar fira-is-safe-p t)
;; https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip

(when fira-is-safe-p
  (require 'fira-code)
  (add-hook 'prog-mode-hook 'fira-code-mode))

(use-package moe-theme
  :straight t
  :init
  (setq moe-theme-resize-title-markdown '(1.5 1.4 1.3 1.2 1.0 1.0)
	moe-theme-resize-title-org '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0)
	moe-theme-resize-title-rst '(1.5 1.4 1.3 1.2 1.1 1.0))
  :config
  (progn
    (moe-dark)
    ;; (moe-theme-set-color 'purple)
    (with-eval-after-load 'ivy 
      (set-face-foreground 'ivy-minibuffer-match-face-1 "grey18" nil)
      (set-face-foreground 'ivy-minibuffer-match-face-2 "grey18" nil)
      (set-face-foreground 'ivy-minibuffer-match-face-3 "grey18" nil)
      (set-face-foreground 'ivy-minibuffer-match-face-4 "grey18" nil))
    ))

(use-package doom-modeline
  :commands (doom-modeline-mode)
  :init (doom-modeline-mode)
  :config
  (setq doom-modeline-minor-modes t))

(provide 'aesthetic)
