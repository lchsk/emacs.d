(require-package 'go-mode)
(require 'go-mode)
(setq gofmt-command "goimports")

(add-hook 'before-save-hook (lambda()
		  (gofmt-before-save))
		  )

(provide 'go-mode)
