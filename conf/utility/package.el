;; Config specific packages
(straight-use-package 'markdown-mode)
(straight-use-package 'simplenote2)

(straight-use-package 'interleave)
(straight-use-package 'csv-mode)

(straight-use-package 'annotate)

;; (straight-use-package '(hyperbole)
(straight-use-package 'multishell)
;; (straight-use-package 'web-server)

(straight-use-package 'dired-imenu)
(straight-use-package 'dired-sidebar)

;; GGTags
(straight-use-package 'ggtags)
(straight-use-package 'helm-gtags)

;; Misc formatting
(straight-use-package 'automargin)
(straight-use-package 'evil-better-visual-line)

;; FZF
(straight-use-package 'fzf)

;; PDFs
(straight-use-package 'pdf-tools)

;; (straight-use-package
;;  '(hyperbole
;;    :files ("*.el" ("kotl" "kotl/*.el") "man/*.info" "man/*.texi")
;;    :host github :repo "rswgnu/hyperbole"))

(straight-use-package 'yaml-mode)
(straight-use-package 'yaml-imenu)

(straight-use-package 'nginx-mode)
(straight-use-package 'company-nginx)

(straight-use-package 'scratch-pop)
