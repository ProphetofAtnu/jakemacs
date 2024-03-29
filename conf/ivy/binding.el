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

(with-eval-after-load "window-purpose"
  (general-defs
    'js/buffer-prefix
    "c" (without-purpose-command 'counsel-switch-buffer)))

(general-defs
  'js/insert-prefix
  "y" 'counsel-yank-pop)

(leader-tert-def
  "\\" 'counsel-semantic-or-imenu
  "d" '(:ignore t :wk "Dash Docs")
  "d i" 'counsel-dash-install-docset
  "d d" 'counsel-dash
  "d D" 'counsel-dash-at-point
  "d a" 'counsel-dash-activate-docset
  "d o" '(js/dash-open-docset-path :wk "Browse"))

(with-eval-after-load "purpose"
  (general-defs
    'js/buffer-prefix
    "b" 'ivy-purpose-switch-buffer-without-purpose
    "B" 'ivy-purpose-switch-buffer-with-purpose
    "v" 'ivy-purpose-switch-buffer-with-some-purpose))



(general-defs
  [remap recentf-open-files] 'counsel-recentf
  [remap bookmark-bmenu-search] 'counsel-bookmark)

(with-eval-after-load 'projectile 
  (counsel-projectile-mode))

