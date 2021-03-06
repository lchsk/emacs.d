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
(global-set-key (kbd "M-n") 'forward-paragraph)  ;; M-[
(global-set-key (kbd "M-p") 'backward-paragraph) ;; M-]
(global-set-key (kbd "M-{") 'forward-sexp)
(global-set-key (kbd "M-}") 'backward-sexp)
(global-set-key (kbd "C-c N") 'next-buffer)
(global-set-key (kbd "C-c P") 'previous-buffer)

;; (bind-key* "C-v" (
                  ;; lambda ()
                         ;; (interactive)
                         ;; (scroll-up-command)
                         ;; (move-to-window-line-middle)
                         ;; ))
;; (bind-key* "M-v" (
                  ;; lambda ()
                         ;; (interactive)
                         ;; (scroll-down-command)
                         ;; (move-to-window-line-middle)
                         ;; ))

;;- ---------------------------------------;;
;;                                         ;;
;;             Helm key bindings           ;;
;;                                         ;;
;;-----------------------------------------;;

(global-set-key (kbd "M-x") 'helm-M-x)
;; (bind-key* "M-q" (lambda () (interactive) (idomenu)))
(bind-key* "M-q" (lambda () (interactive) (helm-imenu)))

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (bind-key "M-m" 'helm-projectile-ag)
;; (bind-key "M-m" 'helm-multi-swoop-projectile)
(bind-key "M-m" 'helm-grep-do-git-grep)
(bind-key "M-`" 'helm-projectile)
(bind-key "M-z" 'helm-mark-ring)
;; (bind-key* "M-s" 'projectile-recentf)
(bind-key* "M-s" 'ido-recentf-open)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(bind-key "C-x d" 'ido-dired)
;; (bind-key* "" 'helm-multi-swoop-all)
;; (bind-key "C-M-*" 'helm-ag-this-file)

(bind-key* "C-x C-j" 'dired-jump)

;; (global-set-key [f1] 'multi-term)
;; (global-set-key [f2] 'rgrep)
;; (global-set-key [f3] 'dired-find-file)
;; (global-set-key [f4] 'run-python)

(global-unset-key (kbd "C-x k"))

(bind-key* "C-x k" (lambda () (interactive) (kill-buffer)))

;; (bind-key* "C-," 'goto-last-change)
;; (bind-key* "C-." 'goto-last-change-reverse)
(bind-key* "M-@" 'sp-mark-sexp)
(bind-key* "C-," 'mark-word)
(bind-key* "C-." 'mark-current-line)
(bind-key* "C-<" 'mark-end-of-sentence)
(bind-key* "C->" 'mark-sexp)

;; (bind-key* "C-c a" 'ac-complete-with-helm)
;; (bind-key* "C-c a" 'auto-complete)
(bind-key* "C-c b" 'magit-blame)
(bind-key* "C-c c" 'helm-occur)
(bind-key* "C-c d" 'duplicate-line)
(bind-key* "C-c f" 'goto-first-reference)
(bind-key* "C-c g" 'helm-google-suggest)
(bind-key* "C-c h" 'highlight-symbol)
(bind-key* "C-c i" 'change-inner)
(bind-key* "C-J" 'join-line)
(bind-key* "C-c t" 'tabs-mode)
(bind-key* "C-c k" 'kill-word-at-point)
(bind-key* "C-c s" 'fixup-whitespace)
(bind-key* "C-c n" 'highlight-symbol-next)
(bind-key* "C-c p" 'highlight-symbol-prev)

(bind-key* "C-c r" 'replace-string)
(bind-key* "C-c l" 'copy-line)
(bind-key* "C-c y" 'helm-yas-complete)
(bind-key* "C-c W" (lambda () (interactive) (kill-whole-line)))

(bind-key* "C-x 7" 'make-frame)
(bind-key* "C-x 9" 'delete-frame)

(bind-key "C-x f" 'helm-gtags-find-files)
(bind-key "C-x t" 'helm-gtags-find-tag)
(bind-key "C-x Y" 'helm-gtags-find-symbol)
(bind-key "C-x y" 'helm-gtags-select)
(bind-key "C-x m" 'helm-gtags-dwim)
(bind-key "C-x j" 'helm-gtags-parse-file)

(bind-key* "C-x r" 'revert-this-buffer)

(bind-key* "C-c ]" 'helm-ag)

(bind-key* "C-c C" 'calendar)
(bind-key* "C-c E" 'eval-buffer)
(bind-key* "C-c G" 'align-entire)
(bind-key* "C-c H" 'highlight-symbol-remove-all)
(bind-key* "C-c J" '(lambda () (interactive) (join-line 1)))

(bind-key* "C-c O" 'change-outer)
(bind-key* "C-c R" 'align-regexp)
(bind-key* "C-c T" 'toggle-window-split)
(bind-key* "C-`" 'dired-open-term)

(bind-key* "C-c w" 'save-buffer-tabs)

(bind-key* "C-<tab>" 'bury-buffer)
(bind-key* "C-S-<tab>" 'unbury-buffer)

(bind-key* "C-S-l" 'mc/edit-lines)
(bind-key* "C-S-o" 'mc/mark-next-like-this)
(bind-key* "C-S-t" 'mc/mark-previous-like-this)
(bind-key* "C-S-x" 'mc/mark-all-like-this)

(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-m") 'helm-M-x)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-return>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-M-return>") 'enlarge-window-horizontally)

;; Magit
(bind-key* "C-S-m" 'magit-status)
(bind-key* "C-S-l" 'magit-log-head)
(bind-key* "C-S-c" 'magit-checkout)

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
;;(global-set-key (kbd "<pause>") #'spotify-playpause)
;;(global-set-key (kbd "M-<pause>") #'spotify-next)

(provide 'bindings)
