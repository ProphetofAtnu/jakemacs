;;; -*- lexical-binding: t; -*-

(defun js/gorun ()
  "Invokes go run on the target buffer file."
  (interactive)
  (let ((file (buffer-file-name (current-buffer))))
    (with-current-buffer (get-buffer-create "*gorun*")
      (async-shell-command (format "go run %s" file) (current-buffer) (current-buffer))
      (switch-to-buffer-other-window (current-buffer))
      (read-only-mode 1))))

(defun js/gorun-package ()
  "Invokes go run on the current directory (package main)"
  (interactive)
  (let ((file (buffer-file-name (current-buffer))))
    (with-current-buffer (get-buffer-create "*gorun*")
      (async-shell-command (format "go run %s" (file-name-directory file)) (current-buffer) (current-buffer))
      (switch-to-buffer-other-window (current-buffer))
      (read-only-mode 1))))
