;;; -*- lexical-binding: t; -*-

(defun js/gorun-file ()
  "Invokes go run on the target buffer file."
  (interactive)
  (let ((file (buffer-file-name (current-buffer)))
        (output (get-buffer-create "*gorun*")))
    (with-current-buffer-window output 'display-buffer-pop-up-window nil
      (shell-command (format "go run %s" file) output output)
      (special-mode))))

(defun js/gorun-package ()
  "Invokes go run on the current directory (package main)"
  (interactive)
  (let ((file (buffer-file-name (current-buffer)))
        (output (get-buffer-create "*gorun*")))
    (with-current-buffer-window output 'display-buffer-pop-up-window nil
      (shell-command (format "go run %s" (file-name-directory file)) output output)
      (special-mode))))
