;;; -*- lexical-binding: t; -*-

(use-package dart-mode)

(use-package dart-server
  :hook (dart-mode . dart-server)
  :config
  (setq dart-server-format-on-save t
        dart-server-enable-analysis-server t))

(use-package lsp-mode
  :config
  (setq lsp-dart-suggest-from-unimported-libraries nil)
  (add-hook 'dart-mode-hook '(lambda ()
                               (lsp-ui-mode -1))))

(use-package lsp-dart
  :hook (dart-mode . lsp)
  :init
  (setq
   lsp-dart-sdk-dir
        (expand-file-name
         "~/git/install/flutter/bin/cache/dart-sdk")))

(use-package lsp-dart-dap
  :init
  (add-hook 'dart-mode-hook 'js/dap-setup-dart-templates)
  )

(use-package flutter)
(use-package hover)
