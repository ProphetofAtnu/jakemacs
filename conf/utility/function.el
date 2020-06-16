;;; -*- lexical-binding: t; -*-

;; Markdown

(js/context-func
 js/md-ctx-enter ()
 :doc "Context enter for Markdown mode"
 :inter-args nil
 :conds
 ((markdown-link-p (markdown-follow-link-at-point))
  (markdown-footnote-marker-positions (markdown-footnote-find-text))
  (t (evil-ret))))

