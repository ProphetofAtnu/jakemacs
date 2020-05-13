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

(defun js/jsdoc-annotate-above ()
  "Add an annotation to the line above"
  (interactive)
  (if (and (featurep 'evil) (functionp 'evil-open-above))
      (evil-open-above 1)
    (progn  (goto-char (point-at-bol))
            (newline-and-indent)
            (line-move -1)
            (indent-according-to-mode)))
  (insert "/** ")
  (save-excursion
    (insert " */"))
  )

;; (defun js/jsdoc-one-liner-p () 
;;     (condition-case-unless-debug nil 
;;         (let ((bol (point-at-bol))
;;               (eol (point-at-eol))
;;               (open (search-backward "/**"))
;;               (close (search-backward "*/")))
;;           (if (and (>= open bol) (<= close eol))
;;               (list open close)
;;             nil))
;;       (error nil)))

;; (defun js/jsdoc-return ()
;;   (let ((start (search-backward "/**"))
;;         (end (search-forward "*/"))))

;; (defun js/js-dynamic-ret
;;     (interactive)
;;   (cond
;;    ((js-doc-in-document-p)
;;     (when (js/jsdoc-one-liner-p)
	
;;       ))))
