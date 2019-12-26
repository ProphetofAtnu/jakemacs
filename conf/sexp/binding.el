;;; -*- lexical-binding: t; -*-

;; Map some lispy defuns to insert mode
(general-defs '(insert) 'lispy-mode-map
  "M-)" 'lispy-wrap-round
  "M-(" 'lispy-wrap-round
  "M-{" 'lispy-wrap-braces
  "M-}" 'lispy-wrap-braces
  "M-n" 'lispy-left
  "M-d" 'lispy-kill-word
  "M-)" 'lispy-wrap-round
  "M-s" 'lispy-splice
  "M-r" 'lispy-raise-sexp
  "M-R" 'lispy-raise-some
  "M-C" 'lispy-convolute-sexp
  "M-S" 'lispy-split
  "M-J" 'lispy-join
  "M-(" 'lispy-wrap-round
  "M-{" 'lispy-wrap-braces
  "M-}" 'lispy-wrap-braces
  "M-y" 'lispy-new-copy
  "M-k" 'lispy-move-up
  "M-j" 'lispy-move-down
  "M-o" 'lispy-string-oneline
  "M-p" 'lispy-clone
  "M-d" 'evil-collection-lispy-delete
)

(when (featurep 'projectile)
  (general-defs '(insert) 'lispy-mode-map
    "V" 'projectile-find-file-dwim))
