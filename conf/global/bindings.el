;;; -*- lexical-binding: t; -*-
;; General bindings
(require 'general)
(load (concat-path user-emacs-directory "lib/interact"))

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

(general-create-definer leader-minor-def
  :states '(normal visual insert emacs override)
  :prefix leader-minor
  :non-normal-prefix alt-minor)

(general-create-definer leader-tert-def
  :states '(normal visual insert emacs override)
  :prefix leader-tertiary
  :non-normal-prefix alt-tertiary)

(leader-primary-def '(normal visual insert emacs override)
  "SPC" 'execute-extended-command
  "." 'switch-to-buffer
  "," 'find-file
  "/" 'helm-swoop
  "b" '(:ignore t :wk "Buffers")
  "b b" 'switch-to-buffer
  "b l" 'ibuffer
  "b d" 'kill-current-buffer
  "b D" 'kill-other-buffers
  "s" '(:ignore t :wk "Search")
  "s s" 'helm-swoop
  "s g" 'helm-rg
  "s o" 'occur
  "s r" 'query-replace
  "h" '(:ignore t :wk "Help")
  "h a" 'helm-apropos
  "h v" 'describe-variable
  "h f" 'describe-function
  "h s" 'helpful-symbol
  "h k" 'general-describe-keybindings
  "h b" 'discover-my-major
  "h B" 'discover-my-mode
  "f" '(:ignore t :wk "Files")
  "f f" 'find-file
  "f d" 'dired
  "f r" 'recentf-open-files
  "f l" 'helm-locate
  "f s" 'save-buffer
  "f S" 'evil-write-all
  ;; Quit/Restart
  "q" '(:ignore t :wk "Quit/Restart")
  "q r" 'restart-emacs
  "q q" 'save-buffers-kill-emacs
  "q Q" 'kill-emacs
  ;; Window
  "w" '(:ignore t :wk "Windows")
  "w w" 'other-window
  "w d" 'delete-window
  "w l" 'evil-window-right
  "w h" 'evil-window-left
  "w j" 'evil-window-down
  "w k" 'evil-window-up
  "w L" 'evil-window-move-far-right
  "w H" 'evil-window-move-far-left
  "w J" 'evil-window-move-very-bottom
  "w K" 'evil-window-move-very-top
  "w r" 'evil-window-rotate-downwards
  "w R" 'evil-window-rotate-upwards
  "w s" 'evil-window-split
  "w v" 'evil-window-vsplit
  )

(leader-tert-def
  "t" 'term
  "w" 'eww
  "b" 'bookmark-bmenu-search
  "w" 'ace-window
  "l" 'avy-goto-line
  "\\" 'eval-expression)

(leader-minor-def
  "x" '(:ignore t :wk "Text")
  "x x" 'indent-region
  "x X" 'indent-rigidly
  "x u" 'downcase-region
  "x U" 'upcase-region
  "x t" 'transpose-words
  "x T" 'transpose-lines
  "x c" 'evil-align-center
  "x a" 'align-regexp
  "x A" 'align-entire
  "x s" 'sort-lines
  "x S" 'sort-lines-reverse
  "x k" 'keep-lines
  "x K" 'delete-matching-lines)

(general-defs 'indent-rigidly-map
  "h" 'indent-rigidly-left
  "l" 'indent-rigidly-right)

(general-defs '(normal visual motion)
  "s" nil
  "S" nil
  "s" 'avy-goto-char-2
  "S" 'avy-goto-word-or-subword-1
  ;; Dired stuff
  "-" #'dired-jump)


(general-defs '(normal visual motion insert)
  "C-(" 'evil-previous-open-paren
  "C-)" 'evil-next-close-paren
  "C-{" 'evil-previous-open-brace
  "C-}" 'evil-next-close-brace)
