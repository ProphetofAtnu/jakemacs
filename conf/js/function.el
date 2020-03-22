;;; -*- lexical-binding: t; -*-

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

(defun js/infer-js-backend ()
  "Determine the flavor of javascript you want to use on a
  per-file basis"
  (save-excursion
    (let ((decision nil))
      (while (or (not decision)
                 (eobp))
        (goto-char (point-min))
        (let ((line
               (buffer-substring (point-at-bol) (point-at-eol))))
          (when (string-match-p ".*\/\/[[:blank:]]+@flow" line) (setf decision 'flow)))
        (move-end-of-line 2))
      (if decision
          decision
        'typical))))
