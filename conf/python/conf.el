;;; -*- lexical-binding: t; -*-

(use-package anaconda-mode
  :commands (anaconda-mode)
  :hook (python-mode . anaconda-mode)
  :config
  (setq anaconda-mode-installation-directory
        (expand-file-name "anaconda-mode" user-cache-dir)))

(use-package company-anaconda
  :config
  (add-hook 'anaconda-mode-hook
            '(lambda ()
               (add-to-list (make-local-variable 'company-backends)
                            'company-anaconda))))
