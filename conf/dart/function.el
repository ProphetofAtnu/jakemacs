;;; -*- lexical-binding: t; -*-
(require 'projectile)
(require 'dap-mode)

(defun js/get-dart-project-binaries ()
  (let* ((root (projectile-project-root))
         (subdir (directory-files root)))
    (if (member "bin" subdir)
        (let* ((root-full (expand-file-name root))
               (bindir (expand-file-name "bin" root))
               (binsfiles (directory-files
                           bindir
                           t
                           directory-files-no-dot-files-regexp))
               (bins (-filter
                      '(lambda
                         (file)
                         (string-match-p "\\.dart" file))
                      binsfiles)))
          (mapcar
           (lambda (b)
             (file-relative-name
              b
              root-full))
           bins)))))

(defun js/dap-setup-dart-templates ()
  (let ((templates (mapcar
                    (lambda (file)
                      (cons (format "Run %s" file)
                            (list
                             :type "dart"
                             :request "launch"
                             :program file)))
                    (js/get-dart-project-binaries))))
    (mapc
     (lambda (temp)
       (dap-register-debug-template (car temp) (cdr temp)))
     templates)))

(defvar angular-components-dir nil)

(defun js/dart--project-p ()
  "Detects if the buffer file is a part of a dart project"
  (let ((root (projectile-project-root
               default-directory)))
    (if (and root
             (directory-files
              root
              nil
              "pubspec.yaml"))
        t
      nil)))

(defun js/dart--template-referenced-p ()
  "Detects a sibling file to the current HTML file with a .dart
  extension."
  (let ((bname (file-name-base (buffer-file-name)))
        (dartfiles (directory-files default-directory nil "\\.dart")))
    (if (member bname (mapcar (lambda (file)
                                (file-name-base file))
                              dartfiles))
        t nil)))

(defvar-local angular-components-dir nil
  "Making this a directory-local variable will declare html files
  in that directoryq to be AngularDart templates.")

(defun js/dart-html-angular-tmpl-p ()
  "Detects if the HTML file is a template based on the following
  criteria: 

1. Is the file in a Dart project? (root has a pubspec.yaml file)

2. Does the file have a corresponding .dart file?

3. Is the directory marked by the non-nil dir-local variable
`angular-components-dir'?

If one and two are satisfied OR three is satisfied, the file is
determined to be an AngularDart template."

  (or
   (and (js/dart--project-p)
        (js/dart--template-referenced-p))
   angular-components-dir))
