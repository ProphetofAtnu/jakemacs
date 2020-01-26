;;; -*- lexical-binding: t; -*-

(require 'which-key)

(general-create-definer leader-primary-def
  :states '(normal visual insert emacs override)
  :prefix leader-primary
  :non-normal-prefix alt-primary)

(defhydra hydra-window-manage (:color amaranth)
  "Edit window layout:"
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
  ("q" nil "Exit" :color blue :column "")
  ("z" nil "Exit" :color blue :column "")
  ("<escape>" nil "Exit" :color blue :column ""))

(leader-primary-def '(normal visual insert emacs override)
  "SPC" 'execute-extended-command
  ;; "." 'helm-mini
  ;; "," 'helm-for-files
  ;; "/" 'helm-swoop
  "M-1" 'eyebrowse-switch-to-window-config-1
  "M-2" 'eyebrowse-switch-to-window-config-2
  "M-3" 'eyebrowse-switch-to-window-config-3
  "M-4" 'eyebrowse-switch-to-window-config-4
  "M-5" 'eyebrowse-switch-to-window-config-5
  "M-6" 'eyebrowse-switch-to-window-config-6
  "M-7" 'eyebrowse-switch-to-window-config-7
  "M-8" 'eyebrowse-switch-to-window-config-8
  "M-9" 'eyebrowse-switch-to-window-config-9
  "M-0" 'eyebrowse-switch-to-window-config-0
  "\'"  'ansi-term
  "TAB" 'previous-buffer
  "b"   '(:ignore t :wk "Buffers")
  "b b" 'switch-to-buffer
  "b l" 'ibuffer
  "b o" 'switch-to-buffer-other-window
  "b t" 'switch-to-buffer-other-tab
  "b d" 'kill-current-buffer
  "b D" 'kill-other-buffers
  "j" '(:ignore t :wk "Jump")
  "s" '(:ignore t :wk "Search")
  ;; "s s" 'helm-swoop
  ;; "s g" 'helm-rg
  "s o" 'occur
  "s r" 'query-replace
  "s c" 'evil-ex-nohighlight
  "d" '(:ignore t :wk "Dedicate")
  "d d" 'purpose-toggle-window-purpose-dedicated
  "d D" 'purpose-toggle-window-buffer-dedicated
  "d s" 'purpose-switch-buffer-with-purpose
  "d K" 'purpose-delete-non-dedicated-windows
  "d f" 'purpose-friendly-find-file
  "d o" 'purpose-friendly-find-file-other-window
  "d b" 'purpose-friendly-switch-buffer
  "d B" 'purpose-friendly-switch-buffer-other-window
  "d W" 'purpose-save-window-layout
  "d w" 'purpose-load-window-layout 
  "h" '(:ignore t :wk "Help")
  ;; "h a" 'helm-apropos
  "h v" 'describe-variable
  "h f" 'describe-function
  "h s" 'helpful-symbol
  "h k" 'general-describe-keybindings
  "h d" 'discover-my-major
  "h D" 'discover-my-mode
  ;; "h k" 'helm-descbinds
  ;; "h m" 'helm-describe-modes
  "f" '(:ignore t :wk "Files")
  "f f" 'find-file
  "f o" 'find-file-other-window 
  "f d" 'dired
  "f D" 'dired-other-window
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
  "w"     '(:ignore t :wk "Windows")
  "w ."   'hydra-window-manage/body 
  "w w"   'evil-window-next
  "w d"   'delete-window
  "w ="   'balance-windows
  "w t"   'ace-swap-window
  "w l"   'evil-window-right
  "w h"   'evil-window-left
  "w j"   'evil-window-down
  "w k"   'evil-window-up
  "w L"   'evil-window-move-far-right
  "w H"   'evil-window-move-far-left
  "w J"   'evil-window-move-very-bottom
  "w K"   'evil-window-move-very-top
  "w r"   'evil-window-rotate-downwards
  "w R"   'evil-window-rotate-upwards
  "w s"   'evil-window-split
  "w v"   'evil-window-vsplit
  "g"     '(:ignore t :wk "Eyebrowse")
  "g n"   'eyebrowse-create-window-config
  "g z"   'eyebrowse-close-window-config
  "g t"   'eyebrowse-next-window-config
  "g T"   'eyebrowse-prev-window-config
  "g TAB" 'eyebrowse-last-window-config
  ;; Inserts
  "i"   '(:ignore t :wk "Insert")
  "i n" 'yas-new-snippet
  "i i" 'yas-insert-snippet
  ;; Projectile
  "p"   '(:ignore t :wk "Projectile")
  "p r" 'projectile-recentf
  "p d" 'projectile-find-dir
  "p !" 'projectile-run-shell-command-in-root
  "p f" 'projectile-find-file-dwim
  "p F" 'projectile-find-file
  "p o" 'projectile-find-file-dwim-other-window
  "p a" 'projectile-add-known-project
  "p A" 'projecitle-remove-known-project
  "p i" 'projectile-ibuffer
  "p p" 'projectile-switch-project
  "p d" 'projectile-browse-dirty-projects
  "p l" 'projectile-find-file-in-known-projects
  ;; Search
  "p g" '(:ignore t :wk "Search Project")
  ;; "p g a" 'helm-projectile-ag
  "p g r" 'projectile-ripgrep
  ;; "p g k" 'helm-projectile-ack
  "p g g" 'projectile-grep
  )


(push '(("\\`SPC M-.\\'" . "eyebrowse-switch-to-window-config-[1-9]") . t) which-key-replacement-alist)
(push '(("\\`SPC M-0\\'" . "eyebrowse-switch-to-window-config-0") . ("SPC M-[0-9]". "Tab [0-9]")) which-key-replacement-alist)
