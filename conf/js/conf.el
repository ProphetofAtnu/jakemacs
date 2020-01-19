;;; -*- lexical-binding: t; -*-

(use-package js2-mode
  :mode (("\\.m?js\\'"  . js2-mode))
  )

(use-package flow-js2-mode)
(use-package flow-minor-mode)
(use-package company-flow)
(use-package flycheck-flow)
(use-package rjsx-mode)
(use-package add-node-modules-path)
(use-package nodejs-repl)
(use-package tern)
(use-package prettier-js)
(use-package impatient-mode)
