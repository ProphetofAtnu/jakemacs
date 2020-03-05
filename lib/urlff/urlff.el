;;; urlff.el --- Find-File like interface for web requests.

;; Copyright (C) 2020  Jacob Scaggs

;; Author: Jacob Scaggs;;; -*- lexical-binding: t; -*- <jacsc@Shangri-La>
;; Keywords: comm, lisp, data, tools

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

(defun urlff-find-url ()
  "Find file from URL")



(cl-defun urlff--handle-response (&key data response &allow-other-keys)
  (print  (format "%S\n%S\n" data response))
  (setq ***RES*** response))

(cl-defun urlff--request-url (url &key (method "GET"))
  (request
    url
    :type method
    :parser 'buffer-string
    :success #'urlff--handle-response)
  nil)

(urlff--request-url "http://httpbin.org/get?key=value&key2=value2")

(provide 'urlff)
;;; urlff.el ends here


