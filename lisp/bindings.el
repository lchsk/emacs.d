(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "C-=") 'er/expand-region)

;; Remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(bind-key* "M-;" 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "C-x w") 'whitespace-mode)
(global-set-key (kbd "M-[") 'forward-paragraph)
(global-set-key (kbd "M-]") 'backward-paragraph)
(global-set-key (kbd "M-{") 'forward-sexp)
(global-set-key (kbd "M-}") 'backward-sexp)
(global-set-key (kbd "C-c N") 'next-buffer)
(global-set-key (kbd "C-c P") 'previous-buffer)

;; (bind-key* "M-n" (
                  ;; lambda ()
                         ;; (interactive)
                         ;; (scroll-up-line 5)
                         ;; (move-to-window-line-middle)
                         ;; ))
;; (bind-key* "M-p" (
                  ;; lambda ()
                         ;; (interactive)
                         ;; (scroll-down-line 5)
                         ;; (move-to-window-line-middle)
                         ;; ))

(bind-key* "C-v" (
                  lambda ()
                         (interactive)
                         (scroll-up-command)
                         (move-to-window-line-middle)
                         ))
(bind-key* "M-v" (
                  lambda ()
                         (interactive)
                         (scroll-down-command)
                         (move-to-window-line-middle)
                         ))

;;- ---------------------------------------;;
;;                                         ;;
;;             Helm key bindings           ;;
;;                                         ;;
;;-----------------------------------------;;

(global-set-key (kbd "M-x") 'helm-M-x)
(bind-key* "M-q" (lambda () (interactive) (helm-imenu)))

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(bind-key "M-m" 'helm-mini)
(bind-key "M-z" 'helm-projectile)
;; (bind-key "M-p" 'helm-recentf)
(bind-key "M-p" 'ido-recentf-open)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(bind-key "C-x d" 'ido-dired)
;;(bind-key* "C-c i" 'helm-swoop)
;;(bind-key* "" 'helm-multi-swoop-all)

(global-set-key [f1] 'multi-term)
(global-set-key [f2] 'rgrep)
(global-set-key [f3] 'dired-find-file)
(global-set-key [f4] 'run-python)
(global-set-key [f5] 'revert-this-buffer)
(global-set-key [f9] 'make-frame)
(global-set-key [f10] 'delete-frame)

;; (bind-key* "C-," 'goto-last-change)
;; (bind-key* "C-." 'goto-last-change-reverse)
(bind-key* "C-," 'mark-word)
(bind-key* "C-." 'mark-current-line)
(bind-key* "C-<" 'mark-end-of-sentence)
(bind-key* "C->" 'mark-sexp)


(bind-key* "C-c a" 'ac-complete-with-helm)
(bind-key* "C-c b" 'magit-blame)
(bind-key* "C-c c" 'helm-occur)
(bind-key* "C-c d" 'duplicate-line)
(bind-key* "C-c f" 'goto-first-reference)
(bind-key* "C-c g" 'helm-google-suggest)
(bind-key* "C-c h" 'highlight-symbol)
(bind-key* "C-c i" 'change-inner)
(bind-key* "C-j" 'join-line)
(bind-key* "C-c t" 'tabs-mode)
(bind-key* "C-c k" 'kill-word-at-point)
(bind-key* "C-c s" 'fixup-whitespace)
(bind-key* "C-c n" 'highlight-symbol-next)
(bind-key* "C-c p" 'highlight-symbol-prev)
(bind-key* "C-c r" 'replace-string)
(bind-key* "C-c l" 'copy-line)
(bind-key* "C-c W" (lambda () (interactive) (kill-whole-line)))

(bind-key* "C-c ]" 'multi-term-next)
(bind-key* "C-c [" 'multi-term-prev)

(bind-key* "C-c C" 'calendar)
(bind-key* "C-c E" 'eval-buffer)
(bind-key* "C-c G" 'align-entire)
(bind-key* "C-c H" 'highlight-symbol-remove-all)
(bind-key* "C-c J" '(lambda () (interactive) (join-line 1)))

(bind-key* "C-c L" 'magit-log-head)
(bind-key* "C-c O" 'change-outer)
;; (bind-key* "C-c P" 'switch-to-previous-buffer)
(bind-key* "C-c R" 'align-regexp)
;; (bind-key* "C-c S" 'smerge-mode)
(bind-key* "C-c T" 'toggle-window-split)
;; (bind-key* "C-c N" 'smerge-next)
(bind-key* "C-c w" 'save-buffer-tabs)

(bind-key* "C-<tab>" 'bury-buffer)
(bind-key* "C-S-<tab>" 'unbury-buffer)

(bind-key* "C-m m" 'mc/edit-lines)
(bind-key* "C-m n" 'mc/mark-next-like-this)
(bind-key* "C-m p" 'mc/mark-previous-like-this)
(bind-key* "C-m a" 'mc/mark-all-like-this)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-return>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-M-return>") 'enlarge-window-horizontally)

;; Magit
(bind-key* "C-x g" 'magit-status)

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

;; Windows
(bind-key* "C-x 3" 'split-window-right-and-rebalance)
(bind-key* "C-x 2" 'split-window-below-and-rebalance)
(bind-key* "C-x 0" 'delete-window-and-rebalance)

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(global-set-key [remap kill-whole-line] 'smart-kill-whole-line)
;;(global-set-key (kbd "TAB") 'self-insert-command)

;; spotify
(global-set-key (kbd "<pause>") #'spotify-playpause)
(global-set-key (kbd "M-<pause>") #'spotify-next)

(provide 'bindings)
