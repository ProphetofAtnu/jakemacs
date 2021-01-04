;;; -*- lexical-binding: t; -*-

;; (defun js/persp-project-hook ()
;;   (let ((bfs (projectile-project-buffers))
;;         (pn (projectile-project-name)))
;;     (let ((buf (current-buffer)))
;;       (persp-switch pn)
;;       (mapc 'persp-add-buffer bfs)
;;       (switch-to-buffer buf))))

;; (defun js/persp-switch-to-buffer-other-window ()
;;   (interactive)
;;   (switch-to-buffer-other-window
;;    (completing-read
;;     "Switch to buffer in other window: "
;;     (persp-current-buffer-names) nil t)))

;; (defun js/debug-projectile-switch-hook ()
;;   (message (pp project-to-switch)))
