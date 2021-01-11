;;; -*- lexical-binding: t; -*-
(use-package org
  :commands (org-map-entries))

(use-package org-id
  :commands (org-id-update-id-locations
             org-id-get-create))

(defun js/all-org-files ()
  "Returns a list of all org files except for temp files"
  (let* ((orgfile (directory-files-recursively
                   org-directory
                   ".org$"))
         (not-temp (-filter
                    #'(lambda (fn)
                        (not (string-match-p
                              "#"
                              (file-name-base fn))))
                    orgfile)))
    not-temp))

(defun js/org-index-buffer ()
  "Generates IDs for any heading that is currently missing one in
the current buffer"
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (while (outline-previous-heading)
      (org-id-get-create))))

;; (org-map-entries #'(lambda ()
;;                      (let ((org-map-continue-from (point-min)))
;;                        (org-id-get-create)))
;;                  t nil))

(defun js/all-org-buffers ()
  "Return a list of all open org buffers"
  (-filter '(lambda (buf)
              (with-current-buffer buf
                (if (and (buffer-live-p buf) (eq major-mode 'org-mode))
                    (buffer-file-name)
                  nil)))
           (buffer-list)))

(defun js/org-index-directory ()
  "Generates IDs for any heading that is currently missing one in
the org dir."
  (interactive)
  (let ((org-mode-hook nil))
    (cl-flet ((get-org-bufs 
               () 
               (-filter #'(lambda (buf) 
                            (with-current-buffer buf 
                              (eq major-mode 'org-mode)))
                        (buffer-list))))
      (let ((old-bufs (get-org-bufs)))
        (org-map-entries #'(lambda () (org-id-get-create)) t (js/all-org-files) 'archive)
        (dolist (buf (get-org-bufs))
          (with-current-buffer buf
            (save-buffer)
            (unless (memq buf old-bufs)
              (kill-current-buffer)))))))) 

;; (debug-on-entry 'js/org-index-directory)

(require 'async)

(defun js/org-index-async ()
  (message "Updating org ID Index in Subprocess")
  (let ((org-files (js/all-org-files)))
    (async-start
     `(lambda ()
        (require 'org-id)
        (require 'org)
        (let ((org-mode-hook nil)
              (after-save-hook nil)
              (org-id-locations-file ,org-id-locations-file))
          (org-map-entries '(lambda () (org-id-get-create)) t (list ,@org-files))
          (org-save-all-org-buffers)
          nil))

     (lambda (result)
       (message "ID Database updated")
       (org-id-update-id-locations org-files)))))

(defvar js/async-org t
  "Non nil to use custom asynchronous functions in org-mode.")

(defun js/org-refresh-id ()
  "Refresh the org ID index"
  (interactive)
  (message "Generating/Updating Org IDs from `%s'" org-directory)
  (if js/async-org
      (js/org-index-async) 
    (progn (js/org-index-directory)
           (org-id-update-id-locations (js/all-org-files))
           (message "Done Retrieving IDs from org files."))))
  ;; (remove-hook 'org-mode-hook #'js/org-refresh-id))


;; (add-hook 'org-mode-hook #'js/org-refresh-id)

(defun js/org-mode-init ()
  (add-hook 'before-save-hook
            '(lambda ()
               (js/org-index-buffer))
            nil t))

;; (add-hook 'org-mode-hook 'js/org-mode-init)

(defhydra hydra-org-headline (:color teal)
  "Manage Headlines (Exit with q/c/ESC)"
  ("<return>" org-cycle "Visibility")
  ("p" org-previous-visible-heading "Prevous Visible" :color red :column "Nav")
  ("k" org-backward-heading-same-level "Prevous Heading" :color red)
  ("n" org-next-visible-heading "Next Visible" :color red)
  ("j" org-forward-heading-same-level "Next Heading" :color red)
  ("l" show-subtree "Next Heading" :color red)
  ("h" hide-subtree "Prevous Heading" :color red)
  ("<tab>" org-cycle "Cycle Visibility" :color red) 
  ("d" org-todo "Todo Cycle" :color red :column "Set")
  ("t" org-set-tags-command "Set Tags")
  ("," org-priority "Set Priority")
  ("a" org-attach "Attach")
  ("z" org-add-note "New Note")
  ("P" org-set-property "Set Property")
  ("r" org-refile "Refile" :column "Move")
  ("H" org-promote-subtree "Promote" :color red) 
  ("L" org-demote-subtree "Demote" :color red) 
  ("J" org-move-subtree-down "Subtree Down" :color red) 
  ("K" org-move-subtree-up "Subtree Up" :color red) 
  ("x" org-archive-subtree "Archive")
  ("X" org-archive-subtree "Archive (no quit)" :color red)
  ("q" nil nil)
  ("<escape>" nil nil)
  ("c" nil nil))


(defun js/org-context-ret ()
  "Context specifiic return in org mode, kiefed from DOOM emacs"
  (interactive)
  (let* ((context (org-element-context))
         (type (org-element-type context)))
    (while (and context (memq type '(verbatim code bold italic underline strike-through subscript superscript)))
      (setq context (org-element-property :parent context)
            type (org-element-type context)))
    (pcase type
      (`headline (hydra-org-headline/body))

      (`footnote-reference
       (org-footnote-goto-definition (org-element-property :label context)))

      (`footnote-definition
       (org-footnote-goto-previous-reference (org-element-property :label context)))

      ((or `table `table-row)
       (if (org-at-TBLFM-p)
           (org-table-calc-current-TBLFM)
         (ignore-errors
           (save-excursion
             (goto-char (org-element-property :contents-begin context))
             (org-call-with-arg 'org-table-recalculate (or arg t))))))

      (`table-cell
       (org-table-blank-field)
       (org-table-recalculate)
       (when (and (string-empty-p (string-trim (org-table-get-field)))
                  (bound-and-true-p evil-local-mode))
         (evil-change-state 'insert)))

      (`src-block)

      (`link
       (let* ((lineage (org-element-lineage context '(link) t))
              (path (org-element-property :path lineage)))
         (org-open-at-point)))

      ((guard (org-element-property :checkbox (org-element-lineage context '(item) t)))
       (let ((match (and (org-at-item-checkbox-p) (match-string 1))))
         (org-toggle-checkbox (if (equal match "[ ]") '(16)))))

      (_ (evil-ret))))
  )

(defun js/org-search ()
  "Run rg over the org directory"
  (interactive)
  (counsel-rg nil org-directory "-M 80" "Org Search: "))

(defun js/org-dir-file ()
  (interactive)
  (if (featurep 'ivy)
      (ivy-read "Org File:" (js/all-org-files)
                :action  '(1
                           ("o" find-file "find file")
                           ("j" find-file-other-window "other window")
                           ("f" find-file-other-frame "other frame")
                           ("x" counsel-find-file-extern "open externally")
                           ("R" find-file-read-only "read only")
                           ("c" counsel-find-file-copy "copy file")
                           ("m" counsel-find-file-move "move or rename")
                           ("d" counsel-find-file-mkdir-action "mkdir")))
    (let ((fn
           (completing-read
            "Org File:"
            (js/all-org-files))))
      (find-file fn))))

(defun js/org-pop-org-dir ()
  "Open the org directory"
  (interactive)
  (let ((bufn (save-window-excursion 
                (dired org-directory))))
    (pop-to-buffer bufn)))

