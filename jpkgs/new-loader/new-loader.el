;;; new-loader.el --- New loader for jakemacs        -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Jacob Scaggs

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

(defvar new-loader-load-order '(pre package requires function conf binding))

(defvar new-loader-load-root (expand-file-name "conf" user-emacs-directory))

(defun new-loader--file-rx (item)
  "Get a regexp for the load item symbol `item'"
  (format ".*[/\\]%s.elc?$" (symbol-name item)))

(defun new-loader--get-path (name)
  "Convert a configuration symbol into a path"
  (expand-file-name (symbol-name name) new-loader-load-root))

(defun new-loader--get-file (item files)
  (do ((it files (cdr it)))
    ((or
      (null it)
      (string-match-p (new-loader--file-rx item) (car it)))
     (car it))))

(defun new-loader--conf-exits-p (name)
  (condition-case nil
      (directory-files (new-loader--get-path name) t
                       directory-files-no-dot-files-regexp)
    (error nil)))

(provide 'new-loader)
;;; new-loader.el ends here


