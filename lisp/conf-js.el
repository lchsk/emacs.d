(require-package 'js2-mode)


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (setq js2-basic-offset 4)
                           (when (> (buffer-size) (* 1024 20))
                             (linum-mode -1)
                             (fundamental-mode))))


(defvaralias 'js-indent-level 'tab-width)

(provide 'conf-js)
