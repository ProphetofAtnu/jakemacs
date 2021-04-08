;;; -*- lexical-binding: t; -*-

(general-defs
  :states '(motion normal emacs)
  :keymaps '(ibuffer-mode-map)
  "?" 'which-key-show-major-mode)

(general-define-key
  :prefix-map 'js/persp-prefix
  :prefix-command 'js/persp-command
  ;; Proper bindings
  "x" 'persp-switch
  "a" 'persp-add-buffer
  "r" 'persp-remove-buffer
  "k" 'persp-kill
  "p" 'persp-prev
  "n" 'persp-next
  "r" 'persp-rename
  "d" 'persp-remove-buffer)


;; (general-defs
;;   "g t" 'persp-next
;;   "g T" 'persp-prev)

(general-defs
  'js/buffer-prefix
  "x" '(:prefix-command js/persp-command
                        :prefix-map js/persp-prefix
                        :wk "Persp"))

(which-key-add-keymap-based-replacements js/buffer-prefix
  "o" "Other Window")

(general-defs 'js/layout-prefix
  "n" 'persp-next
  "p" 'persp-prev
  "l" 'persp-switch
  ;; "L" 'persp-switch-quick
  "x" 'persp-add-buffers-by-regexp
  "t" 'persp-temporarily-display-buffer
  "a" 'persp-add-buffer 
  "r" 'persp-remove-buffer
  "x" 'persp-kill 
  ;; Purpose
  )

(general-defs
  '(visual motion normal)
  'purpose-mode-map
  "l b" 'purpose-switch-buffer
  "l d" 'purpose-toggle-window-purpose-dedicated
  "l D" 'purpose-toggle-window-buffer-dedicated
  "z s" 'purpose-x-popwin-stick
  "z S" 'purpose-x-popwin-unstick
  "z C-s" 'purpose-x-popwin-close-windows)

(leader-tert-def '(normal visual motion insert override)
  "k" 'kill-buffer-and-window)
