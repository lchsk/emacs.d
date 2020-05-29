;; Indentation styles:
;; https://www.emacswiki.org/emacs/IndentingC

(require-package 'clang-format)
(require 'clang-format)

(defun clang-format-save-hook-for-this-buffer ()
  "Create a buffer local save hook."
  (add-hook 'before-save-hook
    (lambda ()
      (progn
        (when (locate-dominating-file "." ".clang-format")
          (clang-format-buffer))
        ;; Continue to save.
        nil))
    nil
    ;; Buffer local hook.
    t))


(defun my-c++-mode-hook ()
  (global-set-key (kbd "C-x W") 'add-newlines-with-point-between)

  (c-set-style "Linux")
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (clang-format-save-hook-for-this-buffer)
  (setq c-basic-offset tab-width))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

(provide 'conf-cpp)
