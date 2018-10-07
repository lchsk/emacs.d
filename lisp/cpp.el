
(defun my-c++-mode-hook ()
  (global-set-key (kbd "C-x w") 'add-newlines-with-point-between))


(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(provide 'cpp)
