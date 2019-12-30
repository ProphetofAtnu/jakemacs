;;; -*- lexical-binding: t; -*-

;; (general-unbind 'insert
;;   "C-k"
;;   "C-y"
;;   "C-t"
;;   "C-d"
;;   "C-n"
;;   "C-p"
;;   "C-a"
;;   "C-e")

;; (general-def 'insert
;;   "C-n" 'next-line
;;   "C-p" 'previous-line
;;   "C-<" 'evil-shift-left-line
;;   "C->" 'evil-shift-right-line
;;   "C-d" 'delete-char
;;   "M-d" 'kill-word
;;   "C-a" 'beginning-of-line-text
;;   "C-e" 'end-of-line)

(with-eval-after-load 'company
  (general-def 'insert
    "TAB" 'company-indent-or-complete-common))
