;; (use-package powerline
;;   :init
;;   (powerline-default-theme))

(set-face-attribute 'default t :font "Fira Code-12")
(set-frame-font "Fira Code-12" nil t)


(add-hook 'prog-mode-hook 'prettify-symbols-mode)

(defvar fira-is-safe-p t)
;; https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip

(when fira-is-safe-p
  (require 'fira-code)
  (add-hook 'prog-mode-hook 'fira-code-mode))
;; (when (window-system)
;;   (set-frame-font "Fira Code"))

;; (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
;;                (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
;;                (36 . ".\\(?:>\\)")
;;                (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
;;                (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
;;                (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
;;                (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
;;                (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
;;                (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
;;                (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
;;                (48 . ".\\(?:x[a-zA-Z]\\)")
;;                (58 . ".\\(?:::\\|[:=]\\)")
;;                (59 . ".\\(?:;;\\|;\\)")
;;                (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
;;                (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
;;                (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
;;                (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
;;                (91 . ".\\(?:]\\)")
;;                (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
;;                (94 . ".\\(?:=\\)")
;;                (119 . ".\\(?:ww\\)")
;;                (123 . ".\\(?:-\\)")
;;                (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
;;                (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
;;                )
;;              ))
;;   (dolist (char-regexp alist)
;;     (set-char-table-range composition-function-table (car char-regexp)
;;                           `([,(cdr char-regexp) 0 font-shape-gstring]))))

(use-package moe-theme
  :straight t
  :init
  (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0)
	moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0)
	moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))
  :config
  (progn
    (moe-dark)
    (with-eval-after-load 'ivy 
      (set-face-foreground 'ivy-minibuffer-match-face-1 "grey18" nil)
      (set-face-foreground 'ivy-minibuffer-match-face-2 "grey18" nil)
      (set-face-foreground 'ivy-minibuffer-match-face-3 "grey18" nil)
      (set-face-foreground 'ivy-minibuffer-match-face-4 "grey18" nil))
    ))

(use-package doom-modeline
  :commands (doom-modeline-mode)
  :init (doom-modeline-mode)
  :config
  (setq doom-modeline-minor-modes t))


;; (use-package cyberpunk-theme
;;   :init
;;   (load-theme 'cyberpunk t))

(provide 'aesthetic)
