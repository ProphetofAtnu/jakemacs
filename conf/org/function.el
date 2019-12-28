;;; -*- lexical-binding: t; -*-

(use-package org
  :commands (org-map-entries))

(use-package org-id
  :commands (org-id-get-create))

(defun js/all-org-files ()
  "Returns a list of all org files except temp files"
  (let* ((orgfile (directory-files-recursively
                   org-directory
                   ".org"))
         (not-temp (-filter
                    #'(lambda (fn)
                        (not (string-match-p
                              "#"
                              (file-name-base fn))))
                    orgfile)))
    not-temp))

(defun js/org-index-buffer ()
    "Generates IDs for any heading that is currently missing one in
the current buffer"
    (interactive)
    (org-map-entries #'(lambda () (org-id-get-create)) t 'file))

(defun js/org-index-directory ()
    "Generates IDs for any heading that is currently missing one in
the org dir."
    (interactive)
    (cl-flet ((get-org-bufs 
               () 
               (-filter #'(lambda (buf) 
                            (with-current-buffer buf 
                              (eq major-mode 'org-mode))) (buffer-list))))
      (let ((old-bufs (get-org-bufs)))
        (org-map-entries #'(lambda () (org-id-get-create)) t (js/all-org-files) 'archive)
        (dolist (buf (get-org-bufs))
          (with-current-buffer buf
            (save-buffer)
            (unless (memq buf old-bufs)
              (kill-current-buffer)))))))
    ;; (org-map-entries #'(lambda () (org-id-get-create)) t (js/all-org-files) 'archive))

(defun js/org-mode-hook ()
  (add-hook 'after-save-hook
            #'(lambda () (js/org-index-buffer))))
