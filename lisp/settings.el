(require 'compile)
(require 'color)
(require 'cl)
(require 'dired-x)

(global-diff-hl-mode 1)
(window-numbering-mode 1)
(setq ring-bell-function 'ignore)

(setq-default tab-width 4)

(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

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
;; (set-face-attribute 'ido-vertical-first-match-face nil
;;                     :background nil
;;                     :foreground mode-line-col-1)
;; (set-face-attribute 'ido-vertical-only-match-face nil
;;                     :background nil
;;                     :foreground mode-line-col-1)
;; (set-face-attribute 'ido-vertical-match-face nil
;;                     :foreground mode-line-col-1
;;                     :underline nil)

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

;; (defun my-find-file-check-make-large-file-read-only-hook ()
  ;; "Handle large files"
  ;; (when (> (buffer-size) (* 1024 50))
    ;; (linum-mode -1)))

;; (add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

(setq multi-term-program "/bin/zsh")

(setq backup-directory-alist `(("." . "~/.saves")))

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

;; (global-company-mode 1)

;; (setq-default tab-width 4)

;; (add-hook 'python-mode-hook
          ;; (lambda ()
            ;; (setq c-basic-offset 4)
            ;; (setq tab-width 4)
            ;; (rainbow-delimiters-mode 1)
            ;; (setq python-indent-offset 4)
            ;; (jedi:setup)
            ;; (add-to-list 'company-backends 'company-jedi)
            ;; (setq jedi:environment-root "jedi")
            ;; (setq jedi:environment-virtualenv
                  ;; (append python-environment-virtualenv
                          ;; '("--python" "python3")))
            ;; (flycheck-mode 1)
            ;; (setq flycheck-checker 'python-pylint
                  ;; flycheck-checker-error-threshold 300
                  ;; flycheck-pylintrc "~/.emacs.d/pylintrc")))

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


(add-hook 'csv-mode-hook (lambda () (font-lock-mode -1)))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 110
                    :weight 'normal
                    :width 'normal)

(set-frame-font "Iosevka" nil t)

(add-to-list 'default-frame-alist
             '(font . "Iosevka"))

(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
		      (loop
               for d = default-directory then (expand-file-name ".." d)
			if (file-exists-p (expand-file-name file d))
			return d
			if (equal d root)
			return nil))))

(provide 'settings)
