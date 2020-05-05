(require-package 'olivetti)
(require-package 'flyspell-correct)
(require-package 'flyspell-correct-helm)
(require 'flyspell-correct-helm)

(require-package 'ac-ispell)

(defun wc ()
  (interactive)
  (shell-command-to-string (concat "wc -w " buffer-file-name " | cut -f1 -d' ' | tr -d ' \t\n\r'"))
  )

(defun writer-mode ()
  (interactive)
  (olivetti-mode 1)
  (set-default-font "DejaVu Sans-16")
  (olivetti-set-width 100)

  (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)

  (defun update-mode-line ()
    (setq-default mode-line-format (list "%b " (wc) " words"))
    )

  (defun my-after-save-actions ()
    "Used in `after-save-hook'."
    (update-mode-line)
    )

(add-hook 'after-save-hook 'my-after-save-actions)

  (flyspell-mode)
  (flyspell-buffer)
  (message "Writer mode")
  )


(defun writer-mode-polish ()
  (interactive)
  (ispell-change-dictionary "polish")
  (flyspell-buffer)
  )

(provide 'conf-writing)
