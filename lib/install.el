;;; -*- lexical-binding: t; -*-
(straight-use-package 'use-package)
(straight-use-package 'auto-minor-mode)
(straight-use-package 'better-defaults)
(straight-use-package 'async)
(straight-use-package 'save-sexp)

;; Evil Setup / Keybinding
(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-commentary)
(straight-use-package 'evil-expat)
(straight-use-package 'evil-surround)
(straight-use-package 'evil-goggles)
(straight-use-package 'evil-org)
(straight-use-package 'monitor)
(straight-use-package 'which-key)
(straight-use-package 'general)

;; Utility
(straight-use-package 'restart-emacs)
(straight-use-package 'smartparens)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'company)
(straight-use-package 'dired-plus)
(straight-use-package 'diredfl)
(straight-use-package 'hydra)
(straight-use-package 'smart-tab)
(straight-use-package 'avy)
(straight-use-package 'ace-window)
(straight-use-package 'ace-link)
(straight-use-package 'helpful)
(straight-use-package 'discover-my-major)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'yasnippet)
(straight-use-package 'load-relative)
(straight-use-package 'eval-sexp-fu)
(straight-use-package 'posframe)
(straight-use-package 'which-key-posframe)
(straight-use-package 'magit)
(straight-use-package 'evil-magit)

;; Helm...
(straight-use-package 'helm)
(straight-use-package 'helm-swoop)
(straight-use-package 'helm-rg)
(straight-use-package 'helm-company)
(straight-use-package 'helm-descbinds)
(straight-use-package 'helm-describe-modes)
(straight-use-package 'helm-mode-manager)
;; Not yet semapi, I don't have time to configure that shit...
;(straight-use-package 'helm-ext)

;; I'm putting Ivy stuff in, screw it
(straight-use-package 'swiper)

;; Asthetic Changes

;;; Depricated on 12/10/19
;; (straight-use-package 'powerline)
;; (straight-use-package 'moe-theme)
(straight-use-package 'cyberpunk-theme)
(straight-use-package 'delight)
(straight-use-package 'dashboard)
(straight-use-package 'doom-modeline)
(straight-use-package 'projectile)
(straight-use-package 'helm-projectile)
(straight-use-package 'eyebrowse)

;; Shell
(straight-use-package 'eshell-z)
(straight-use-package 'eshell-prompt-extras)
(straight-use-package 'eshell-fixed-prompt)

;; (straight-use-package '(aweshell
;;                         :type git :host github
;;                         :repo "manateelazycat/aweshell"))

;; Weird libraries

(provide 'install)
