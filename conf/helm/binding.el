;;; -*- lexical-binding: t; -*-

(leader-primary-def '(normal visual insert emacs override)
  "." 'helm-mini
  "," 'helm-for-files
  "/" 'helm-swoop
  ;; Search 
  "s s" 'helm-swoop
  "s g" 'helm-rg
  ;; help
  "h a" 'helm-apropos
  "h k" 'helm-descbinds
  "h m" 'helm-describe-modes
  "f l" 'helm-locate
  ;; projectile
  "p r" 'helm-projectile-recentf
  "p d" 'helm-projectile-find-dir
  ;; "p f" 'helm-projectile-find-file
  "p f" 'helm-projectile-find-file-dwim
  "p p" 'helm-projectile-switch-project
  "p b" 'helm-projectile-switch-to-buffer
  "p d" 'helm-projectile-browse-dirty-projects
  "p l" 'helm-projectile-find-file-in-known-projects
  "p g a" 'helm-projectile-ag
  "p g r" 'helm-projectile-rg
  "p g k" 'helm-projectile-ack
  "p g g" 'helm-projectile-grep
  )

(leader-tert-def
  "m" 'helm-mode-manager
  "\\" 'helm-mini)
