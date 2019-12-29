;;; -*- lexical-binding: t; -*-

(use-package org
  :defer t
  :init
  (setq org-directory (expand-file-name "~/org")
        org-hide-emphasis-markers t
        org-clock-persist-file (expand-file-name "org-clock-save.el" user-cache-dir)
        org-id-link-to-org-use-id 'use-existing
        org-id-locations-file (expand-file-name ".org-id-locations" user-cache-dir)
        org-publish-timestamp-directory (ensure-dir user-cache-dir ".org-timestamps/")
        org-default-notes-file (expand-file-name "catchall.org" org-directory)
        org-log-done-with-time t
        org-startup-with-inline-images t
        org-latex-prefer-user-labels t
        org-blank-before-new-entry '((heading . t)
                                     (plain-list-item . nil))
        org-image-actual-width nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-imenu-depth 8)
  ;; Keywords
  (setq org-todo-keyword-faces '(("TODO" . orange)
                               ("PROG" . blue)
                               ("HOLD" . yellow)
                               ("ND" . purple)
                               ("CANNED" . pink)
                               ("DONE" . green))))

(use-package org-indent
  :hook (org-mode . org-indent-mode))

(use-package org-src
  :after (org))

(use-package deft
  :init
  (setq deft-directory org-directory)
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  (setq deft-file-naming-rules '((nospace . "-"))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package evil-org
  :hook (org-mode . evil-org-mode)
  :after org
  :config
  (evil-org-set-key-theme '(navigation insert textobjects additional calendar)))

(use-package helm-org
  :commands (helm-org-agenda-files-headings
             helm-org-in-buffer-headings
             helm-org-parent-headings
             helm-org-capture-templates))

(use-package helm-org-rifle)
;; https://github.com/alphapapa/org-rifle
;; for when the bindings come around...

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (setq org-projectile-projects-file
          (concat-path org-directory "project.org"))
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(use-package org-sticky-header
  :hook (org-mode . org-sticky-header-mode))

(use-package org-journal
  :commands (org-journal-search-forever org-journal-new-entry))

(use-package org-download
  :hook (org-mode . org-download-enable)
  :init
  (setq org-download-method 'attach))

(use-package org-mime)
