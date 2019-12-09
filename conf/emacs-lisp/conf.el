;;; -*- lexical-binding: t; -*-
(use-package mode-local
  :commands (setq-mode-local))

(use-package eldoc
  :delight)

(use-package evil
  :config
  (setq-mode-local emacs-lisp-mode evil-lookup-func #'describe-symbol-at-point))

(use-package macrostep
  :commands (macrostep-mode))


(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (let  ((auto-insert-query nil)
		    (auto-insert-alist
		     '((("\\.el\\'" . "Emacs Lisp header")
			""
			";;; -*- lexical-binding: t; -*-\n\n" '(setq lexical-binding t)))))
	       (auto-insert))))
