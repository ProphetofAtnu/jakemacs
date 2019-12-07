;; -*- lexical-binding: t; -*-
(require 'cl-lib)

(defun ensure-dir (&rest paths)
  "Concatinates and returns the specified path, creating it if it does not exist"
  (let ((dir (car paths))
	(cpaths (cdr paths)))
    (dolist (part cpaths)
      (setf dir (expand-file-name part dir)))
    (unless (file-directory-p dir) (make-directory dir t))
    dir))

(defun concat-path (&rest paths)
  "Concatinates and returns the specified path"
  (let ((dir (car paths))
	(cpaths (cdr paths)))
    (dolist (part cpaths)
      (setf dir (expand-file-name part dir)))
    dir))

;; (defmacro function-exclusion (func pred)
;;   "")

(defvar load-cust-order '(package conf function binding))
(defvar load-cust-use-misc-files t)

(defun loadif (path)
  "Load file if it is available"
  (when (file-exists-p path) (load path)))

;; (defun load-cust (name)
;;   "Load a custom config from the cust directory
;; Uses the directory \"user-emacs-directory/conf/\""
;;   (let ((cust-dir (concat-path user-emacs-directory "cust")))
;;     (let* ((conf-dir (concat-path cust-dir name))
;; 	   (files (directory-files
;; 		    t directory-files-no-dot-files-regexp)))
;;       (unless (zerop (length files))
;; 	(dolist (f load-cust-order)
;; 	  (loadif (
