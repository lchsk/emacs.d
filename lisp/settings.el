(global-diff-hl-mode 1)
(window-numbering-mode 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message t)

(setq-default tab-width 4)

(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

(yas-global-mode 1)
(setq helm-yas-space-match-any-greedy t)

(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground mode-line-col-1)
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground mode-line-col-1)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground mode-line-col-1
                    :underline nil)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(setq calendar-week-start-day 1)

(flimenu-global-mode)

(setq uniquify-separator " • ")
(setq uniquify-ignore-buffers-re "^\\*")
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-after-kill-buffer-p t)

;; case-insensitive search
(setq case-fold-search t)

(setq-default fci-rule-column 80)

(global-fuzzy-format-mode t)
(global-anzu-mode +1)
(global-undo-tree-mode)

(projectile-global-mode)
(recentf-mode)

;;(popwin-mode 1)

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

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(setq flycheck-display-errors-delay 0)

(blink-cursor-mode 0)
(global-hl-line-mode 1)

(setq org-replace-disputed-keys t)
(setq recentf-max-saved-items 100)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq frame-title-format
      '("" invocation-name ": "(:eval (if (buffer-file-name)
          (abbreviate-file-name (buffer-file-name))
          "%b"))))

(defun config-term-mode ()
  (linum-mode 0))

(add-hook 'term-mode-hook 'config-term-mode)

;; Keep helm windows at the bottom using popwin
;; (push '("^\*helm.+\*$" :regexp t) popwin:special-display-config)
;; (add-hook 'helm-after-initialize-hook (lambda ()
                                          ;; (popwin:display-buffer helm-buffer t)
                                          ;; (popwin-mode -1)))

;;  Restore popwin-mode after a Helm session finishes.
;; (add-hook 'helm-cleanup-hook (lambda () (popwin-mode 1)))

(load "server")
(unless (server-running-p) (server-start))

(add-hook
 'dired-mode-hook
 (lambda()
   (define-key dired-mode-map "j" 'ido-find-file)))

(setq dired-listing-switches "-alh")

;; Org-mode

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq org-bullets-bullet-list '("⚫" "⚪" "⚬" "❍" "○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚬" "⊙" "⊚" "⊛" "∙" "∘"))

(setq org-ellipsis " ➜")

(set-face-attribute 'org-level-1 nil
                    :weight 'bold
                    :height 1.0
                    :foreground "#f1c40f"
                    :background "transparent"
                    :box nil)
(set-face-attribute 'org-level-2 nil
                    :weight 'normal
                    :height 1.0
                    :foreground "#2ecc71"
                    :background "transparent"
                    :box nil)
(set-face-attribute 'org-level-3 nil
                    :weight 'normal
                    :height 1.0
                    :foreground "#ffffff"
                    :background "transparent"
                    :box nil)

(setq less-imenu-generic-expression
      '(
        (nil "\\(\\(void\\|unsigned\\)\s\\(.*\\)(.*)\\)" 1)))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq imenu-generic-expression less-imenu-generic-expression)))

(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 109
                    :weight 'normal
                    :width 'normal)

(provide 'settings)
