;; Indentation styles:
;; https://www.emacswiki.org/emacs/IndentingC

(defun my-c++-mode-hook ()
  (global-set-key (kbd "C-x W") 'add-newlines-with-point-between)

  (c-set-style "Linux")
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq c-basic-offset tab-width))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(provide 'conf-cpp)
