;;; -*- lexical-binding: t; -*-

(defun js/ggtags-enable-and-update ()
  "Enable and setup ggtags.")

;; (leader-minor-def
;;   "'" '(:ignore t :wk "gtags")
;;   "' t" 'ggtags-mode)

(add-hook 'ggtags-mode-hook
          '(lambda () 
             (leader-minor-def
               :keymaps '(local)
               "' u" 'helm-gtags-update-tags
               "' p" 'helm-gtags-parse-file
               "' C" 'helm-gtags-create-tags
               "' f" 'helm-gtags-find-tag
               "' '" 'helm-gtags-dwim
               "' n" 'helm-gtags-next-history 
               "' p" 'helm-gtags-previous-history
               "' s" 'helm-gtags-select
               "' d" 'helm-gtags-find-tag
               "' D" 'helm-gtags-find-tag-other-window)))

(leader-primary-def
  :keymaps 'override
  "f z z" 'fzf
  "f z d" 'fzf-directory
  "f z g" 'fzf-git-files
  "f z p" 'fzf-projectile)

(leader-tert-def
  :keymaps 'override
  "p" 'list-processes
  "a" '(:ignore t :wk "Annotate")
  "a a" 'annotate-annotate
  "a A" 'annotate-mode
  "a s" 'annotate-save-annotations
  "a c" 'annotate-clear-annotations
  "a S" 'annotate-show-annotation-summary
  "a e" 'annotate-export-annotations
  )

(general-define-key
 :states '(normal visual motion)
 :keymaps '(process-menu-mode-map)
 :major-mode t
 "x" 'process-menu-delete-process)

(defun js/toggle-markdown-view ()
  "Toggle markdown view mode (for easier reading)"
  (interactive)
  (cond
   ((eq major-mode 'markdown-mode) (markdown-view-mode))
   ((eq major-mode 'markdown-view-mode)
    (markdown-mode)
    (read-only-mode -1))))


(leader-minor-def
  :keymaps '(markdown-mode-map markdown-view-mode-map)
  :major-modes t
  "," 'js/toggle-markdown-view
  "o" 'markdown-open
  "l" 'markdown-insert-link
  "s" 'markdown-show-all
  "c" 'markdown-hide-sublevels
  "C" 'markdown-hide-body
  "p" 'markdown-preview
  "e" 'markdown-export-and-preview
  "i" '(:ignore t :wk "Insert")
  "i q" 'markdown-insert-blockquote
  "i b" 'markdown-insert-bold
  "i i" 'markdown-insert-italic
  "i c" 'markdown-insert-code
  "i s" 'markdown-insert-strike-through
  "i C" 'markdown-insert-gfm-code-block
  "i f" 'markdown-insert-footnote
  "i x" 'markdown-insert-gfm-checkbox
  "i h" 'markdown-insert-header-dwim
  "i H" 'markdown-insert-header
  "i 1" 'markdown-insert-header-atx-1
  "i 2" 'markdown-insert-header-atx-2
  "i 3" 'markdown-insert-header-atx-3
  "i 4" 'markdown-insert-header-atx-4
  "i 5" 'markdown-insert-header-atx-5
  "i 6" 'markdown-insert-header-atx-6
  "i M-1" 'markdown-insert-header-setext-1
  "i M-2" 'markdown-insert-header-setext-2
  "i M-h" 'markdown-insert-header-setext-dwim
  "i r" 'markdown-insert-hr
  "i m" 'markdown-insert-image
  "i l" 'markdown-insert-link
  "i L" 'markdown-insert-inline-link-dwim
  "i k" 'markdown-insert-kbd
  "i n" 'markdown-insert-list-item
  "i p" 'markdown-insert-pre
  "i w" 'markdown-insert-wiki-link
  "i W" 'markdown-insert-reference-link-dwim
  "i t" 'markdown-insert-table
  "i u" 'markdown-insert-uri
  "t" '(:ignore t :wk "Toggle")
  "t c" 'markdown-toggle-fontify-code-blocks-natively
  "t x" 'markdown-toggle-gfm-checkbox
  "t m" 'markdown-toggle-inline-images
  "t h" 'markdown-toggle-markup-hiding
  "t a" 'markdown-toggle-math
  "t u" 'markdown-toggle-url-hiding
  "t l" 'markdown-toggle-wiki-links
  )

(general-define-key
 :states '(normal motion)
 :keymaps '(markdown-mode-map markdown-view-mode-map)
 :major-modes t
 "M->" 'markdown-promote
 "M-<" 'markdown-demote
 "M-l" 'markdown-outline-next
 "M-h" 'markdown-outline-previous
 "M-j" 'markdown-outline-next-same-level
 "M-k" 'markdown-outline-previous-same-level
 "C-M-j" 'markdown-move-down
 "C-M-k" 'markdown-move-up
 "TAB" 'markdown-cycle
 [return] 'js/md-ctx-enter
 )

