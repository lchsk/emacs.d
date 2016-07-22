(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "C-=") 'er/expand-region)

;; Remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; TODO: Merge those two
(bind-key* "M-;" 'toggle-comment-on-line)
(bind-key* "C-c ;" 'comment-or-uncomment-region)

(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "C-x w") 'whitespace-mode)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

(bind-key* "M-n" (lambda () (interactive) (scroll-up-line 5)))
(bind-key* "M-p" (lambda () (interactive) (scroll-down-line 5)))

(bind-key* "C-c w" (lambda () (interactive) (kill-whole-line)))

(bind-key* "C-c t" (lambda () (interactive) (move-to-window-line 0)))
(bind-key* "C-c b" (lambda () (interactive) (move-to-window-line -1)))
(bind-key* "C-c m" (lambda () (interactive) (move-to-window-line-middle)))

(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c J") (lambda () (interactive) (join-line 1)))

;;- ---------------------------------------;;
;;                                         ;;
;;             Helm key bindings           ;;
;;                                         ;;
;;-----------------------------------------;;

(global-set-key (kbd "M-x") 'helm-M-x)
(bind-key* "M-q" (lambda () (interactive) (helm-imenu)))

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(bind-key "M-z" 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(bind-key* "C-c i" 'helm-swoop)
(bind-key* "M-i" 'helm-multi-swoop-all)

(global-set-key [f1] 'shell)
(global-set-key [f2] 'rgrep)
(global-set-key [f3] 'dired-find-file)
(global-set-key [f6] 'revert-this-buffer)

(bind-key* "C-c a" 'auto-complete)
(bind-key* "C-c d" 'duplicate-line)
(bind-key* "C-c p" 'switch-to-previous-buffer)

(bind-key* "C-c c l" 'copy-line)
(bind-key* "C-c k b" 'backward-kill-line)
(bind-key* "C-c w" 'kill-word-at-point)
(bind-key* "C-c k i" (lambda() (interactive) (backward-kill-line 1) (indent-relative)))
(bind-key* "C-c k a" (lambda() (interactive) (smarter-move-beginning-of-line 1) (kill-line)))

(bind-key* "C-," 'goto-last-change)
(bind-key* "C-." 'goto-last-change-reverse)

(bind-key* "C-c f" 'goto-first-reference)
(bind-key* "C-c n" 'ahs-forward)
(bind-key* "C-c p" 'ahs-backward)

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

(add-hook 'c-mode-common-hook
		  (lambda()
			(local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(global-set-key (kbd "TAB") 'self-insert-command)

;; spotify
(global-set-key (kbd "<pause>") #'spotify-playpause)
(global-set-key (kbd "M-<pause>") #'spotify-next)

(provide 'bindings)
