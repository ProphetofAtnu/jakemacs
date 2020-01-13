;;; init.el ---                                      -*- lexical-binding: t; -*-
;;(load (expand-file-name "lib/util.el" user-emacs-directory)) 
(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

;; See https://www.emacswiki.org/emacs/BackupDirectory
(require 'util)

;; Set the cache directory before I even start...
(setq user-cache-dir (ensure-dir user-emacs-directory ".cache"))

(setq custom-file (concat-path user-cache-dir "custom.el"))
;; Fonts need to be set asap
(set-face-attribute 'default t :font "DejaVu Sans Mono-12")
(set-frame-font "DejaVu Sans Mono-12" nil t)

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

;; Install everything at the beginning
(require 'install)

(require 'after/install-after)

;; After packages have been installed...
(require 'better-defaults)
(require 'delight)
(require 'use-package)
(require 'auto-minor-mode)
(require 'load-relative)
(require 'mode-local)

;;(add-to-list 'load-path user-emacs-directory)

;; Configure everything
(require 'base)

;;(load (concat-path user-emacs-directory "rootconf"))
(require 'rootconf)

;; Load active configs
(dolist (act active-configs)
  (load-cust act))

;; Finally, the aesthetic changes
(require 'aesthetic)

;; I doubt I'll ever use custom, but what the heck?
(load custom-file)

(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; <(nothing)>
