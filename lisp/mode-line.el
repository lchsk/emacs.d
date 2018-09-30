
(defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))

  (defun sl/make-header ()
    ""
    (let* ((sl/full-header (abbreviate-file-name buffer-file-name))
           (sl/header (file-name-directory sl/full-header))
           (sl/drop-str "... "))
      (if (> (length sl/full-header)
             (window-body-width))
          (if (> (length sl/header)
                 (window-body-width))
              (progn
                (concat (with-face sl/drop-str
                                   ;; :foreground mode-line-col-1
                                   :weight 'normal
                                   :height 90
                                   )
                        (with-face (substring sl/header
                                              (+ (- (length sl/header)
                                                    (window-body-width))
                                                 (length sl/drop-str))
                                              (length sl/header))
                                   :weight 'normal
                                   ;; :foreground mode-line-col-2
                                   :height 90
                                   )))
            (concat (with-face sl/header
                               ;; :foreground mode-line-col-2
                               :weight 'normal
							   :height 90
                               )
                    (with-face (file-name-nondirectory buffer-file-name)
                           :weight 'normal
                           :height 90
                           ;; :foreground mode-line-col-1
                           )

                    ))
        (concat (with-face sl/header
                           :weight 'normal
                           ;; :foreground mode-line-col-2
						   :height 90
                           )
                (with-face (file-name-nondirectory buffer-file-name)
                           :weight 'normal
                           :height 90
                           ;; :foreground mode-line-col-1
                           )))))

  (defun sl/display-header ()
    (setq header-line-format
          '("" ;; invocation-name
            (:eval (if (buffer-file-name)
                       (sl/make-header)
                     "%b")))))



  (add-hook 'buffer-list-update-hook
            'sl/display-header)

(setq-default
 mode-line-format

 '(
  ""
        (:propertize (
                 (:eval(
                        format
                        "%s "
                        (window-numbering-get-number-string))))
					 face mode-line
					 )

   (:eval
    (cond (buffer-read-only
           (propertize "¯\\_(ツ)_/¯ " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize "** " 'face 'mode-line-modified-face))
          (t "")))
   ""
   (:propertize "%b"
                face mode-line-filename-face)

   "%n"
   " %p"

    (:propertize " %l:" face mode-line-position-face)
    (:eval (propertize "%c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-position-face)))

      (:propertize (
                 (:eval
                  (format
                   "%s"
                   (if indent-tabs-mode " T " " S "))))
                   face mode-line
                )

       (:propertize (
                 (:eval (
                         concat (
                                 replace-regexp-in-string
                                 "^ Git[@:-]"
                                 ""
								 (if (stringp vc-mode)
									 (substring-no-properties vc-mode)
								   "")
                                 )
                                "")))
                   face mode-line
				   )

   " %["
   (:propertize mode-name
                face mode-line)
   "%] "
   (global-mode-string global-mode-string)
   ""
   ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat "../" output)))
    output))

(provide 'mode-line)
