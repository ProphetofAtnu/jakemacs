;;; -*- lexical-binding: t; -*-
;; General bindings
(require 'general)
(load (concat-path user-emacs-directory "lib/interact"))

;; Insert mode redefs
(load-relative "./bind-extra/insert-rebind.el")

(setq leader-primary "SPC")
(setq alt-primary "C-SPC")
(setq leader-minor ",")
(setq alt-minor "C-,")
(setq leader-tertiary "\\")
(setq alt-tertiary "C-\\")

(load-relative "./bind-extra/leader-primary.el")
(load-relative "./bind-extra/leader-tert.el")

(general-create-definer leader-minor-def
  :states '(normal visual insert emacs override)
  :prefix leader-minor
  :non-normal-prefix alt-minor)

(general-defs 'indent-rigidly-map
  "h" 'indent-rigidly-left
  "l" 'indent-rigidly-right)

(general-defs '(normal visual motion)
  "s" nil
  "S" nil
  "s" 'avy-goto-char-timer
  "S" 'swiper
  ;; Dired stuff
  "-" 'dired-jump)

;; (general-defs '(normal emacs insert)

;; 	[C-tab] 'helm-company)

(general-defs '(normal visual motion insert)
  "C-(" 'evil-previous-open-paren
  "C-)" 'evil-next-close-paren
  "C-{" 'evil-previous-open-brace
  "C-}" 'evil-next-close-brace)

;; Misc
(use-package winner
  :commands (winner-mode)
  :init (winner-mode))
(use-package treemacs
  :commands (treemacs))


(general-defs
  "C-<" 'winner-undo
  "C->" 'winner-redo
  "C-;" 'treemacs
  )
