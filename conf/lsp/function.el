;;; -*- lexical-binding: t; -*-


(defmacro js/add-lsp-major-mode (lsp-client major-mode)
  "Add `major-mode' to list of `lsp-client' major modes"
  (gv-letplace
      (getter setter)
      `(lsp--client-major-modes
       (gethash
        (quote ,lsp-client)
        lsp-clients))
    `(unless (memq (quote ,major-mode) ,getter)
      (funcall ,setter (push (quote ,major-mode) ,getter)))))

(provide 'lsp/function)
