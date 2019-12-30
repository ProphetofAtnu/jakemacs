;;; -*- lexical-binding: t; -*-
;; From -> https://stackoverflow.com/questions/3417438/close-all-buffers-besides-the-current-one-in-emacs
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove 'buffer-file-name (buffer-list)))))

(defun describe-symbol-at-point ()
  "Run describe-symbol on the symbol under the cursor"
  (interactive)
  (describe-symbol (symbol-at-point)))

(defun sort-lines-reverse (beg end)
  "Sort lines in reverse..."
  (interactive "r")
  (sort-lines t beg end))

(provide 'interact)
