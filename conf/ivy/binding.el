;;; -*- lexical-binding: t; -*-

(leader-primary-def '(normal visual insert emacs override)
  "." 'counsel-buffer-or-recentf
  "," 'counsel-find-file
  "s s" 'counsel-grep-or-swiper
  "s g" 'counsel-rg
  "h a" 'counsel-apropos
  "h k" 'counsel-descbinds
  "h m" 'counsel-minibuffer-history
  "f z f" 'counsel-fzf)

(general-defs
  [remap recentf-open-files] 'counsel-recentf
  [remap bookmark-bmenu-search] 'counsel-bookmark)

(with-eval-after-load 'projectile 
  (counsel-projectile-mode))
