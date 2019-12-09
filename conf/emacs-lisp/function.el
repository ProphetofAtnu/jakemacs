;;; -*- lexical-binding: t; -*-

(defun ielm-other-window ()
  "Open ielm in other window, splitting if it doesn't exist"
  (interactive)
  (let ((proc (get-process "ielm")))
    (switch-to-buffer-other-window (current-buffer))
    (unless (process-live-p proc)
      (progn
        (ielm)
        (setf proc (get-process "ielm"))))
    (switch-to-buffer (process-buffer proc))))

;; (defun ielm-send-region (beg end)
;;   "Sends region to ielm buffer"
;;   (interactive "r")
;;   (let ((proc (get-process "ielm"))
;;         (region ()))
;;     (unless (process-live-p proc)
;;       (progn
;;         (ielm-other-window)
;;         (setf proc (get-process "ielm"))))
;;     (write-region beg end)))
