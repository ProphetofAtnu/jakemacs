;;; -*- lexical-binding: t; -*-

(leader-primary-def '(normal visual insert emacs override)
  "." 'counsel-buffer-or-recentf
  "," 'counsel-find-file
  "s s" 'counsel-grep-or-swiper
  "s g" 'js/counsel-rg-here
  "s G" 'counsel-rg
  "h m" 'counsel-minibuffer-history
  "f z f" 'counsel-fzf)

(general-defs
  'js/buffer-prefix
  "b" 'ivy-switch-buffer
  "c" 'counsel-switch-buffer
  )

(general-defs
  'js/insert-prefix
  "y" 'counsel-yank-pop)

(leader-tert-def
  "d" '(:ignore t :wk "Dash Docs")
  "d i" 'counsel-dash-install-docset
  "d d" 'counsel-dash
  "d D" 'counsel-dash-at-point
  "d a" 'counsel-dash-activate-docset
  "d o" '(js/dash-open-docset-path :wk "Browse"))



(general-defs
  [remap recentf-open-files] 'counsel-recentf
  [remap bookmark-bmenu-search] 'counsel-bookmark)

(with-eval-after-load 'projectile 
  (counsel-projectile-mode))

