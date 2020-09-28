;;; -*- lexical-binding: t; -*-
(defvar org-directory "~/org")

(use-package org
  :defer t
  :init
  (setq org-hide-emphasis-markers t
        org-clock-persist-file (expand-file-name "org-clock-save.el" user-cache-dir)
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
        org-todo-keyword-faces '(("TODO" . (:foreground "orange" :weight bold :underline t))
                                 ("PROG" . (:foreground "blue" :weight bold :underline t))
                                 ("HOLD" . (:foreground "yellow" :weight bold :underline t))
                                 ("ND" . (:foreground "purple" :weight bold :underline t))
                                 ("CANNED" . (:foreground "pink" :weight bold :underline t))
                                 ("DONE" . (:foreground "green" :weight bold :underline t))))
  :config
  (use-package ob))

(use-package org-id
  :init
  (defvar org-refile-targets nil)
  (setq 
   org-id-track-globally t
   org-id-link-to-org-use-id 'use-existing
   org-id-locations-file (expand-file-name ".org-id-locations" user-cache-dir))
  (add-to-list 'org-refile-targets '(org-id-files . (:maxlevel . 4)))
  (org-link-set-parameters "id"
                           :complete 'org-id-get-with-outline-path-completion)
  (add-hook 'org-mode-hook #'visual-line-mode))

(use-package org-starter
  :delight
  :init
  (setq org-starter-path '("~/org/")
        org-starter-load-config-files t)
  :config
  (org-starter-mode))

(use-package org-agenda
  :init
  (setq org-agenda-skip-unavailable-files t))

(use-package org-indent
  :hook (org-mode . org-indent-mode))

(use-package org-src
  :after (org))

(use-package deft
  :init
  (add-to-list 'evil-emacs-state-modes 'deft-mode)
  (setq deft-directory org-directory)
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  (setq deft-default-extension "org")
  (setq deft-use-filter-string-for-filename t)
  (setq deft-file-naming-rules
        '((nospace . "-")
          (case-fn . downcase))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

;; (use-package evil-org
;;   :hook (org-mode . evil-org-mode)
;;   :after org
;;   :config
;;   (evil-org-set-key-theme '(navigation insert return textobjects additional calendar shift todo heading calendar)))

(use-package evil-org-agenda
  :commands (evil-org-agenda-set-keys)
  :hook (org-agenda-mode . evil-org-agenda-set-keys))

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (org-projectile-per-project)
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(use-package org-sticky-header
  :commands (org-sticky-header-mode))

;; (use-package org-journal
;;   :commands (org-journal-search-forever org-journal-new-entry))

(use-package org-download
  :hook ((org-mode . org-download-enable)
         (dired-mode . org-download-enable))
  :init
  (setq org-download-method 'attach))

(use-package org-mime
  :defer t)

(with-eval-after-load 'ivy
  (use-package ivy-omni-org
    :commands (ivy-omni-org))
  )

(with-eval-after-load 'helm
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
 )

(use-package poporg)
