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

(defun ensure-file (&rest paths)
  (let* ((file (apply #'concat-path paths))
         (dir (file-name-directory file)))
    (make-directory dir t)
    (unless (file-exists-p file)
      (write-region "" nil file))
    file))

(defvar load-cust-order '(package function conf binding))
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

(defvar js/conf-dir (expand-file-name "conf" user-emacs-directory))

(defun js/new-conf (name)
  (interactive "sNew configuration name: ")
  (let ((cconfs (directory-files js/conf-dir t "[^\.]"))
        (nconf (expand-file-name name js/conf-dir)))
    (unless (member nconf cconfs)
      (let ((nconf-files
             (mapcar #'(lambda (f)
                        (expand-file-name
                         (concat (symbol-name f) ".el")
                         nconf))
                     load-cust-order)))
        (make-directory nconf t)
        (dolist (fi nconf-files)
          (with-current-buffer (find-file-noselect fi t t)
            (save-buffer)
            (kill-buffer))))
    )))

;; TODO: Fix new loader function so it actually does something.
;; (cl-defun js/new-loader-fix (name)
;;   "Create a new loader in the config directory"
;;   (let ((nstring (cond ((stringp name) name)
;;                        ((symbolp name) (symbol-name name))
;;                        (t (cl-return-from js/conf-dir))))
;;         (confs
;;          (directory-files js/conf-dir
;;                           nil
;;                           directory-files-no-dot-files-regexp)))
;;     (if (memq name confs)
;;         (print "Config Exists")
;;       (print "Config does not exist"))))

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

(defun js/distinct-rx (regx &optional buff)
  "Get a list with distinct matches of REGX"
  (let ((regex regx)
        (matches nil))
    (with-current-buffer (if (null buff)
                             (current-buffer)
                           (get-buffer buff))
      (goto-char (point-min))
      (while (condition-case err
                 (re-search-forward regex)
               (error nil))
        (add-to-list 'matches (buffer-substring-no-properties
                               (match-beginning 0) (match-end 0)))))
    matches))

(defun js/complete-subdirectories (base &optional prompt)
  (let* ((files (directory-files base t
                 directory-files-no-dot-files-regexp))
         (dirs (-filter 'file-directory-p files))
         (names (mapcar 'file-name-base dirs))
         (clean-dirs (-filter
                      '(lambda (n) (string-match-p "^[^\\.].*" n))
                      names)))
    (expand-file-name
     (completing-read
      (if prompt
          prompt
        (format "%s: " base))
      clean-dirs nil 'confirm)
     base)))

(provide 'util)
