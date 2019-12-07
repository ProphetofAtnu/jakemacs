;; General bindings
(require 'general)

(setq leader-primary "SPC")
(setq alt-primary "C-SPC")
(setq leader-minor ",")
(setq alt-minor "C-,")
(setq leader-tertiary "\\")
(setq alt-tertiary "C-\\")

(general-create-definer leader-primary-def
  :states '(normal visual insert emacs override)
  :prefix leader-primary
  :non-normal-prefix alt-primary)

(leader-primary-def '(normal visual insert emacs override)
  "SPC" 'execute-extended-command
  "." 'switch-to-buffer
  "," 'find-file
  "b" '(:ignore t :wk "Buffers")
  "b b" 'switch-to-buffer
  "b l" 'buffer-menu
  "b d" 'kill-current-buffer
  "f" '(:ignore t :wk "Files")
  "f f" 'find-file
  "f d" 'dired
  "f r" 'recentf
  "f l" 'helm-locate
  "f s" 'save-buffer
  "f S" 'evil-write-all
  ;; Quit/Restart
  "q" '(:ignore t :wk "Quit/Restart")
  "q r" 'restart-emacs
  "q q" 'quit
  ;; Window
  "w" '(:ignore t :wk "Windows")
  "w d" 'delete-window
  "w l" 'evil-window-right
  "w h" 'evil-window-left
  "w j" 'evil-window-down
  "w k" 'evil-window-up
  "w L" 'evil-window-move-far-right
  "w H" 'evil-window-move-far-left
  "w J" 'evil-window-move-far-down
  "w K" 'evil-window-move-far-up
  "w r" 'evil-window-rotate-downwards
  "w R" 'evil-window-rotate-upwards
  "w s" 'evil-window-split
  "w v" 'evil-window-vsplit
  )

(general-defs '(normal motion)
  "-" #'dired-jump
  :prefix )

