;;; -*- lexical-binding: t; -*-

(require 'which-key)

(require 'prefix/window)
(require 'prefix/layout)
(require 'prefix/buffer)
(require 'prefix/insert)
(require 'prefix/files)
(require 'prefix/help)
(require 'prefix/search)
(require 'prefix/projectile)
(require 'prefix/frames)

(general-create-definer leader-primary-def
  :states '(normal visual motion insert emacs override)
  :prefix leader-primary
  :non-normal-prefix alt-primary)

(leader-primary-def '(normal visual motion insert emacs override)
  "" nil
  "SPC" 'execute-extended-command
  "\'"  'ansi-term
  "TAB" 'switch-to-prev-buffer
  "m" 'hydra-window-manage/body
  "z" 'kill-buffer-and-window
  ;; Quit/Restart
  "q" '(:ignore t :wk "Quit/Restart")
  "q r" 'restart-emacs
  "q q" 'save-buffers-kill-emacs
  "q Q" 'kill-emacs

  ;; Prefix Maps

  "j" '(:prefix-command js/jump-command
        :prefix-map js/jump-prefix
        :wk "Jump")
  "l" '(:prefix-command js/layout-command
        :prefix-map js/layout-prefix
        :wk "Layout")
  "s" '(:prefix-command js/search-command
        :prefix-map js/search-prefix
        :wk "Search")
  "b" '(:prefix-command js/buffer-command
        :prefix-map js/buffer-prefix
        :wk "Buffer")
  "h" '(:prefix-command js/help-command
        :prefix-map js/help-prefix
        :wk "Help")
  "f" '(:prefix-command js/files-command
        :prefix-map js/files-prefix
        :wk "Files")
  "w" '(:prefix-command js/window-command
        :prefix-map js/window-prefix
        :wk "Window")
  "i" '(:prefix-command js/insert-command
        :prefix-map js/insert-prefix
        :wk "Insert")
  "p"   '(:prefix-command js/projectile-command
                          :prefix-map js/projectile-prefix
                          :wk "Projectile")
  "o" '(:prefix-command js/frames-command
        :prefix-map js/frames-prefix
        :wk "Frames")
  )

;; (general-define-key
;;   :prefix-command 'js/projectile-command
;;   :prefix-map 'js/projectile-prefix
;;   "p" 'projectile-commander
;;   "c" 'org-projectile-capture-for-current-project
;;   "C" 'org-projectile-goto-location-for-project
;;   "r" 'projectile-recentf
;;   "d" 'projectile-find-dir
;;   "F" 'projectile-find-file-dwim
;;   "f" 'projectile-find-file
;;   "o" 'projectile-find-file-dwim-other-window
;;   "a" 'projectile-add-known-project
;;   "A" 'projecitle-remove-known-project
;;   "i" 'projectile-ibuffer
;;   "s" 'projectile-switch-project
;;   "~" 'projectile-browse-dirty-projects
;;   "l" 'projectile-find-file-in-known-projects
;;   "b" 'projectile-switch-to-buffer
;;   "B" 'projectile-switch-to-buffer-other-window
;;   "!" 'projectile-run-shell-command-in-root
;;   "&" 'projectile-run-async-shell-command-in-root
;;   ; Search
;;   "g" '(:ignore t
;; 	:wk-full-keys nil
;;                 :wk "Search Project")
;;   ; "p g a" 'helm-projectile-ag
;;   "g r" 'projectile-ripgrep
;;   ; "p g k" 'helm-projectile-ack
;;   "g g" 'projectile-grep
;;   ;; Frames
;; )
