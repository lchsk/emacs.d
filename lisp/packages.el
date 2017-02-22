(require-package 'diff-hl)
;; (require-package 'web-mode)
(require-package 'material-theme)
(require-package 'rainbow-delimiters)
(require-package 'expand-region)
(require-package 'default-text-scale)
(require-package 'git-timemachine)
(require-package 'fill-column-indicator)
(require-package 'undo-tree)

(require-package 'flycheck)

(require-package 'org-bullets)
(require 'org-bullets)

(require-package 'idomenu)

(require 'uniquify)

(require-package 'flimenu)
(require 'flimenu)

(require-package 'multiple-cursors)
(require 'multiple-cursors)

(require-package 'visual-regexp-steroids)
(require-package 'ido-vertical-mode)
(require-package 'imenu-anywhere)

(require-package 'jedi)
;;(require-package 'auto-complete)

(require-package 'flx)
(require-package 'helm-flx)
(require-package 'flx-ido)

(require 'flx-ido)

(require-package 'evil)

(require-package 'projectile)
(require-package 'helm-projectile)

(require-package 'iedit)

(require-package 'yaml-mode)
(require 'yaml-mode)

(require-package 'popwin)
(require 'popwin)

(require-package 'js2-mode)

(require-package 'realgud)
(require 'realgud)

(require-package 'multi-term)
(require 'multi-term)

;;(require-package 'rich-minority)
;;(require 'rich-minority)

(require-package 'fuzzy-format)
(require 'fuzzy-format)

(require-package 'cmake-mode)
(require 'cmake-mode)

(require-package 'plsql)
(require 'plsql)

(require-package 'highlight-symbol)
;;(require-package 'smart-mode-line)

(require-package 'change-inner)

(require-package 'autopair)
(require 'autopair)

(require-package 'ws-butler)

(require-package 'anzu)

(require-package 'helm)
(require-package 'helm-swoop)
(require 'helm-swoop)

(require-package 'bind-key)
(require 'bind-key)

(require-package 'magit)
(require-package 'window-numbering)

(require-package 'buffer-move)
(require 'buffer-move)

(require-package 'goto-chg)
(require 'goto-chg)

(require-package 'go-mode)
(require 'go-mode)

(require-package 'haskell-mode)
(require 'haskell-mode)

(require 'helm-config)

(load-theme 'material t)

(add-hook 'after-make-frame-functions
          '(lambda (frame)
	     (select-frame frame)
	     (if (display-graphic-p)
		 nil
	       (set-frame-parameter nil 'background-color "black"))))

(provide 'packages)
