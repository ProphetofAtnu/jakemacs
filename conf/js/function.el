;;; -*- lexical-binding: t; -*-

(defun js/company-js-setup ()
  "Initialize company-mode for Javascript"
  (require 'tern)
  (require 'company-tern)
  (require 'flow-minor-mode)
  (require 'company-flow)
  (tern-mode)
  (flow-minor-mode)
  (make-local-variable 'company-backends)
  (dolist (be '(company-tern company-flow))
   (add-to-list 'company-backends be)))

(defun spacemacs//react-inside-string-q ()
  "Returns non-nil if inside string, else nil.
Result depends on syntax table's string quote character."
  (let ((result (nth 3 (syntax-ppss))))
    result))

(defun spacemacs//react-inside-comment-q ()
  "Returns non-nil if inside comment, else nil.
Result depends on syntax table's comment character."
  (let ((result (nth 4 (syntax-ppss))))
    result))

(defun spacemacs//react-inside-string-or-comment-q ()
  "Return non-nil if point is inside string, documentation string or a comment.
If optional argument P is present, test this instead of point."
  (or (spacemacs//react-inside-string-q)
      (spacemacs//react-inside-comment-q)))
