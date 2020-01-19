;;; -*- lexical-binding: t; -*-

(straight-use-package 'js2-mode)
(straight-use-package 'flow-js2-mode)
(straight-use-package 'flow-minor-mode)
(straight-use-package 'company-flow)
(straight-use-package 'flycheck-flow)
(straight-use-package 'rjsx-mode)
(straight-use-package 'add-node-modules-path)
(straight-use-package 'nodejs-repl)
(straight-use-package 'tern)
(straight-use-package 'prettier-js)

;; NOTE: Impatient mode requires the feature 'simple-httpd. The repo
;; that this feature comes from shares a name with another one. I've
;; moved this dependency farther up in the installation stack as a
;; workaround.
(straight-use-package 'impatient-mode)
