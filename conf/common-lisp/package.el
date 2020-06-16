;;; -*- lexical-binding: t; -*-

(defvar common-lisp-use-sly t) 

(if common-lisp-use-sly
    (progn 
      (straight-use-package 'sly)
      (straight-use-package 'sly-quicklisp)
      (straight-use-package 'sly-macrostep)
      (straight-use-package 'sly-asdf)
      (straight-use-package 'sly-company)
      (straight-use-package 'sly-repl-ansi-color))
  (progn
    (straight-use-package 'slime)
    (straight-use-package 'slime-repl-ansi-color)
    (straight-use-package 'slime-company))
  )

