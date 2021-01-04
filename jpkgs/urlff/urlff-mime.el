;;; urlff-mime.el --- Mime type detection and handling. 

;; Copyright (C) 2020  Jacob Scaggs

;; Author: Jacob Scaggs;;; -*- lexical-binding: t; -*- <jacsc@Shangri-La>
;; Keywords: data, comm, internal

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

(require 'request)

(defvar urlff-mime--mime-types nil)

(defvar urlff-mime--clean-extension-rx "\\([a-z]\\.?\\)+")

(defun urlff-mime--clean-extension (ext)
  (unless (stringp ext)
    (error "Not a string"))
  (substring
   ext
   (string-match
    urlff-mime--clean-extension-rx
    ext)
   (match-end 0)))

(defun urlff-mime--extension-detectable-p (url)
  (unless (stringp url)
    (error "Not a string"))
  (let* ((ext (url-file-extension url)))
    (if (string= "" ext)
        nil
      (urlff-mime--clean-extension ext))))

(defun urlff-mime-detect (req)
  (unless (request-response-p req)
    (error "Arg is not a request-response"))

  
  )

(provide 'urlff-mime)
;;; urlff-mime.el ends here

