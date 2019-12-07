;;; init.el ---                                      -*- lexical-binding: t; -*-

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

(load (expand-file-name "lib/util.el" user-emacs-directory))

(setq user-cache-dir (ensure-dir user-emacs-directory ".cache"))

(setq backup-directory-alist `(("." . ,(ensure-dir user-cache-dir "bak"))))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(recentf-mode 1)


(load "~/.emacs.d/install")
(load "~/.emacs.d/base")
(load "~/.emacs.d/aesthetic")

