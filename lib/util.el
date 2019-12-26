;;; -*- lexical-binding: t; -*-
(require 'cl-lib)

(defun ensure-dir (&rest paths)
  "Concatinates and returns the specified path, creating it if it does not exist"
  (let ((dir (car paths))
        (cpaths (cdr paths)))
    (dolist (part cpaths)
      (setf
       dir
       (expand-file-name part dir)))
    (unless (file-directory-p dir)
      (make-directory dir t))
    dir))

(defun concat-path (&rest paths)
  "Concatinates and returns the specified path"
  (let ((dir (car paths))
        (cpaths (cdr paths)))
    (dolist (part cpaths)
      (setf
       dir
       (expand-file-name part dir)))
    dir))

(defvar load-cust-order '(package conf function binding))
;; (defvar load-cust-use-misc-files t)

(defun load-cust (name)
  "Load a custom config from the cust directory
Uses the directory \"user-emacs-directory/conf/\""
  (let ((cust-dir (concat-path
                   user-emacs-directory
                   "conf")))
    (let* ((conf-dir (concat-path
                      cust-dir
                      (symbol-name name)))
           (loaded '()))
      (dolist (file
               load-cust-order
               (reverse loaded))
        (let ((file-path (expand-file-name
                          (symbol-name file)
                          conf-dir)))
          (load file-path t)
          (push file-path loaded))))))

(defmacro with-eval-after-multi (files &rest body)
  "with-eval-after-load for multiple features. 

Files is a list of features or files in order of precidence, and
body are forms to be evaluated."
  (let* ((ord (reverse files))
         (anon `(lambda () ,@body))
         (form anon))
    (dolist (file ord form)
      (setf
       form
       `(with-eval-after-load
            ',file
          ,form)))))

(defmacro when-feature (feature &rest body)
  "Macro to a when macro with a feature predicate"
  `(when
       (featurep ',feature)
     ,@body))

(defmacro unless-feature (feature &rest body)
  "Macro expanding to an unless macro with a feature predicate"
  `(unless
       (featurep ',feature)
     ,@body))
