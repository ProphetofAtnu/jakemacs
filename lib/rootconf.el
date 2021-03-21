;; -*- lexical-binding: t; -*-

;; After the base packages have been loaded, load any additional
;; configs
(setq active-configs '(
                       selectrum
                       ;; helm
                       org
                       ;; ivy
                       addons
                       utility
                       wim
                       emacs-lisp
                       dart
                       sexp
                       lsp
                       go
                       rust
                       sql
                       common-lisp
                       treemacs
                       js
                       python
                       cc
                       elixir
                       web
                       shell
                       lua
                       gnuplot
                       writing
                       flycheck
                       semantic))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq create-lockfiles nil)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(setq
      initial-major-mode 'text-mode
      initial-scratch-message ""
      ;; initial-buffer-choice "*scratch*"
;;       initial-scratch-message ";; Welcome, traveler.
;; ;; I'm too lazy to fix lisp interaction mode
;; ;; so I've set it to emacs-lisp-mode until I
;; ;; stop being lazy.

;; ;; Also I'm too lazy to fix emacs-dashboard, so
;; ;; I'm just waiting until there is a fix.

;; ;; Here's a cat for waiting purposes:

;; ;;                          ,
;; ;;   ,-.       _,---._ __  / \\
;; ;;  /  )    .-'       `./ /   \\
;; ;; (  (   ,'            `/    /|
;; ;;  \\  `-\"             \\'\\   / |
;; ;;   `.              ,  \\ \\ /  |
;; ;;    /`.          ,'-`----Y   |
;; ;;   (            ;        |   '
;; ;;   |  ,-.    ,-'         |  /
;; ;;   |  | (   |            | /
;; ;;   )  |  \\  `.___________|/
;; ;;   '--'   '--\"
;; "
      inhibit-startup-screen t)

(setq eshell-directory-name (ensure-dir user-cache-dir "eshell"))
(setq comint-prompt-read-only t)

(setq visible-bell nil
      bookmark-default-file (expand-file-name "bookmarks" user-cache-dir)
      comint-prompt-read-only t
      sentence-end-double-space nil
      save-place-file (expand-file-name "places" user-cache-dir))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq auto-save-list-file-prefix "~/.emacs.d/.cache/auto-save-list/.saves-")

(when (eq system-type 'darwin)
  (add-hook 'js/after-init-hook '(lambda ()  (require 'mac-config))))

(provide 'rootconf)
