;;; -*- lexical-binding: t; -*-




;; (use-package ivy
;;   :demand
;;   :config
;;   (setq projectile-completion-system 'ivy)
;;   (setq ivy-re-builders-alist
;;         '((swiper . ivy--regex-plus)
;;           (t      . ivy--regex-fuzzy)))
;;   (ivy-mode 1))

(use-package counsel
  :init
  (add-hook 'ivy-mode-hook '(lambda () (counsel-mode))))

(use-package ivy-rich
  :after ivy
  :commands (ivy-rich-mode)
  :config
  (add-hook 'ivy-mode-hook  '(lambda ()  (ivy-rich-mode))))

                                        ;(setq ivy-rich-display-transformers-list)

;; Options for Ivy Posframe:
                                        ; ivy-posframe-display-at-frame-top-center
                                        ; ivy-posframe-display-at-point
                                        ; ivy-posframe-display-at-window-center
                                        ; ivy-posframe-display-at-frame-center
                                        ; ivy-posframe-display-at-frame-bottom-left
                                        ; ivy-posframe-display-at-window-bottom-left
                                        ; ivy-posframe-display
(use-package ivy-posframe
  :after ivy
  :commands (ivy-posframe-mode)
  :config 
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))
        ivy-posframe-height-alist '((t . 30))))

;; (use-package ivy-hydra)
;; (use-package ivy-explorer)
;; (use-package swiper)
;; (use-package counsel-projectile)
;; (use-package counsel-dash)
;; (use-package counsel-etags)
;; (use-package counsel-tramp)
;; (require 'ivy)
;; (require 'counsel)
;; (require 'ivy-rich)
;; (require 'ivy-posframe)

(ivy-mode)
(counsel-mode)
;; (ivy-rich-mode)
(ivy-posframe-mode)
