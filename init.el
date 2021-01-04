;;; init.el ---                                      -*- lexical-binding: t; -*-
(defvar js/after-init-hook nil
  "Hook that runs after init.el has completely loaded")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
;;(load (expand-file-name "lib/util.el" user-emacs-directory)) 
(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "misc" user-emacs-directory))

;; Add my custom packages to the load path
(mapc
 (lambda (dir)
   (add-to-list 'load-path dir))
 (directory-files
  (expand-file-name
   "jpkgs"
   user-emacs-directory)
  t
  directory-files-no-dot-files-regexp))


;; See https://www.emacswiki.org/emacs/BackupDirectory
(require 'util)

(setq user-cache-dir (ensure-dir user-emacs-directory ".cache"))
(setq custom-file (concat-path user-cache-dir "custom.el"))

;; Set the cache directory before I even start...

(defvar user-src-dir (expand-file-name "~/.install")
  "The directory to use to auto-install and compile binaries from
  source (see rust/elixir)")

(let ((e (getenv "USR_SRC_DIR")))
  (when e 
    (setq user-src-dir e)))

(defvar js/overrides-file-name
  (expand-file-name
      "local.el"
      user-emacs-directory))

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

(require 'early/early-package)
(require 'early/early-config)

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
(setq custom-file (concat-path user-cache-dir "custom.el"))
(load custom-file)

(condition-case err
    (load js/overrides-file-name)
  (file-missing
   (progn
     (ensure-file js/overrides-file-name)
     (message (format "Created %s" js/overrides-file-name)))))

(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(run-hooks 'js/after-init-hook)

;; <(nothing)>
