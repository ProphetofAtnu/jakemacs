;;; -*- lexical-binding: t; -*-

(defun js/create-capture-reference (&optional topic title)
  "Capture function that creates a generic file under the correct
  topic directory."
  (interactive
   (let ((file-topic (js/complete-subdirectories org-directory "Topic: "))
         (file-title (read-string "Title: " "")))
     `(,file-topic ,file-title)
     ))

  (if (and topic title)
      (let ((file-base
           (concat (replace-regexp-in-string "\s+" "_" title)
                   ".org"))
          (buffer (get-buffer-create title)))
      (message
       (format "topic: %s title: %s file-base: %s"
               topic title file-base))
      (setq buffer-file-name (expand-file-name file-base topic))
      (insert (concat "#+TITLE:" title "\n"))
      (org-mode)
      (set-buffer buffer)
      (goto-char (point-max)))
    (call-interactively 'js/create-capture-reference)))
