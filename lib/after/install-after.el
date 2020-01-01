;;; -*- lexical-binding: t; -*-


(require 'auto-install)
(setq auto-install-directory (ensure-dir user-cache-dir "auto-install/"))
(add-to-list 'load-path auto-install-directory)

(defvar js/auto-install-batch-urls
  '("https://raw.githubusercontent.com/Henry/dot-emacs/master/my-lisp/company-pcomplete.el"))

(setq auto-install-save-confirm nil)

(defun js/auto-install ()
  "Batch install non-vcs or straight packages."
  (auto-install-from-url-list js/auto-install-batch-urls))

(provide 'after/install-after)
