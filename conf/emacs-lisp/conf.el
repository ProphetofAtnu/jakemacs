;;; -*- lexical-binding: t; -*-
(use-package mode-local
  :commands (setq-mode-local))

(use-package eldoc
  :delight)

(use-package company-elisp
  :config
  (add-hook 'emacs-lisp-mode-hook 
            (lambda () 
              (add-to-list
               (make-local-variable 'company-backends) 'company-elisp))))

(use-package ielm
  :commands (ielm)
  :config
  (setq ielm-dynamic-return nil))

(use-package eros
  :hook (emacs-lisp-mode . eros-mode))

(use-package evil
  :config
  (setq-mode-local emacs-lisp-mode evil-lookup-func #'describe-symbol-at-point)
  (setq-mode-local inferior-lisp evil-lookup-func #'describe-symbol-at-point))

(use-package elisp-def
  :delight
  :hook ((emacs-lisp-mode . elisp-def-mode)
         (ielm-mode . elisp-def-mode)))

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

