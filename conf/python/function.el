;;; -*- lexical-binding: t; -*-

(defun js/python-restart-shell ()
  "Kill and restart the python shell"
  (interactive)
  (let ((pyproc (get-process "Python")))
    (when pyproc
      (kill-buffer (process-buffer pyproc))))
  (run-python))

