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

(with-eval-after-load 'term
  (defun js/ansi-term-dwim ()
    (if buffer-live)))


(provide 'interact)
