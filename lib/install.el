;;; -*- lexical-binding: t; -*-
(straight-use-package 'auto-install)
(straight-use-package 'use-package)
(straight-use-package 'auto-minor-mode)
(straight-use-package 'better-defaults)
(straight-use-package 'async)
(straight-use-package 'save-sexp)
(straight-use-package '(simple-httpd :type git :flavor melpa :host github :repo "skeeto/emacs-web-server"))

;; Evil Setup / Keybinding
(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-commentary)
(straight-use-package 'evil-expat)
(straight-use-package 'evil-surround)
(straight-use-package 'evil-goggles)
(straight-use-package 'evil-org)
(straight-use-package 'evil-matchit)
(straight-use-package 'origami)
(straight-use-package 'evil-mc)
(straight-use-package 'monitor)
(straight-use-package 'which-key)
(straight-use-package 'general)
(straight-use-package 'evil-smartparens)

;; Utility
(straight-use-package 'restart-emacs)
(straight-use-package 'smartparens)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'company)
(straight-use-package 'company-box)
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
(straight-use-package 'window-purpose)
(straight-use-package 'popwin)
(straight-use-package 'imenu-plus)
(straight-use-package 'imenu-list)
(straight-use-package 'imenu-anywhere)
(straight-use-package 'prodigy)
(straight-use-package 'rainbow-mode)

(straight-use-package 'thingatpt)
(straight-use-package 'thingatpt-plus)
(straight-use-package 'find-where)

;; I'm putting Ivy stuff in, screw it
(straight-use-package 'swiper)

;; Asthetic Changes

;;; Depricated on 12/10/19
;; (straight-use-package 'powerline)
(straight-use-package 'moe-theme)
(straight-use-package 'cyberpunk-theme)
(straight-use-package 'delight)
(straight-use-package 'dashboard)
(straight-use-package 'doom-modeline)
(straight-use-package 'projectile)
(straight-use-package 'eyebrowse)

;; Shell
(straight-use-package 'eshell-z)
(straight-use-package 'eshell-prompt-extras)
(straight-use-package 'eshell-fixed-prompt)
;; (straight-use-package 'esh-autosuggest)
(straight-use-package 'pcomplete-extension)

(straight-use-package 'ivy)
(straight-use-package 'ivy-rich)
(straight-use-package 'ivy-hydra)
(straight-use-package 'ivy-explorer)
(straight-use-package 'swiper)

(straight-use-package 'counsel)
(straight-use-package 'counsel-projectile)
(straight-use-package 'counsel-dash)
(straight-use-package 'counsel-etags)
(straight-use-package 'counsel-tramp)

(straight-use-package 'flx)
(straight-use-package 'ivy-posframe)

;; (straight-use-package '(aweshell
;;                         :type git :host github
;;                         :repo "manateelazycat/aweshell"))

;; Weird libraries
(straight-use-package 'request)

(provide 'install)
