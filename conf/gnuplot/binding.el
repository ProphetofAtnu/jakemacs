;;; -*- lexical-binding: t; -*-

(leader-minor-def
  :keymaps 'gnuplot-mode-map
  "b" 'gnuplot-send-buffer-to-gnuplot
  "l" 'gnuplot-send-line-to-gnuplot
  "r" 'gnuplot-send-region-to-gnuplot
  "f" 'gnuplot-send-file-to-gnuplot
  "c" 'gnuplot-gui-swap-simple-complete
  "t" 'gnuplot-gui-toggle-popup
  "i" 'gnuplot-info-lookup-symbol
  "'" 'gnuplot-show-gnuplot-buffer
  "," 'gnuplot-gui-set-options-and-insert
  )

(general-define-key
 :keymaps 'gnuplot-mode-map)
