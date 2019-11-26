
(require-package 'py-isort)
(require 'py-isort)


(add-hook 'python-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq tab-width 4)
            (rainbow-delimiters-mode 1)
            (setq python-indent-offset 4)
            (jedi:setup)
            (add-to-list 'company-backends 'company-jedi)
            (setq jedi:environment-root "jedi")
            (setq jedi:environment-virtualenv
                  (append python-environment-virtualenv
                          '("--python" "python3")))
            (flycheck-mode 1)
            (setq flycheck-checker 'python-pylint
                  flycheck-checker-error-threshold 300
                  flycheck-pylintrc "~/.emacs.d/pylintrc")))


(provide 'python-mode)
