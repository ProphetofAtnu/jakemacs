;;; ascratch.el --- Scratch buffer templates         -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Jacob Scaggs

;; Author: Jacob Scaggs;;; -*- lexical-binding: t; -*- <jacsc@Jacobs-MacBook-Pro.local>
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
(require 'ascratch-util)
(require 'cl-lib)

(defvar-local ascratch-language-mode 'prog-mode)

(defvar-local ascratch--setup-complete nil)

(defun ascratch--wrap-mode (mode)
  (lambda (&optional &rest args)
    (letf
        (((symbol-function 'flycheck-mode) 'ascratch-util--noop)
         ((symbol-function 'flymake-mode) 'ascratch-util--noop))
      (funcall mode))))

(define-minor-mode ascratch-mode
  "Ascratch stub"
  :init-value nil
  (when (and
         ascratch-mode
         (not ascratch--setup-complete)
         (functionp ascratch-language-mode))
    (funcall (ascratch--wrap-mode ascratch-language-mode))
    (ascratch-util--insert-mode-comment major-mode)
    (setq-local ascratch--setup-complete t)))

(cl-defun ascratch--create-buffer (&key target-major-mode base-buffer)
  (let* ((mm (or target-major-mode
               (ascratch-util--get-buffer-major-mode base-buffer)))
         (sbuf (ascratch-util--get-buffer-create
                mm)))
    (with-current-buffer sbuf
      (unless ascratch-mode
        (ascratch-mode +1)))
    sbuf))

(defun ascratch-here (buf)
  (interactive (list (current-buffer)))
  (pop-to-buffer
   (ascratch--create-buffer
    :base-buffer buf)))

(defun ascratch-kill-buffers ()
  (interactive)
  (mapc 'kill-buffer (ascratch-util--get-ascratch-buffers)))

(provide 'ascratch)
;;; ascratch.el ends here


