(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package
  simplenote2
  :config (add-hook
           'simplenote2-note-mode-hook
           #'markdown-mode)
  (setq simplenote2-markdown-notes-mode
        'markdown-mode))

(use-package interleave
  :when (featurep 'org)
  :commands (interleave-mode))

(use-package csv-mode
  :mode (("\\.csv\\'" . csv-mode)))


(use-package ggtags
  :commands (ggtags-mode))

(use-package helm-gtags
  :hook (ggtags-mode . helm-gtags-mode))

(use-package fzf)

(use-package automargin
  :commands (automargin-mode))

;; (use-package evil-better-visual-line
;;   :commands (evil-better-visual-line-on)
;;   :config
;;   (add-hook 'visual-line-mode '(lambda () (evil-better-visual-line-on))))

(use-package dired-imenu
  :after (dired))

(use-package simple
  :config
  (add-to-list 'evil-motion-state-modes 'process-menu-mode))

(use-package tramp
  :config
  (setq tramp-default-method "ssh"))

(use-package pdf-tools
  :init 
  (add-to-list 'auto-mode-alist
               '("\\.pdf\\'" . pdf-view-mode))
  ;; (add-to-list 'evil-motion-state-modes 'pdf-view-mode)

  ;; For some reason, motion state doesn't want to work with PDF-view
  ;; mode.
  (add-hook 'pdf-view-mode-hook #'pdf-isearch-minor-mode))
