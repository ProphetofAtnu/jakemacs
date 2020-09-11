;;; -*- lexical-binding: t; -*-

(defun js/get-child-position ()
  (destructuring-bind
      (left top right bottom)
      (frame-edges)
    (let* ((frame-middle (/ (+ left right) 2))
           (helm-middle (*
                         (window-font-width)
                         (/ helm-display-buffer-width 2))))
      (cons
       (- frame-middle helm-middle)
       top))))

(defun js/helm-display-child-frame (buffer &optional resume)
  "Display `helm-buffer' in a separate frame.
Function suitable for `helm-display-function',
`helm-completion-in-region-display-function'
and/or `helm-show-completion-default-display-function'.
See `helm-display-buffer-height' and `helm-display-buffer-width' to
configure frame size."
  (if (not (display-graphic-p))
      ;; Fallback to default when frames are not usable.
      (helm-default-display-buffer buffer)
    (setq helm--buffer-in-new-frame-p t)
    (let* ((pos (window-absolute-pixel-position))
           (child-pos (js/get-child-position))
           (half-screen-size (/ (display-pixel-height x-display-name) 2))
           (frame-info (frame-geometry))
           (prmt-size (length helm--prompt))
           (line-height (frame-char-height))
           (default-frame-alist
             `((parent . ,(selected-frame))
               (width . ,helm-display-buffer-width)
               (height . ,helm-display-buffer-height)
               (undecorated . t)
               (left-fringe . 0)
               (right-fringe . 0)
               (tool-bar-lines . 0)
               (line-spacing . 0)
               (desktop-dont-save . t)
               (no-special-glyphs . t)
               (inhibit-double-buffering . t)
               (tool-bar-lines . 0)
               (left . ,(car child-pos))
               ;; Try to put frame at the best possible place.
               ;; Frame should be below point if enough
               ;; place, otherwise above point and
               ;; current line should not be hidden
               ;; by helm frame.
               (top . ,(cdr child-pos))
               (title . "Helm")
               (vertical-scroll-bars . nil)
               (menu-bar-lines . 0)
               (fullscreen . nil)
               (visible . ,(null helm-display-buffer-reuse-frame))
               (minibuffer . t)))
           display-buffer-alist)
      ;; Add the hook inconditionally, if
      ;; helm-echo-input-in-header-line is nil helm-hide-minibuffer-maybe
      ;; will have anyway no effect so no need to remove the hook.
      (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
      (with-helm-buffer
        (setq-local helm-echo-input-in-header-line
                    (not (> (cdr pos) half-screen-size))))
      (helm-display-buffer-popup-frame buffer default-frame-alist))
    (helm-log-run-hook 'helm-window-configuration-hook)))

