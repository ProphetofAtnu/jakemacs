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
