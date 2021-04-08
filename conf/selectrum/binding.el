;;; -*- lexical-binding: t; -*-

;; (leader-primary-def '(normal visual motion override insert))
(leader-primary-def '(normal visual insert emacs override)
  "," 'consult-buffer)

(general-defs
  "C-M-SPC" 'selectrum-repeat)

(general-defs
  'js/search-prefix 
  "s" 'consult-line
  "f" 'consult-focus-lines
  ;; consult-isearch-reverse
  ;; consult-isearch-forward
  "k" 'consult-keep-lines
  "v" 'consult-git-grep
  "j" 'consult-outline
  "r" 'consult-ripgrep
  "i" 'consult-isearch
  "m" 'consult-multi-occur
  "l" 'consult-line
  "g" 'consult-grep)

(general-defs '(normal visual motion)
  "S" 'consult-line)

(general-defs
  'js/files-prefix
  ;; "e" 'consult-file-externally
  "F" 'consult-find
  "r" 'consult-recent-file
  "l" 'consult-locate

  "b" 'consult-bookmark)

(leader-tert-def '(normal visual insert emacs override)
  "\\" 'counsel-imenu)

(general-defs 
  'js/buffer-prefix
  "b" 'consult-buffer
  "o" 'consult-buffer-other-window)

(general-defs
  'js/help-prefix
  "m" 'consult-man
  "a" 'consult-apropos
  "l" 'consult-goto-line
  ;; consult-theme
  "x" 'consult-minor-mode-menu
  "z" 'consult-mode-command)

(general-defs
  'js/register-prefix

  "," 'consult-register-store
  "." 'consult-register-load
  "r" 'consult-register
  )

(general-defs
  '(normal visual motion)
  "m" 'consult-register-store
  "'" 'consult-register-load
  "`" 'consult-register
  )

(general-defs
  'js/insert-prefix
  "p" 'consult-yank
  "r" 'consult-yank-replace
  "y" 'consult-yank-pop
  )

(general-defs
  'js/jump-prefix
  "m" 'consult-mark
  "g" 'consult-global-mark
  )

(general-defs
  'js/projectile-prefix
  "m" 'consult-project-imenu
  )

;; consult-flymake
;; consult-compile-error

;; consult-history
;; consult-complex-command

;; consult-imenu

;; consult-narrow
;; consult-kmacro
;; evil-collection-consult-mark
;; embark-consult-goto-location
;; embark-consult-preview-at-point
;; embark-consult-preview-minor-mode
