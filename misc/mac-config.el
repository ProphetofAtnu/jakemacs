;;; -*- lexical-binding: t; -*-

(require 'custom-poshandler)

(progn
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'hyper))

;; Generic Set of typical mac stuff
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)

(general-define-key
 "C-H-f" 'toggle-frame-fullscreen
 "H-RET" 'toggle-frame-maximized
 "H-q" 'save-buffers-kill-emacs 
 "H-f" 'toggle-frame-maximized
 "H-l" 'avy-goto-line
 "H-r" 'revert-buffer
 "H-d" 'evil-window-split
 "H-D" 'evil-window-vsplit
 "H-y" 'avy-copy-line
 "H-Y" 'avy-move-line)

(provide 'mac-config)
