;;; -*- lexical-binding: t; -*-


(general-define-key
  :prefix-command 'js/frames-command
  :prefix-map 'js/frames-prefix
  "o" 'other-frame
  "n" 'make-frame
  "m" 'make-frame-on-monitor
  "d" 'dired-other-frame
)

(provide 'prefix/frames)
