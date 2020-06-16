;;; -*- lexical-binding: t; -*-

(use-package mix
  :straight t
  :commands (mix--project-root))

(defun js/iex-start-mix-term-maybe ()
  (interactive)
  (let ((targs '("*IEx*" "iex"))
        (wmix '(nil "-S" "mix")))
    (when-let ((proot (mix--project-root)))
      (progn 
        (cd proot)
        (setf targs (concatenate
                     'list targs wmix))))
    (with-current-buffer
        (apply 'term-ansi-make-term targs)
      (term-char-mode)
      (pop-to-buffer (current-buffer)))))

(defun js/pop-to-iex ()
  (interactive)
  (if (buffer-live-p (get-buffer "*IEx*"))
      (pop-to-buffer (get-buffer "*IEx*"))
    (js/iex-start-mix-term-maybe)))
