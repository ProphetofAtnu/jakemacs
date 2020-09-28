;;; -*- lexical-binding: t; -*-

(defun js/custom-poshandler (buffer-or-name arg-name value)
  (let ((info '(:background-color "#262626")))
    (or (plist-get info arg-name)
        value)))

(setq posframe-arghandler #'js/custom-poshandler)

(provide 'custom-poshandler)
