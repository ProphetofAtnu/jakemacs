;;; -*- lexical-binding: t; -*-

(defun js/dash-open-docset-path ()
  (interactive)
  (dired
   counsel-dash-docsets-path))
