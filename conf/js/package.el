;;; -*- lexical-binding: t; -*-

(straight-use-package 'web-mode)
(straight-use-package 'js2-mode)
(straight-use-package 'js2-refactor)
(straight-use-package 'js2-closure)
(straight-use-package 'flow-js2-mode)
(straight-use-package 'flow-minor-mode)
(straight-use-package 'company-flow)
(straight-use-package 'flycheck-flow)
(straight-use-package '(emacs-flow-jsx :type git :files ("emacs-flow-jsx-mode.el") :host github :repo "rudolfolah/emacs-flow-jsx"))

(straight-use-package 'tern)
;; (straight-use-package '(company-tern :type git :files ("stable-melpa/company-tern-20161004.1847.el") :host github :repo "syl20bnr/spacemacs-elpa-mirror"))
(straight-use-package 'js-doc)

(straight-use-package 'add-node-modules-path)
(straight-use-package 'nodejs-repl)
(straight-use-package 'prettier-js)

;; NOTE: Impatient mode requires the feature 'simple-httpd. The repo
;; that this feature comes from shares a name with another one. I've
;; moved this dependency farther up in the installation stack as a
;; workaround.
(straight-use-package 'impatient-mode)
(straight-use-package 'skewer-mode)
(straight-use-package 'livid-mode)
(straight-use-package 'rjsx-mode)
(straight-use-package 'eslintd-fix)


;; JSON
(straight-use-package 'json-mode)
(straight-use-package 'json-navigator)
(straight-use-package 'json-reformat)
(straight-use-package 'json-snatcher)

(straight-use-package 'emmet-mode)


;; New additions/replacements

(straight-use-package 'tide)
(straight-use-package 'indium)

(straight-use-package 'typescript-mode)
