(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package interleave
  :when (featurep 'org)
  :commands (interleave-mode))

(use-package csv-mode
  :mode (("\\.csv\\'" . csv-mode)))

(use-package muse
  :mode (("\\.muse\\'" . muse-mode)))

(use-package ggtags
  :commands (ggtags-mode))

(use-package helm-gtags
  :hook (ggtags-mode . helm-gtags-mode))

(use-package fzf)
