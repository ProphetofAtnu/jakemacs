;;; -*- lexical-binding: t; -*-

(use-package selectrum
  :init
  (selectrum-mode))

(use-package selectrum-prescient
  :commands (selectrum-prescient-mode)
  :init
  (selectrum-prescient-mode))

(use-package consult
  :demand t
  :config
  (with-eval-after-load	"window-purpose" 
    (js/disable-purpose-for 'consult-buffer))
  (setq xref-show-xrefs-function 'consult-xref))

(use-package embark
  :demand t
  :general
  ("C-SPC" 'embark-act))


(use-package embark-consult
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . embark-consult-preview-minor-mode))


(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  ;; :bind (("M-A" . marginalia-cycle)
  ;;        :map minibuffer-local-map
  ;;        ("M-A" . marginalia-cycle))

  :general (:keymaps 'minibuffer-local-map
            "M-?" 'marginalia-cycle)

  ;; The :init configuration is always executed (Not lazy!)
  :init
  (marginalia-mode)

  ;; When using Selectrum, ensure that Selectrum is refreshed when cycling annotations.
  (advice-add #'marginalia-cycle :after
              (lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit 'keep-selected))))

  ;; Prefer richer, more heavy, annotations over the lighter default variant.
  ;; E.g. M-x will show the documentation string additional to the keybinding.
  ;; By default only the keybinding is shown as annotation.
  ;; Note that there is the command `marginalia-cycle' to
  ;; switch between the annotators.
  (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
)

