;;; -*- lexical-binding: t; -*-
(defvar org-directory (expand-file-name "~/org"))

(use-package org-id
  :defer t
  :config
  (org-link-set-parameters "id"
                           :complete 'org-id-get-with-outline-path-completion))

(use-package org
  :defer t
  :init
  (setq org-hide-emphasis-markers t
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
        org-goto-interface 'outline-path-completion
        org-outline-path-complete-in-steps nil
        org-refile-targets
        '((org-agenda-files . (:maxlevel . 4)))
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-imenu-depth 8)
  ;; Keywords
  (use-package org-attach)
  (setq org-todo-keywords '((type "TODO(t)"
                                  "PROG(p)"
                                  "HOLD(h)"
                                  "ND(n)"
                                  "|"
                                  "CANNED(c)"
                                  "DONE(d)"))
        org-todo-keyword-faces '(("TODO" . orange)
                                 ("PROG" . blue)
                                 ("HOLD" . yellow)
                                 ("ND" . purple)
                                 ("CANNED" . pink)
                                 ("DONE" . green)))
  :config
  (use-package ob))

(use-package org-agenda
  :commands (org-agenda)
  :config
  (setq org-agenda-files (ensure-file user-cache-dir ".org_agenda")))

(use-package org-indent
  :hook (org-mode . org-indent-mode))

(use-package org-src
  :after (org))

(use-package deft
  :init
  (add-to-list 'evil-emacs-state-modes 'deft-mode)
  (setq deft-directory org-directory)
  (setq deft-recursive t)
  (setq deft-use-filename-as-title nil)
  (setq deft-default-extension "org")
  (setq deft-use-filter-string-for-filename t)
  (setq deft-file-naming-rules
        '((nospace . "-")
          (case-fn . downcase))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package evil-org
  :hook (org-mode . evil-org-mode)
  :after org
  :config
  (evil-org-set-key-theme '(navigation insert return textobjects additional calendar shift todo heading calendar)))

(use-package evil-org-agenda
  :commands (evil-org-agenda-set-keys)
  :hook (org-agenda-mode . evil-org-agenda-set-keys))

(use-package helm-org
  :commands (helm-org-agenda-files-headings
             helm-org-in-buffer-headings
             helm-org-parent-headings
             helm-org-capture-templates))

(use-package helm-org-rifle
  :commands (helm-org-rifle-occur-org-directory)
  :config
  (general-define-key
   :states '(normal motion)
   :keymaps 'helm-org-rifle-occur-map
   "RET" 'helm-org-rifle-occur-goto-entry))
;; https://github.com/alphapapa/org-rifle
;; for when the bindings come around...

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (setq org-projectile-projects-file
          (concat-path org-directory "project.org"))
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(use-package org-sticky-header
  :hook (org-mode . org-sticky-header-mode))

(use-package org-journal
  :commands (org-journal-search-forever org-journal-new-entry))

(use-package org-download
  :hook ((org-mode . org-download-enable)
         (dired-mode . org-download-enable))
  :init
  (setq org-download-method 'attach))

(use-package org-mime
  :defer t)
