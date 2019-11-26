(require-package 'yasnippet)
(require-package 'yasnippet-snippets)
(require 'yasnippet)
(require-package 'helm-c-yasnippet)
(require 'helm-c-yasnippet)

(yas-global-mode 1)
(setq helm-yas-space-match-any-greedy t)


;; (add-to-list 'load-path
;;              "~/.emacs.d/private/snippets")

;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/private/snippets"))


(provide 'conf-yasnippet)
