;;; -*- lexical-binding: t; -*-
;; From -> https://stackoverflow.com/questions/3417438/close-all-buffers-besides-the-current-one-in-emacs
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove 'buffer-file-name (buffer-list)))))

(defun describe-symbol-at-point ()
  "Run describe-symbol on the symbol under the cursor"
  (interactive)
  (describe-symbol (symbol-at-point)))

(defun sort-lines-reverse (beg end)
  "Sort lines in reverse..."
  (interactive "r")
  (sort-lines t beg end))

(defun jump-messages ()
  "Jump to the messages buffer"
  (interactive) 
  (pop-to-buffer (get-buffer "*Messages*")))

;; (with-eval-after-load 'popwin
;;   (defmacro js/pop-to-dwim (func &optional &key func-args reuse buffer-predicate special-display)
;;     "Define a popup function to pop to a buffer"
;;     (let ((buffer-predicate 'featurep)
;;           (predicate (lambda (buf) (and (buffer-live-p buf)
;;                                         (buffer-predicate buf))))
;;           (fun-string `(symbol-name func)))
;;       `(defun ,(intern (concat "js/auto~pop-to-" ,fun-string)) ()
;;          ,(concat "Auto generated ~~~ Pop to " ,fun-string)
;;          (interactive)
;;          ))))

(defun js/maybe-pretty-brackets ()
  "Insert pretty brackets "
  (interactive)
  (if (save-excursion
          (skip-chars-backward "\t ")
          (when (memq (char-before) '(?\( ?\{ ?\[))
            (skip-chars-forward "\t ")
            (memq (char-after) '(?\) ?\} ?\]))))
    (progn
      (delete-horizontal-space)
      (save-excursion 
        (newline-and-indent))
      (newline-and-indent)
      )
    (newline-and-indent)))

(cl-defmacro js/context-func (name args
                                       &key
                                       (bind nil)
                                       (doc nil doc-p)
                                       (inter-args nil inter-args-p)
                                       conds)
  (let ((preamble nil)
        (con 
         (let (list-of-pairs)
           (dolist (track conds (nreverse list-of-pairs))
             (destructuring-bind (a . b) track 
               (let ((pred (if (functionp a)
                               `(funcall (quote ,a))
                             a)))
                 (push `(,pred ,@b) list-of-pairs)))))))
    (when inter-args-p
      (push `(interactive ,inter-args) preamble))
    (when doc-p
      (push doc preamble))
    `(defun ,name ,args
       ,@preamble
       ;; ,doc
       ;; (interactive ,inter-args)
       (let ,bind
         (cond
          ,@con)))))

(provide 'interact)
