;;; -*- lexical-binding: t; -*-

(general-def '(normal visual)
  "g TAB" 'eyebrowse-last-window-config
  "g l" 'eyebrowse-create-window-config
  "g t" 'eyebrowse-next-window-config
  "g T" 'eyebrowse-prev-window-config
  "g L" 'eyebrowse-close-window-config)

(leader-primary-def '(normal visual motion insert emacs override)
  "1" 'eyebrowse-switch-to-window-config-1
  "2" 'eyebrowse-switch-to-window-config-2
  "3" 'eyebrowse-switch-to-window-config-3
  "4" 'eyebrowse-switch-to-window-config-4
  "5" 'eyebrowse-switch-to-window-config-5
  "6" 'eyebrowse-switch-to-window-config-6
  "7" 'eyebrowse-switch-to-window-config-7
  "8" 'eyebrowse-switch-to-window-config-8
  "9" 'eyebrowse-switch-to-window-config-9
  "0" 'eyebrowse-switch-to-window-config-0
  "g" '(:ignore t :wk "Eyebrowse")
  "g n" 'eyebrowse-create-window-config
  "g z" 'eyebrowse-close-window-config
  "g t" 'eyebrowse-next-window-config
  "g T" 'eyebrowse-prev-window-config
  "g TAB" 'eyebrowse-last-window-config)

;; (push '(("\\`SPC M-.\\'" . "eyebrowse-switch-to-window-config-[1-9]") . t) which-key-replacement-alist)
(push '(("\\`SPC [[:digit:]]\\'" . "eyebrowse-switch-to-window-config-[1-9]") . t) which-key-replacement-alist)
;; (push '(("\\`SPC M-0\\'" . "eyebrowse-switch-to-window-config-0") . ("SPC M-[0-9]". "Tab [0-9]")) which-key-replacement-alist)
(push '(("\\`SPC 0\\'" . "eyebrowse-switch-to-window-config-0") . ("SPC [0-9]". "Tab [0-9]")) which-key-replacement-alist)

(leader-primary-def '(normal visual motion insert override)
  :keymaps '(persp-mode-map)
  ;; Proper bindings
  "x" '(:ignore t :wk "Persp")
  "x TAB" 'persp-switch-last
  "x x" 'persp-switch
  "x a" 'persp-add-buffer
  "x k" 'persp-kill
  "x p" 'persp-prev
  "x n" 'persp-next
  "x r" 'persp-rename
  "x d" 'persp-remove-buffer
  "x D" 'persp-kill-buffer*
  "x c" 'persp-set-buffer
  "x b" 'persp-switch-to-buffer*
  "x l" 'persp-ibuffer
  "x S" 'persp-state-save
  "x s" 'persp-state-load
  "x ~" 'persp-state-restore
    )

(leader-tert-def '(normal visual motion insert override)
  "k" 'kill-buffer-and-window)
