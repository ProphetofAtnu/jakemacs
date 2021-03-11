;; -*- lexical-binding: t; -*-

(use-package window-purpose
  :commands (purpose-add-user-purposes)
  :config
  (setq purpose-display-fallback nil
        purpose-default-action-order 'switch-to-buffer)
  (js/disable-purpose-for 'diredp-find-file-reuse-dir-buffer)
  (purpose-mode 1))

(use-package all-the-icons-ibuffer
  :config
  (all-the-icons-ibuffer-mode))

(use-package ibuffer-sidebar
  :commands (ibuffer-sidebar-toggle-sidebar)
  :config
  ;; (purpose-add-user-purposes :modes '((ibuffer-sidebar-mode . side)))
  (setq ibuffer-sidebar-width 25))

(use-package window-purpose-x
  :config
  (purpose-x-popwin-setup)
  (purpose-x-magit-single-on)
  (purpose-x-kill-setup)
  (purpose-x-popwin-update-conf)
)

(use-package workgroups)

(use-package persp-mode
  :delight 
  :init
  (setq persp-auto-resume-time -1
        persp-kill-foreign-buffer-behaviour 'kill
        persp-add-buffer-on-after-change-major-mode t)

  (persp-mode 1)
  (require 'treemacs-persp)
  (treemacs-set-scope-type 'Perspectives)
  ;; (with-eval-after-load 'doom-modeline
  ;;   (setq doom-modeline-persp-icon nil
  ;;         doom-modeline-persp-name nil))
   ;; (require 'persp-projectile-auto-persp)
   )

(use-package persp-mode-projectile-bridge
  :init
  (persp-mode-projectile-bridge-mode)
  ;; Autokill perspectives that were created while loading.
  (add-hook
   'emacs-startup-hook
   'persp-mode-projectile-bridge-kill-perspectives)
  ;; (add-hook 'projectile-before-switch-project-hook
  ;;           (lambda () (persp-activate nil)))
  )

(use-package ivy-purpose
  :config
  (ivy-purpose-setup))

(with-eval-after-load "persp-mode"
  (with-eval-after-load "ivy"
    (add-hook 'ivy-ignore-buffers
              #'(lambda (b)
                  (when persp-mode
                    (let ((persp (get-current-persp)))
                      (if persp
                          (not (persp-contain-buffer-p b persp))
                        nil)))))

    (setq ivy-sort-functions-alist
          (append ivy-sort-functions-alist
                  '((persp-kill-buffer   . nil)
                    (persp-remove-buffer . nil)
                    (persp-add-buffer    . nil)
                    (persp-switch        . nil)
                    (persp-window-switch . nil)
                    (persp-frame-switch  . nil))))))

(use-package nswbuff
  :init 
  (defhydra hydra-nswbuff (:color red :hint nil)
                        ("n" nswbuff-switch-to-next-buffer)
                        ("p" nswbuff-switch-to-previous-buffer))
  :config
  (setq nswbuff-recent-buffers-first nil)
  (general-defs
    :keymaps 'js/buffer-prefix
   "n" 'hydra-nswbuff/nswbuff-switch-to-next-buffer
   "p" 'hydra-nswbuff/nswbuff-switch-to-previous-buffer)
  )

;; (use-package perspective
;;   :init
;;   (persp-mode)
;;   (purpose-x-persp-setup)
;;   (add-hook
;;    'projectile-after-switch-project-hook
;;    'js/persp-project-hook)
;;   :config
;;   (setq switch-to-prev-buffer-skip #'js/switch-to-buffer-skip-filter))


;; (use-package persp-projectile)

