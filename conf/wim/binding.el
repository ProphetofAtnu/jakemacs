;;; -*- lexical-binding: t; -*-

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


(with-eval-after-load "ivy"
  (general-defs
    'js/buffer-prefix
    "b" 'ivy-purpose-switch-buffer-without-purpose
    "B" 'ivy-purpose-switch-buffer-with-purpose
    "v" 'ivy-purpose-switch-buffer-with-some-purpose))

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
  "a" 'persp-add-buffer 
  "r" 'persp-remove-buffer
  "x" 'persp-kill 
  ;; Purpose
  "b" 'purpose-switch-buffer
  "d" 'purpose-toggle-window-purpose-dedicated
  "D" 'purpose-toggle-window-buffer-dedicated
  )

(leader-tert-def '(normal visual motion insert override)
  "k" 'kill-buffer-and-window)
