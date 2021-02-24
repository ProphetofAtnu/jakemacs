;;; -*- lexical-binding: t; -*-
;; Thank you spacemacs. (See the web layer)

(defun spacemacs/emmet-expand ()
  (interactive)
  (unless (if (bound-and-true-p yas-minor-mode)
              (call-interactively 'emmet-expand-yas)
            (call-interactively 'emmet-expand-line))
    (indent-for-tab-command)))

(defvar js/web-mode-overrides '((t . web-mode)))

(defun js/web--get-mode-symbol () 
  "Determines the symbol of the right mode based on the results
returned by the tests in js/web-mode-overrides"
  (do
      (result
       (test-set
        (car js/web-mode-overrides)
        (car rest))
       (rest
        (cdr js/web-mode-overrides)
        (cdr rest)))
      ((not (null result)) result)
    (destructuring-bind
        (test . mode)
        test-set
      (cond ((and (functionp test)
                  (funcall test))
             (setf result mode))
            ((and (not (functionp test))
                  test)
             (setf result mode))))))

(defvar-local js/web--html-mode-overridden nil
  "Local variable prevents recursion when major-mode is derived
  from web-mode")

(defun js/web--html-override-advice (old &rest args)
  "Advice for web-mode or HTML mode that conditionally overrides
  it in favor of another mode type, e.g. TSX files or Angular
  templates."
  (let ((over (js/web--get-mode-symbol)))
    (if (and (not (eq over 'web-mode))
             (not js/web--html-mode-overridden))
        (progn 
          (setq-local js/web--html-mode-overridden t)
          
          (when (and (functionp over)
                     (not (eq 'web-mode over)))
            (progn
              (funcall over))))
      (apply old args))))

(defun js/web-custom-setup ()
  "Sets up the customizations to web mode defined by
  web/function.el"
  (with-eval-after-load "web-mode"
    (advice-add 'web-mode :around #'js/web--html-override-advice)))

(provide 'web/function)
