;;; -*- lexical-binding: t; -*-

(general-defs
  :states '(motion normal emacs)
  :keymaps '(ibuffer-mode-map dired-mode-map)
  "?" 'which-key-show-major-mode)

;; Ibuffer hydra
(major-mode-hydra-define ibuffer-mode nil
  ("Run"
   (("E" ibuffer-do-eval)
    ("W" ibuffer-do-view-and-eval)
    ("F" ibuffer-do-shell-command-file)
    ("!" ibuffer-do-shell-command-file)
    ("=" ibuffer-diff-with-file)
    ("N" ibuffer-do-shell-command-pipe-replace)
    ("|" ibuffer-do-shell-command-pipe)
    ("R" ibuffer-do-rename-uniquely)
    ("V" ibuffer-do-revert)
    ("X" ibuffer-bury-buffer)
    ("S" ibuffer-do-save)
    ("K" ibuffer-do-kill-lines)
    ("D" ibuffer-do-delete)
    ("P" ibuffer-do-print)
    ("x" ibuffer-do-kill-on-deletion-marks))

   "Show"
   (("A" ibuffer-do-view)
    ("H" ibuffer-do-view-other-frame)
    ("J" ibuffer-jump-to-buffer)
    ("M-g" ibuffer-jump-to-buffer)
    ("M-j" ibuffer-jump-to-filter-group)
    ("M-n" ibuffer-forward-filter-group)
    ("M-o" ibuffer-visit-buffer-1-window)
    ("M-g" ibuffer-jump-to-buffer)
    ("M-j" ibuffer-jump-to-filter-group)
    ("+" ibuffer-add-to-tmp-show)
    ("-" ibuffer-add-to-tmp-hide)
    ("M-o" ibuffer-visit-buffer-1-window)
    ("C-o" ibuffer-visit-buffer-other-window-noselect)
    ("C-t" ibuffer-visit-tags-table))

   "Mark/Toggle"
   (("`" ibuffer-switch-format)
    ("," ibuffer-toggle-sorting-mode)
    ("." ibuffer-mark-old-buffers)
    ("~" ibuffer-toggle-marks)
    ("M-DEL" ibuffer-unmark-all)
    ("DEL" ibuffer-unmark-backward)
    ("T" ibuffer-do-toggle-read-only)
    ("M" ibuffer-do-toggle-modified)
    ("d" ibuffer-mark-for-delete)
    ("m" ibuffer-mark-forward)
    ("u" ibuffer-unmark-forward)
    ("t" ibuffer-do-toggle-modified)
    ("U" ibuffer-unmark-all-marks))

   "Navigate"
   (("I" ibuffer-do-query-replace-regexp)
    ("O" ibuffer-do-occur)
    ("C-y" ibuffer-yank)
    ("r" ibuffer-do-replace-regexp)
    ("Q" ibuffer-do-query-replace)
    ("<backtab>" ibuffer-backward-filter-group)
    ("RET" ibuffer-toggle-filter-group)
    ("TAB" ibuffer-forward-filter-group)
    ("C-k" ibuffer-backward-filter-group)
    ("{" ibuffer-backwards-next-marked)
    ("}" ibuffer-forward-next-marked)
    ("M-n" ibuffer-forward-filter-group)
    ("M-p" ibuffer-backward-filter-group)
    ("M-{" ibuffer-backwards-next-marked)
    ("M-}" ibuffer-forward-next-marked))
   ))

(leader-tert-def
  "r" 'counsel-tramp
  "R" 'tramp-cleanup-all-buffers)
