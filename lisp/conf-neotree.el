(require-package 'neotree)
(require 'neotree)
(global-set-key (kbd "C-'") 'neotree-toggle)

(setq neo-theme (if (display-graphic-p) 'ascii 'ascii))

(provide 'conf-neotree)
