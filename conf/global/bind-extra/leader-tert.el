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
 :prefix-command 'js/inferior-shell-prefix-command
 :prefix-map 'js/inferior-shell-prefix-map
 "t" 'term
 "a" 'ansi-term
 "s" 'shell
 "i" 'ielm
 "y" 'sly
 "g" 'gorepl-run
 "n" 'nodejs-repl
 "w" 'skewer-repl)

(defun js/dump-keymap-to-buffer ()
  (interactive)
  (let ((cmap (which-key--get-current-bindings)))
    (with-current-buffer-window
        (get-buffer-create
         "*key-dump*")
        'switch-to-buffer-other-window
        nil
      (erase-buffer)
      (insert (pp-to-string cmap)))))

(general-define-key
 :prefix-command 'js/debug-prefix-command
 :prefix-map 'js/debug-prefix-map
  "s" 'straight-use-package
  "p" 'straight-get-recipe
  "d" 'toggle-debug-on-error
  "f" 'debug-on-entry
  "F" 'debugger-list-functions
  "v" 'debug-on-variable-change
  "c" 'company-diag
  "k" '((lambda ()
            (interactive)
            (let ((ev (read-event)))
              (message "Key: %s -> Event: %s\nModifiers: %s\nBasic: %s"
                       (single-key-description ev)
                       ev
                       (event-modifiers ev)
                       (event-basic-type ev)))) :wk "Dump event")
  "w" 'js/dump-keymap-to-buffer
  "m" 'jump-messages)

(leader-tert-def
  :prefix-command 'js/text-prefix-command
  :prefix-map 'js/text-prefix-map
  "x" 'indent-region
  "f" 'hydra-scale-text/body
  "+" 'hydra-scale-text/text-scale-increase
  "=" 'hydra-scale-text/text-scale-increase
  "-" 'hydra-scale-text/text-scale-decrease
  "X" 'indent-rigidly
  "q" 'auto-fill-mode
  "m" 'automargin-mode
  "u" 'downcase-region
  "U" 'upcase-region
  "t" 'transpose-words
  "T" 'transpose-lines
  "c" 'evil-align-center
  "a" 'align-regexp
  "A" 'align-entire
  "s" 'sort-lines
  "S" 'sort-lines-reverse
  "k" 'keep-lines
  "K" 'delete-matching-lines)

(require 'ascratch)


(leader-tert-def
  "" nil
  "t" '(:prefix-command js/inferior-shell-prefix-command
                        :prefix-map js/inferior-shell-prefix-map 
                        :wk "Inf. Shell")
  "z" '(:prefix-command js/debug-prefix-command
                        :prefix-map js/debug-prefix-map
                        :wk "Debug")
  "x" '(:prefix-command js/text-prefix-command
                        :prefix-map js/text-prefix-map
                        :wk "Text")
  "e" 'eww
  "b" 'bookmark-bmenu-search
  "g" 'magit
  "RET" 'ace-link
  "s" 'ascratch-here
  "S" 'ascratch-org 
  ;; "m" 'helm-mode-manager
  ;; "\\" 'helm-mini
  "\\" 'imenu
  "|" 'imenu-anywhere
  "l" 'avy-goto-line)

