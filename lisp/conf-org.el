(require-package 'org-bullets)
(require 'org-bullets)


(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode 1)
                           (outline-show-all)
                           (visual-line-mode 1)
                           ))
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


(provide 'conf-org)
