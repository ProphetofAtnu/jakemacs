;;; -*- lexical-binding: t; -*-

(require 'company)

(defmacro js/company-localize-backends (mode backends)
  (let* ((symn (symbol-name mode))
         (hook
          (cond
           ((string-match-p "-hook$" symn) 
            mode)
           ((string-match-p "-mode$" symn)
            (intern (concat symn "-hook")))))
         (be (if (listp backends)
                 (nreverse backends)
               (list backends)))
         (forms (mapcar
                 (lambda (b) 
                   `(add-to-list (quote company-backends) (quote ,b)))
                 be))
         (func `(lambda ()
                  (setq-local company-backends nil)
                  ,@forms)))
    `(add-hook (quote ,hook) ,func)
    ))

(provide 'after/company-after)
