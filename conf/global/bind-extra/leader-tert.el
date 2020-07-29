;;; -*- lexical-binding: t; -*-

(use-package magit
  :commands (magit))

(defun text-scale-reset ()
  "Reset the scale to 0 in text-scale-mode"
  (interactive)
  (text-scale-set 0))

(defhydra hydra-scale-text (:color red)
  "Scale Text:
+ />/l/k -> increase | -/</j/h -> decrease 
m -> Toggle Mode     | r -> reset"
  ("+" text-scale-increase nil)
  (">" text-scale-increase nil)
  ("l" text-scale-increase nil)
  ("k" text-scale-increase nil)
  ("-" text-scale-decrease nil)
  ("<" text-scale-decrease nil)
  ("j" text-scale-decrease nil)
  ("h" text-scale-decrease nil)
  ("r" text-scale-reset)
  ("m" text-scale-mode))

(general-create-definer leader-tert-def
  :states '(normal visual motion insert emacs override)
  :prefix leader-tertiary
  :non-normal-prefix alt-tertiary)

(general-define-key
 :prefix-map 'inferior-shell-selection-map
 "t" 'term
 "a" 'ansi-term
 "s" 'shell
 "i" 'ielm
 "y" 'sly
 "g" 'gorepl-run
 "n" 'nodejs-repl
 "w" 'skewer-repl)

(leader-tert-def
  "" nil
  "t" `(,inferior-shell-selection-map :wk "Inf. Shell")
  "e" 'eww
  "r" 'treemacs
  "b" 'bookmark-bmenu-search
  "g" 'magit
  "RET" 'ace-link
  ;; "m" 'helm-mode-manager
  ;; "\\" 'helm-mini
  "\\" 'imenu
  "|" 'imenu-anywhere
  "l" 'avy-goto-line)

(leader-tert-def
  "x" '(:ignore t :wk "Text")
  "x x" 'indent-region
  "x f" 'hydra-scale-text/body
  "x +" 'hydra-scale-text/text-scale-increase
  "x =" 'hydra-scale-text/text-scale-increase
  "x -" 'hydra-scale-text/text-scale-decrease
  "x X" 'indent-rigidly
  "x q" 'auto-fill-mode
  "x m" 'automargin-mode
  "x u" 'downcase-region
  "x U" 'upcase-region
  "x t" 'transpose-words
  "x T" 'transpose-lines
  "x c" 'evil-align-center
  "x a" 'align-regexp
  "x A" 'align-entire
  "x s" 'sort-lines
  "x S" 'sort-lines-reverse
  "x k" 'keep-lines
  "x K" 'delete-matching-lines)

(leader-tert-def
  "z" '(:ignore t :wk "Debug :3")
  "z s" 'straight-use-package
  "z p" 'straight-get-recipe
  "z d" 'toggle-debug-on-error
  "z f" 'debug-on-entry
  "z F" 'debugger-list-functions
  "z v" 'debug-on-variable-change
  "z c" 'company-diag
  "z k" '((lambda ()
            (interactive)
            (let ((ev (read-event)))
              (message "Key: %s -> Event: %s\nModifiers: %s\nBasic: %s"
                       (single-key-description ev)
                       ev
                       (event-modifiers ev)
                       (event-basic-type ev)))) :wk "Dump event")
  "z m" 'jump-messages)

;; (general-define-key :keymaps 'local
;;                     [M-return] '(lambda ()
;;                                   (interactive)
;;                                   (message "You hit ret")
;;                                   (self-insert-command 1)))


