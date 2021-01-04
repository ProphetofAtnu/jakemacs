;;; yankrx.el --- Yank all instances of RX           -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Jacob Scaggs

;; Author: Jacob Scaggs <jacsc@Shangri-La>
;; Keywords: tools, convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'rx)

(defface yankrx-match-face
  '((t :background "LightBlue1" :foreground "black"))
  "Default face for yankrx temporary matches")

(defvar yankrx--active-overlays nil)

(defun yankrx--infer-buffer (buffer)
  (if (null buffer)
      (current-buffer)
    (buffer)))

(defun yankrx--clear-overlays ()
  (mapc #'delete-overlay yankrx--active-overlays)
  (setq yankrx--active-overlays nil))

(defun yankrx--match-points (regx &optional buff)
  (save-match-data
    (let ((regex regx)
          (mark-ring nil)
          (matches nil)
          (continue t))
      (with-current-buffer (if (null buff)
                               (current-buffer)
                             (get-buffer buff))
        (goto-char (point-min))
        (while continue
          (let* ((current-point (point))
                 (next-point (re-search-forward regex nil t)))
            (cond
             ((eobp) (setq continue nil))
             ((null next-point) (setq continue nil))
             ((= current-point next-point) (beginning-of-line 2))
             (t (add-to-list 'matches (values (match-beginning 0) (match-end 0))))))))
      (nreverse matches))))

(defun yankrx--make-overlays-positions (positions &optional buff)
  (yankrx--clear-overlays)
  (with-current-buffer (if (null buff)
                           (current-buffer)
                         (get-buffer buff))
    (dolist (area positions)
      (destructuring-bind (start end) area
        (let ((ovl (make-overlay start end)))
          (overlay-put ovl 'yankrx-temp t)
          (overlay-put ovl 'face 'yankrx-match-face)
          (push ovl yankrx--active-overlays))))))

;; (defun yankrx--get-distinct-rx (regx &optional buff)
;;   "Get a list with distinct matches of REGX"
;;   (let ((regex regx)
;;         (matches nil))
;;     (with-current-buffer (if (null buff)
;;                              (current-buffer)
;;                            (get-buffer buff))
;;       (goto-char (point-min))
;;       (while (condition-case err
;;                  (re-search-forward regex)
;;                (error nil))
;;         (add-to-list 'matches (buffer-substring-no-properties
;;                                (match-beginning 0) (match-end 0)))))
;;     matches))

(defun yankrx--highlight-regex (regx &optional buff)
  (let
      ((psns (if (not (string= regx ""))
                 (yankrx--match-points regx buff)
               nil)))
    (yankrx--make-overlays-positions psns buff)))

(defun yankrx--make-minibuffer-change-hook (buffer)
  (lambda ()
    (yankrx--highlight-regex (minibuffer-contents-no-properties) buffer)))

(defun yankrx--read-from-minibuffer (prompt)
  (cl-letf* ((update-func
              (yankrx--make-minibuffer-change-hook
               (current-buffer)))
             ((symbol-function 'afc-actual)
              #'(lambda (&rest _)
                  (funcall update-func))))
    (minibuffer-with-setup-hook
        (lambda ()
          (add-hook 'after-change-functions
                    #'afc-actual 0 1)
          (add-hook 'before-change-functions
                    #'afc-actual 0 1))
      (combine-after-change-calls 
        (prog1
            (read-from-minibuffer prompt)
          (yankrx--clear-overlays))))))

(defun yankrx--get-matches-list (regx &optional buffer)
  (let ((lom (yankrx--match-points regx buffer)))
    (with-current-buffer (yankrx--infer-buffer buffer)
      (mapcar '(lambda (area)
                 (destructuring-bind (start end) area
                   (buffer-substring-no-properties start end)))
              lom))))

(defun yankrx--compress-list (raw)
  (let (result)
    (dolist (item raw (nreverse result))
      (add-to-list 'result item))))

(defun yankrx-yank-distinct-rx (regex)
  (interactive (list (yankrx--read-from-minibuffer "Regex: ")))
  (let
      ((matches
        (yankrx--compress-list (yankrx--get-matches-list regex))))
    (with-temp-buffer 
      (mapc '(lambda (m) (insert (format "%s\n" m))) matches)
      (kill-new (buffer-string)))))

(provide 'yankrx)
;;; yankrx.el ends here
