;;; -*- lexical-binding: t; -*-

(use-package counsel
  :demand t
  :delight
  :init
  (counsel-mode +1))

(use-package ivy-rich
  :after ivy
  :commands (ivy-rich-mode)
  :config
  (progn
    (setq ivy-rich-path-style 'abbrev
          ivy-virtual-abbreviate 'full))
 )

(use-package ivy
  :demand t
  :delight
  :config
  (progn  (require 'flx)
          (require 'ivy-hydra)
          (setq projectile-completion-system 'ivy)
          (setq ivy-re-builders-alist
                '((swiper . ivy--regex-plus)
                  (counsel-describe-variable . ivy--regex-plus)
                  (counsel-describe-function . ivy--regex-plus)
                  (counsel-rg . ivy--regex-plus)
                  (t      . ivy--regex-fuzzy)))
          (ivy-mode 1)
          (counsel-mode +1)))
          ;; (ivy-rich-mode)))
  ;; (ivy-posframe-mode))

;; (use-package ivy-historian
;;  :init
;;  (ivy-historian-mode))

(use-package ivy-rich
  :preface
  (defun ivy-rich-switch-buffer-icon (candidate)
    (with-current-buffer
        (get-buffer candidate)
      (all-the-icons-icon-for-mode major-mode)))
  :init
  (setq ivy-rich-display-transformers-list ; max column width sum = (ivy-poframe-width - 1)
        '(
          ivy-switch-buffer
            (:columns
             (
              ;; (ivy-rich-switch-buffer-icon (:width 2))
              (ivy-rich-candidate (:width 35))
              (ivy-rich-switch-buffer-project (:width 15 :face success))
              (ivy-rich-switch-buffer-major-mode (:width 15 :face warning))
              ))
          ;; :predicate #'(lambda (cand) (get-buffer cand))) ;;removed? Couldn't figure out why it wasn't working
          counsel-M-x
          (:columns
           ((counsel-M-x-transformer (:width 35))
            (ivy-rich-counsel-function-docstring (:width 34 :face font-lock-doc-face))))
          counsel-describe-function
          (:columns
           ((counsel-describe-function-transformer (:width 35))
            (ivy-rich-counsel-function-docstring (:width 34 :face font-lock-doc-face))))
          counsel-describe-variable
          (:columns
           ((counsel-describe-variable-transformer (:width 35))
            (ivy-rich-counsel-variable-docstring (:width 34 :face font-lock-doc-face))))
          package-install
          (:columns
           ((ivy-rich-candidate (:width 25))
            (ivy-rich-package-version (:width 12 :face font-lock-comment-face))
            (ivy-rich-package-archive-summary (:width 7 :face font-lock-builtin-face))
            (ivy-rich-package-install-summary (:width 23 :face font-lock-doc-face)))))
          )
  :config
  (ivy-rich-mode +1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

(use-package ivy-posframe
  :after ivy
  :delight
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))
        ivy-posframe-height-alist '((t . 20))
        ivy-posframe-parameters '((internal-border-width . 5)))
  (setq ivy-posframe-width 70)
  (ivy-posframe-mode +1))

;; (use-package ivy-explorer)

(use-package swiper)

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package counsel-dash
  :config
  (setq counsel-dash-browser-func 'eww))

(use-package counsel-etags)

(use-package ivy-xref)

(use-package counsel-tramp)

;; (require 'ivy)
;; (require 'counsel)
;; (require 'ivy-rich)
;; (require 'ivy-posframe)
