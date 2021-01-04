;;; ascratch-util.el --- Scratch buffer utilites  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Jacob Scaggs

;; Author: Jacob Scaggs <jacsc@Jacobs-MacBook-Pro.local>
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

(require 'dash)

(defun ascratch-util--string-trim-index (mstr)
  (or 
   (string-match-p "-mode" mstr)
   (length mstr)))

(defun ascratch-util--trim-mode (mstr)
  (substring
   mstr 0 (ascratch-util--string-trim-index mstr)))

(defun ascratch-util--buffer-name-for (major-mode)
  (let* ((mstr (symbol-name major-mode))
         (lname (ascratch-util--trim-mode mstr)))
    (format "*aScratch_%s*" lname)))

(defun ascratch-util--get-ascratch-buffers ()
  (-filter (lambda (buf)
             (string-match-p "\\*aScratch_.*\\*" (buffer-name buf)))
           (buffer-list)))

(defun ascratch-util--get-buffer-create (major-mode)
  (let ((buf (get-buffer-create
              (ascratch-util--buffer-name-for
               major-mode))))
    (with-current-buffer buf
      (setq-local ascratch-language-mode major-mode))
    buf))

(defun ascratch-util--get-buffer-major-mode (buffer)
  (with-current-buffer buffer
    major-mode))

(defun ascratch-util--noop (&rest args) nil)

(defun ascratch-util--insert-mode-comment (mode)
  (save-excursion
    (goto-char (point-min))
    (insert (format "Advanced Scratch for %s" mode))
    (comment-region (point-min) (point-max)))
  (goto-char (point-max))
  (insert "\n"))

(provide 'ascratch-util)
;;; ascratch-util.el ends here

