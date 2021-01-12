;;; -*- lexical-binding: t; -*-

(require 'hydra)
(require 'evil)

(defhydra hydra-window-manage (:color amaranth)
  "Edit window layout: (exit with ret/esc/q)"
  ("j" evil-window-down "Up" :column "Switch")
  ("k" evil-window-up "Down")
  ("h" evil-window-left "Left")
  ("l" evil-window-right "Right")
  ("o" other-window "Other")
  ("K" evil-window-move-very-top "To Top" :column "Move")
  ("J" evil-window-move-very-bottom "To Bottom")
  ("L" evil-window-move-far-right "To Right")
  ("H" evil-window-move-far-left "To Left")
  ("r" evil-window-rotate-downwards "Rot. Down")
  ("R" evil-window-rotate-upwards "Rot. Up")
  ("s" split-window-below "Split" :column "Manage")
  ("v" split-window-right "VSplit")
  ("t" ace-swap-window "Swap")
  ("d" evil-window-delete "Delete")
  ("{" shrink-window "Shrink" :column "Resize")
  ("}" enlarge-window "Enlarge")
  ("[" shrink-window-horizontally "H. Shrink")
  ("]" enlarge-window-horizontally "H. Enlarge")
  ("M" maximize-window "Max")
  ("m" minimize-window "Min")
  ("=" balance-windows "Balance")
  ("n" switch-to-next-buffer "Next Buffer" :column "Buffer")
  ("p" switch-to-prev-buffer "Prev Buffer")
  ("b" switch-buffer-without-purpose "Set buffer")
  ("f" find-file "Open File")
  ("x" execute-extended-command "Command")
  ("q" nil nil :color blue :column "")
  ("<return>" nil nil :color blue :column "")
  ("<escape>" nil nil :color blue :column ""))

(pretty-hydra-define hydra-better-window-manage
  (:foreign-keys warn :title "Window Management" :quit-key "q")
  ("Switch"
   (("j" evil-window-down "Up")
    ("k" evil-window-up "Down")
    ("h" evil-window-left "Left")
    ("l" evil-window-right "Right")
    ("o" other-window "Other"))
   "Move"
   (("K" evil-window-move-very-top "To Top" :column "Move")
    ("J" evil-window-move-very-bottom "To Bottom")
    ("L" evil-window-move-far-right "To Right")
    ("H" evil-window-move-far-left "To Left")
    ("r" evil-window-rotate-downwards "Rot. Down")
    ("R" evil-window-rotate-upwards "Rot. Up"))
   "Manage"
   (("s" split-window-below "Split")
    ("v" split-window-right "VSplit")
    ("t" ace-swap-window "Swap")
    ("d" evil-window-delete "Delete"))
   "Resize"
   (("{" shrink-window "Shrink" :column "Resize")
    ("}" enlarge-window "Enlarge")
    ("[" shrink-window-horizontally "H. Shrink")
    ("]" enlarge-window-horizontally "H. Enlarge")
    ("M" maximize-window "Max")
    ("m" minimize-window "Min")
    ("=" balance-windows "Balance"))
   "Buffer"
   (("n" switch-to-next-buffer "Next Buffer" :column "Buffer")
    ("p" switch-to-prev-buffer "Prev Buffer")
    ("b" switch-buffer-without-purpose "Set buffer")
    ("f" find-file "Open File")
    ("x" execute-extended-command "Command"))
   )
  )


(general-define-key
 :prefix-command 'js/window-command
 :prefix-map 'js/window-prefix
  "." 'hydra-better-window-manage/body 
  "a" 'ace-window
  "x" 'ace-delete-window
  "w" 'evil-window-next
  "d" 'delete-window
  "D" 'delete-other-windows
  "=" 'balance-windows
  "t" 'ace-swap-window
  "l" 'evil-window-right
  "h" 'evil-window-left
  "j" 'evil-window-down
  "k" 'evil-window-up
  "L" 'evil-window-move-far-right
  "H" 'evil-window-move-far-left
  "J" 'evil-window-move-very-bottom
  "K" 'evil-window-move-very-top
  "r" 'evil-window-rotate-downwards
  "R" 'evil-window-rotate-upwards
  "s" 'evil-window-split
  "v" 'evil-window-vsplit
  "m" 'minimize-window
  "M" 'maximize-window
 )

(provide 'prefix/window)
