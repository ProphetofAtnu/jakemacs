;;; -*- lexical-binding: t; -*-
(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package evil-org
  :after (org evil))

(use-package helm-org
  :after (org helm))

(use-package helm-org-rifle)
(use-package org-projectile)
(use-package org-sticky-header)
(use-package org-mime)
(use-package org-journal)
(use-package org-download)

