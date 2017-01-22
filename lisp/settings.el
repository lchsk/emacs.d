(global-diff-hl-mode 1)
(window-numbering-mode 1)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

(setq-default tab-width 4)

(menu-bar-mode -1)
(tool-bar-mode -1) 
(set-scroll-bar-mode nil)

(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)

;; case-insensitive search
(setq case-fold-search t)

(setq-default fci-rule-column 80)

(global-fuzzy-format-mode t)
(global-anzu-mode +1)
(global-undo-tree-mode)

(projectile-global-mode)
(recentf-mode)

(popwin-mode 1)

(helm-flx-mode +1)

(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 4)))

(setq multi-term-program "/bin/zsh")

(setq backup-directory-alist `(("." . "~/.saves")))

(ac-config-default)
(setq ac-auto-start nil)

(autopair-global-mode)

(ws-butler-global-mode)

(global-subword-mode)

(add-hook 'prog-mode-hook
          (lambda()
            (rainbow-delimiters-mode)
            (fci-mode)
            (linum-mode)))

(defvaralias 'js-indent-level 'tab-width)
(defvaralias 'c-basic-offset 'tab-width)
(setq c-default-style "k&r")

(add-to-list 'auto-mode-alist '("\\.pkb\\'" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.pks\\'" . sql-mode))

(add-hook 'sql-mode-hook
          (lambda ()
            (setq tab-width 4)))

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
            (setq-default tab-width 4)
            (setq c-basic-offset 4)
            (rainbow-delimiters-mode 1)
            (setq python-indent-offset 4)
            (jedi:setup)
            (flycheck-mode 1)
            (setq flycheck-checker 'python-pylint
                  flycheck-checker-error-threshold 300
                  flycheck-pylintrc "~/.emacs.d/pylintrc")
            ))

(setq flycheck-display-errors-delay 0)

(blink-cursor-mode 0)
(global-hl-line-mode 1)

(setq org-replace-disputed-keys t)
(setq recentf-max-saved-items 100)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; To keep helm window at the bottom: broken
;;(add-to-list 'display-buffer-alist
;;             `(,(rx bos "*helm" (* not-newline) "*" eos)
;;               (display-buffer-in-side-window)
;;               (inhibit-same-window . t)
;;               (window-height . 0.4)))

(defalias 'yes-or-no-p 'y-or-n-p)
(set-face-attribute 'default nil :height 109)

(setq frame-title-format
      '("" invocation-name ": "(:eval (if (buffer-file-name)
          (abbreviate-file-name (buffer-file-name))
          "%b"))))

(defun config-term-mode ()
  (linum-mode 0))

(add-hook 'term-mode-hook 'config-term-mode)

;; Keep helm windows at the bottom using popwin
(push '("^\*helm.+\*$" :regexp t) popwin:special-display-config)
(add-hook 'helm-after-initialize-hook (lambda ()
                                          (popwin:display-buffer helm-buffer t)
                                          (popwin-mode -1)))

;;  Restore popwin-mode after a Helm session finishes.
(add-hook 'helm-cleanup-hook (lambda () (popwin-mode 1)))

(load "server")
(unless (server-running-p) (server-start))

(add-hook
 'dired-mode-hook
 (lambda()
   (define-key dired-mode-map "j" 'ido-find-file)))

;; Org-mode

(set-face-attribute 'org-level-1 nil :weight 'bold   :height 1.2 :foreground "white" :background "#3498db" :box nil)
(set-face-attribute 'org-level-2 nil :weight 'bold   :height 1.1 :foreground "white" :background "#2ecc71" :box nil)
(set-face-attribute 'org-level-3 nil :weight 'normal :height 1.1 :foreground "#f1c40f" :background nil     :box nil)

(provide 'settings)
