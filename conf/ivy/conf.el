;;; -*- lexical-binding: t; -*-





(use-package counsel
  :demand
  :init
  (counsel-mode))

(use-package ivy-rich
  :after ivy
  :commands (ivy-rich-mode)
  :config
  (progn
    (setq ivy-rich-path-style 'abbrev
          ivy-virtual-abbreviate 'full))
 )

                                        ;(setq ivy-rich-display-transformers-list)

;; Options for Ivy Posframe:
                                        ; ivy-posframe-display-at-frame-top-center
                                        ; ivy-posframe-display-at-point
                                        ; ivy-posframe-display-at-window-center
                                        ; ivy-posframe-display-at-frame-center
                                        ; ivy-posframe-display-at-frame-bottom-left
                                        ; ivy-posframe-display-at-window-bottom-left
                                        ; ivy-posframe-display
;; (use-package ivy-posframe
;;   :after ivy
;;   :commands (ivy-posframe-mode)
;;   :config 
;;   (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))
;;         ivy-posframe-width 100
;;         ivy-posframe-height-alist '((t . 30))))


(use-package ivy
  :demand
  :config
  (require 'flx)
  (setq projectile-completion-system 'ivy)
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t      . ivy--regex-fuzzy)))
  (ivy-mode 1)
  (ivy-mode)
  (counsel-mode)
  (ivy-rich-mode))
  ;; (ivy-posframe-mode))

(use-package ivy-hydra)
(use-package ivy-explorer)
(use-package swiper)
(use-package counsel-projectile)
(use-package counsel-dash)
(use-package counsel-etags)
(use-package counsel-tramp)

;; (require 'ivy)
;; (require 'counsel)
;; (require 'ivy-rich)
;; (require 'ivy-posframe)

