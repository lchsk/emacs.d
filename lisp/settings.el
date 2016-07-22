(global-linum-mode 1)
(global-diff-hl-mode 1)
(window-numbering-mode 1)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(set-scroll-bar-mode nil)
(global-fuzzy-format-mode t)
(global-anzu-mode +1)

(add-hook 'prog-mode-hook
          (lambda()
            (rainbow-delimiters-mode)
            (fci-mode)
             ))

;;(unless (version<= emacs-version "24.4")
;;  (global-prettify-symbols-mode 0))

(setq tab-width 4)

(defvaralias 'js-indent-level 'tab-width)
(defvaralias 'c-basic-offset 'tab-width)
;;(setq c-default-style "linux")

(defun my-c-mode-common-hook ()
;;  (c-set-offset 'substatement-open 0)
;;  (setq c++-tab-always-indent nil)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'python-mode-hook
		  (lambda ()
;;			(setq-default indent-tabs-mode t)
			(setq-default tab-width 4)
;;			(setq-default py-indent-tabs-mode t)
			(setq c-basic-offset 4)
			(rainbow-delimiters-mode 1)
			(setq python-indent-offset 4)
			))

(blink-cursor-mode 0)
(global-hl-line-mode 1)

(setq org-replace-disputed-keys t)
(setq recentf-max-saved-items 50)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(add-to-list 'display-buffer-alist
             `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.4)))

(provide 'settings)
