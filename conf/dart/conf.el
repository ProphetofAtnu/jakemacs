;;; -*- lexical-binding: t; -*-

(use-package dart-mode)

;; (use-package dart-server
;;   :hook (dart-mode . dart-server)
;;   :config
;;   (setq dart-server-format-on-save t
;;         dart-server-enable-analysis-server t))

(use-package lsp-mode
  :hook (dart-mode . lsp-deferred)
  :config
  (setq lsp-dart-suggest-from-unimported-libraries nil)
  (add-hook 'dart-mode-hook '(lambda ()
                               (lsp-ui-mode -1))))

(use-package lsp-dart
  ;; :hook (dart-mode . lsp)
  :after 'lsp-mode
  :init
  (setq
   lsp-dart-sdk-dir
   (expand-file-name
    "~/git/install/flutter/bin/cache/dart-sdk"))
  :config
  (with-eval-after-load 'lsp/function
    (js/add-lsp-major-mode dart_analysis_server web-dartng-mode)))

(use-package web-mode
  :config
  (define-derived-mode web-dartng-mode web-mode "ng-dart HTML"
    "Major mode for editing AngularDart HTML templates"
    :syntax-table nil))

(use-package lsp-dart-dap
  :after 'lsp-mode
  ;; :init
  ;; (add-hook 'dart-mode-hook 'js/dap-setup-dart-templates)
  )

(with-eval-after-load
    'web/function
  (add-to-list 'js/web-mode-overrides
   '(js/dart-html-angular-tmpl-p . web-dartng-mode)))

(use-package flutter)
(use-package hover)
