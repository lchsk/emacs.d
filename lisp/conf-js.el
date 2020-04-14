(require-package 'js2-mode)


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (setq js2-basic-offset 2)
                           (setq js2-mode-show-parse-errors nil)
                           (setq js2-mode-show-strict-warnings nil)
                           (when (> (buffer-size) (* 1024 20))
                             (linum-mode -1)
                             (fundamental-mode))))
;; (setq tab-width-js 2)

;; (defvaralias 'js-indent-level 'tab-width)
;; (defvaralias 'js-indent-level 'tab-width-js)

(provide 'conf-js)
