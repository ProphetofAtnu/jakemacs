;;; -*- lexical-binding: t; -*-

(use-package gnuplot
  :commands (gnuplot-mode gnuplot-make-buffer)
  :mode ( "\\.gp\\'" . gnuplot-mode )
  :init
  (setq gnuplot-program-version "5.2")
  :config
  (setq gnuplot-eldoc-mode t
        gnuplot-use-context-sensitive-completion t)
  (add-hook 'gnuplot-mode-hook '(lambda ()
                                  (gnuplot-context-sensitive-mode)
                                  (add-to-list 'completion-at-point-functions
                                               'gnuplot-completion-at-point)
                                  (company-mode)))
  (add-hook
   'gnuplot-comint-mode-hook
   '(lambda
      ()
      (add-to-list
       'completion-at-point-functions
       'gnuplot-comint-complete)
      (company-mode))))
