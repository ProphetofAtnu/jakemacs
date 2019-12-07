;;; init.el ---                                      -*- lexical-binding: t; -*-

(load (expand-file-name "lib/util.el" user-emacs-directory))
;; Set the cache directory before I even start...
(setq user-cache-dir (ensure-dir user-emacs-directory ".cache"))
(setq backup-directory-alist `(("." . ,(ensure-dir user-cache-dir "bak"))))

;; Bootstrap Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))



(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(load "~/.emacs.d/install")
(load "~/.emacs.d/base")

(load (concat-path user-emacs-directory "rootconf"))

;; Load active configs
(dolist (act active-configs)
  (load-cust act))

;; Finally, the aesthetic changes
(load "~/.emacs.d/aesthetic")
