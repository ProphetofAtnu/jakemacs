;;; -*- lexical-binding: t; -*-

;; Mode Specific Top Level Bindings:

(general-define-key
 :states '(visual motion)
 :keymaps 'org-mode-map
 "<return>" 'js/org-context-ret)


(leader-minor-def
  :states '(normal visual insert emacs override)
  :keymaps '(org-mode-map)
  :major-modes t
  "," 'org-goto
  ;; "/" 'helm-org-rifle
  ;; "f" 'helm-org-rifle-org-directory
  "z" 'org-add-note
  "a" 'org-attach
  "s" 'org-sort
  "r" 'org-refile
  ";" 'js/org-refresh-id
  "." 'org-agenda
  "t" 'org-sticky-header-mode
  ;; "o" 'helm-org-agenda-files-headings
  "l" '(:ignore t :wk "Link")
  "l y" 'org-store-link
  "l p" 'org-insert-last-stored-link
  "l i" 'org-insert-link
  "l P" 'org-insert-all-links
  "i" '(:ignore t :wk "Ins/Conv/Tog")
  "i h" 'org-insert-heading
  "i H" 'org-insert-subheading
  "i r" 'org-insert-heading-respect-content
  "i a" 'org-insert-heading-after-current
  "i l" 'org-insert-link
  "i t" 'org-table-create-or-convert-from-region
  "i d" 'org-insert-todo-heading
  "i D" 'org-insert-todo-subheading
  "m" '(:ignore t :wk "Toggle")
  "m i" 'org-toggle-item
  "m c" 'org-toggle-checkbox
  "m h" 'org-toggle-heading
  )

(leader-tert-def
  "," 'org-agenda
  "n" 'deft
  "o" 'js/org-search
  )

