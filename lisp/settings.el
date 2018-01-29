(global-diff-hl-mode 1)
(window-numbering-mode 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message t)

(setq-default tab-width 4)

(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

;; (yas-global-mode 1)
;; (setq helm-yas-space-match-any-greedy t)

;; (add-to-list 'load-path
;;              "~/.emacs.d/private/snippets")

;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/private/snippets"))

(setq wttrin-default-accept-language '("Accept-Language" . "en-GB"))

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

(helm-flx-mode +1)

(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (setq js2-basic-offset 4)
                           (when (> (buffer-size) (* 1024 20))
                             (linum-mode -1)
                             (fundamental-mode))))

(defun my-find-file-check-make-large-file-read-only-hook ()
  "Handle large files"
  (when (> (buffer-size) (* 1024 50))
    (linum-mode -1)
    (fundamental-mode)))

(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

(setq multi-term-program "/bin/zsh")

(setq backup-directory-alist `(("." . "~/.saves")))

(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background "gray"))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit default :foreground "red"))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; (autopair-global-mode)

(ws-butler-global-mode)

(global-subword-mode)

(add-hook 'prog-mode-hook
          (lambda()
            (rainbow-delimiters-mode)
            (fci-mode)
            (linum-mode)))

(defvaralias 'js-indent-level 'tab-width)

(add-to-list 'auto-mode-alist '("\\.pkb\\'" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.pks\\'" . sql-mode))

(add-hook 'sql-mode-hook
          (lambda ()
            (setq tab-width 4)))

(add-hook 'css-mode-hook
          (lambda ()
            (rainbow-mode 1)))

(add-hook 'scss-mode-hook
          (lambda ()
            (rainbow-mode 1)))

(global-company-mode 1)

(setq-default tab-width 4)

(add-hook 'python-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq tab-width 4)
            (rainbow-delimiters-mode 1)
            (setq python-indent-offset 4)
            (jedi:setup)
            (add-to-list 'company-backends 'company-jedi)
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

(setq org-bullets-bullet-list '("⚫" "⚪" "⚬" "⚬" "❍" "○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⊙" "⊚" "⊛" "∙" "∘"))

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
                    :foreground "#e3c567"
                    :background "transparent"
                    :box nil)

(setq org-todo-keywords
  '((sequence "TODO" "IN PROGRESS" "DONE")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#c1b4ae"))
        ("IN PROGRESS" . (:foreground "#f19a3e"))
        ("DONE" . (:foreground "#82d173" :weight bold))))
(setq less-imenu-generic-expression
      '(
        (nil "\\(\\(void\\|unsigned\\)\s\\(.*\\)(.*)\\)" 1)))

(defun my-c++-mode-hook ()
;;  (c-set-offset 'substatement-open 0)
;;  (setq c++-tab-always-indent nil)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (electric-pair-mode 1)
  (electric-indent-mode 1)
  ;; (ggtags-mode 1)
  ;; (helm-gtags-mode 1)
  ;; (function-args-mode 1)
  ;; (c-toggle-auto-state 1)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  ;; (irony-mode)
  ;; (add-to-list 'company-backends 'company-irony company-gtags)
  (setq imenu-generic-expression less-imenu-generic-expression)
  ;; (flycheck-mode 1)
  )

(smartparens-global-mode 1)

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

;; (with-eval-after-load 'helm-gtags
  ;; (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
  ;; (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  ;; (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
  ;; (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
  ;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  ;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  ;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))

 (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

;; (defvaralias 'c-basic-offset 'tab-width)
;; (setq c-default-style "linux")

;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'my-irony-mode-hook)

(add-hook 'csv-mode-hook (lambda () (font-lock-mode -1)))

;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)

;; (add-hook 'c++-mode-hook
          ;; (lambda ()
            ;; (setq imenu-generic-expression less-imenu-generic-expression)
            ;; (irony-mode)))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 109
                    :weight 'normal
                    :width 'normal)

(set-frame-font "Iosevka 10" nil t)

(add-to-list 'default-frame-alist
             '(font . "Iosevka 10"))

(defun get-random-element (list)
  "Returns a random element of LIST."
  (if (and list (listp list))
      (nth (random (1- (1+ (length list)))) list)
    (error "Argument to get-random-element not a list or the list is empty")))

(defvar scratch-quotes
  (list
   "The universe is not here to please you. - Charles Murtaugh"
   "Beware of things that are fun to argue. - Eliezer Yudkowsky"
   "However beautiful the strategy, you should occasionally look at the result. - Winston Churchill"
   "Truth is much too complicated to allow anything but approximations. - John Von Neumann"
   "Writing program code is a good way of debugging your thinking. - Bill Venables"
   "Don't tell me what you value. Show me your budget, and I'll tell you what you value. - Joe Biden quoting his father"
   "Most haystacks do not even have a needle. - Lorenzo"
   "Experiment and theory often show remarkable agreement when performed in the same laboratory. - Daniel Bershader"
   "The important work of moving the world forward does not wait to be done by perfect men. - George Eliot"
   "It is astonishing what foolish things a man thinking alone can come temporarily to believe. - Keynes"
   "The purpose of computing is Insight, not numbers. - Richard Hamming"
   "Sometimes magic is just someone spending more time on something than anyone else might reasonably expect. - Teller"
   ))

(defun get-random-quote ()
  (interactive)
  (get-random-element scratch-quotes))

(setq-default initial-scratch-message
              (get-random-quote))

(provide 'settings)
