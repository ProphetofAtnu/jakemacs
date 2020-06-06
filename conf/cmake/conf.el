;;; -*- lexical-binding: t; -*-

(use-package company-cmake
  :init
  (add-to-list 'company-backends 'company-cmake))

(use-package eldoc-cmake
  :hook (cmake-mode . eldoc-cmake-enable))

(use-package cmake-mode)

(use-package cmake-project
  :commands (cmake-project)
  :init
  (defun maybe-cmake-project-hook ()
    (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
  (add-hook 'c-mode-hook 'maybe-cmake-project-hook)
  (add-hook 'c++-mode-hook 'maybe-cmake-project-hook))
