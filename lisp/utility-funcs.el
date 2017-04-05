(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map (kbd "c") 'my-dired-create-file)
     (defun create-new-file (file-list)
       (defun exsitp-untitled-x (file-list cnt)
         (while (and (car file-list) (not (string= (car file-list) (""))))
           (setq file-list (cdr file-list)))
         (car file-list))

       (defun exsitp-untitled (file-list)
         (while (and (car file-list) (not (string= (car file-list) "")))
           (setq file-list (cdr file-list)))
         (car file-list))

       (if (not (exsitp-untitled file-list))
           ""
         (let ((cnt 2))
           (while (exsitp-untitled-x file-list cnt)
             (setq cnt (1+ cnt)))
           ("")
           )
         )
       )
     (defun my-dired-create-file (file)
       (interactive
        (list (read-file-name "Create file: " (concat (dired-current-directory) (create-new-file (directory-files (dired-current-directory))))))
        )
       (write-region "" nil (expand-file-name file) t)
       (dired-add-file file)
       (revert-buffer)
       (dired-goto-file (expand-file-name file))
       )
     )
  )


(defun goto-first-reference ()
  (interactive)
  (eval
   `(progn
      (goto-char (point-min))
      (search-forward-regexp
       (rx symbol-start ,(thing-at-point 'symbol) symbol-end))
      (beginning-of-thing 'symbol))))

(defun remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "" nil t))))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun mark-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t)
  (message (concat "Reverted buffer " (buffer-name))))

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(defun writing-stuff ()
  (interactive)
  (visual-line-mode)
  (visual-fill-column-mode)
)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
		(end (line-end-position arg)))
	(when mark-active
	  (if (> (point) (mark))
		  (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
		(setq end (save-excursion (goto-char (mark)) (line-end-position)))))
	(if (eq last-command 'copy-line)
		(kill-append (buffer-substring beg end) (< end beg))
	  (kill-ring-save beg end)))
  (kill-append "" nil)
  (beginning-of-line (or (and arg (1+ arg)) 2))
  (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not '(
                               lambda (x) (
                                           or (buffer-file-name x)
                                              (eq 'dired-mode
                                                  (buffer-local-value 'major-mode x))))
                             (buffer-list)))))

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun move-to-window-line-middle ()
  (interactive)
  (let* ((wb-height (window-buffer-height (get-buffer-window)))
        (actual-height (if (> wb-height (window-height))
                           (window-height)
                         wb-height)))
    (move-to-window-line (/ actual-height 2))))

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(defun kill-thing-at-point (thing)
  "Kill the `thing-at-point' for the specified kind of THING."
  (let ((bounds (bounds-of-thing-at-point thing)))
    (if bounds
        (kill-region (car bounds) (cdr bounds))
      (error "No %s at point" thing))))

(defun kill-word-at-point ()
  "Kill the word at point."
  (interactive)
  (kill-thing-at-point 'word))

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(defun smart-kill-whole-line (&optional arg)
  "A simple wrapper around `kill-whole-line' that respects indentation."
  (interactive "P")
  (kill-whole-line arg)
  (back-to-indentation))

(defun split-window-right-and-rebalance ()
  (interactive)
  (split-window-right)
  (balance-windows)
  )

(defun split-window-below-and-rebalance ()
  (interactive)
  (split-window-below)
  (balance-windows)
  )

(defun delete-window-and-rebalance ()
  (interactive)
  (delete-window)
  (balance-windows)
  )

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defvar my-mode-line-buffer-line-count nil)
(make-variable-buffer-local 'my-mode-line-buffer-line-count)

(setq-default mode-line-format
              '("  " mode-line-modified
                (list 'line-number-mode "  ")
                (:eval (when line-number-mode
                         (let ((str "L%l"))
                           (when (and (not (buffer-modified-p)) my-mode-line-buffer-line-count)
                             (setq str (concat str "/" my-mode-line-buffer-line-count)))
                           str)))
                "  %p"
                (list 'column-number-mode "  C%c")
                "  " mode-line-buffer-identification
                "  " mode-line-modes))

(defun my-mode-line-count-lines ()
  (setq my-mode-line-buffer-line-count (int-to-string (count-lines (point-min) (point-max)))))

;;(add-hook 'find-file-hook 'my-mode-line-count-lines)
;;(add-hook 'after-save-hook 'my-mode-line-count-lines)
;;(add-hook 'after-revert-hook 'my-mode-line-count-lines)
;;(add-hook 'dired-after-readin-hook 'my-mode-line-count-lines)

(defun tabs-mode ()
  (interactive)
  (setq indent-tabs-mode t))

(defun save-buffer-tabs ()
  (interactive)
  (setq indent-tabs-mode t)
  (save-buffer)
  (setq indent-tabs-mode t))

(defun ido-imenu-anywhere ()
  "IDO interface for `imenu-anywhere'.
This is a simple wrapper around `imenu-anywhere' which uses
`ido-completing-read' as `completing-read-function'. If you use
`ido-ubiquitous' you might be better off by using `ido-anywhere'
instead, but there should be little or no difference."
  (interactive)
  (require 'ido)
  (let ((imenu-anywhere-preprocess-entry-function #'imenu-anywhere-preprocess-for-completion)
        (completing-read-function 'ido-completing-read))
    (imenu-anywhere)))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))

(defun terminal ()
  "Switch to terminal. Launch if nonexistent."
  (interactive)
  (if (get-buffer "*ansi-term*")
      (switch-to-buffer "*ansi-term*")
    (ansi-term "/bin/zsh"))
  (get-buffer-process "*ansi-term*"))

(defalias 'tt 'terminal)

(defun dired-open-term ()
  "Open an `ansi-term' that corresponds to current directory."
  (interactive)
  (let ((current-dir (dired-current-directory)))
    (term-send-string
     (terminal)
     (if (file-remote-p current-dir)
         (let ((v (tramp-dissect-file-name current-dir t)))
           (format "ssh %s@%s\n"
                   (aref v 1) (aref v 2)))
       (format "cd '%s'\n" current-dir)))))

(defun join-lines ()
    (interactive)
    (setq fill-column 100000)
    (fill-paragraph nil))

(defun insert-uuid ()
  (interactive)
  (insert
   (replace-regexp-in-string
    "\n\\'" ""
    (shell-command-to-string "uuidgen"))))

(defun insert-date ()
  (interactive)
  (insert
   (replace-regexp-in-string
    "\n\\'" ""
    (shell-command-to-string "date +%d-%m-%Y\\ %H:%M"))))

(defun clear-recentf-list ()
  (interactive)
  (setq recentf-list '()))

(provide 'utility-funcs)
