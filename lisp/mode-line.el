(setq-default
 mode-line-format


 '(; Position, including warning for 80 columns
   (:propertize (
                 (:eval(
                        format
                        " %s "
                        (window-numbering-get-number-string)
                        )))
                'face ((':background (mode-line-col-1)) ':foreground "white"))

    (:propertize "%l:" face mode-line-position-face)
    (:eval (propertize "%c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-position-face)))
   ; emacsclient [default -- keep?]
   ;; mode-line-client
   ""
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " * " 'face 'mode-line-modified-face))
          (t "")))
   " "
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 30))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)

      (:propertize (
                 (:eval
                  (format
                   "%s"
                   (if indent-tabs-mode " T " " S "))))
                   face mode-line-filename-face
                )
   ; narrow [default -- keep?]
   "%n"
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   ;; (vc-mode vc-mode)

      (:propertize (
                 (:eval (
                         concat (
                                 replace-regexp-in-string
                                 "^ Git[:-]"
                                 ""
                                 vc-mode
                                 )
                                "")))
                   face mode-line-filename-face
				   )


   " %["
   (:propertize mode-name
                face mode-line-mode-face)
   "%] "
   ;; (:eval (propertize (format-mode-line minor-mode-alist)
                      ;; 'face 'mode-line-minor-mode-face))
   ;; (:propertize mode-line-process
                ;; face mode-line-process-face)
   (global-mode-string global-mode-string)
   ""
   ; nyan-mode uses nyan cat as an alternative to %p
   ;; (:eval (when nyan-mode (list (nyan-create))))
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
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
    :foreground "gray60" :background "gray20"
    :inverse-video nil
    :box '(:line-width 6 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
    :foreground "gray80" :background "gray40"
    :inverse-video nil
    :box '(:line-width 6 :color "gray40" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "#4271ae"
    :box '(:line-width 2 :color "#4271ae"))
(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "#c82829"
    :background "#ffffff"
    :box '(:line-width 2 :color "#c82829"))
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#eab700"
    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face
    :family "Menlo" :height 100)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "gray40"
    :height 110)
(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-position-face
    :foreground "black" :background "#eab700")



;; (set-face-background 'mode-line "#f1c40f")

;; (defvar mode-line-col-1 "#ff00ff")

;; (message "%s" mode-line-col-1)

;; (setq-default mode-line-format
;;  '(
;;    (:propertize (
;;                  (:eval(
;;                         format
;;                         " %s "
;;                         (window-numbering-get-number-string)
;;                         )))
;;                 'face ((':background (mode-line-col-1)) ':foreground "white"))

;;    (:eval
;;     (
;;      when (eql buffer-read-only t)
;;       (propertize
;;        " (R) "
;;        'face '(
;;                :foreground
;;                "white"
;;                :background
;;                "#eb6841"
;;                :weight
;;                bold))))

;;    (:eval
;;     (propertize
;;      " %b "
;;      'face
;;      (if (buffer-modified-p)
;;          '(
;;            :background
;;            "#CC333F"
;;            :foreground
;;            "white"
;;            :weight
;;            bold)
;;        '(
;;          :background
;;          "#00A0B0"
;;          :foreground
;;          "white"
;;          :weight
;;          bold))))

;;    (:propertize (
;;                  (:eval
;;                   (format
;;                    "%s"
;;                    (if indent-tabs-mode " (T) " " (S) "))))
;;                 face (
;;                       :background
;;                       "#6a4a3c"
;;                       :foreground
;;                       "white"))

;;    ;; Major mode
;;    (:propertize
;;     " %m "
;;     face (
;;           :background
;;           "#6A4A3C"
;;           :foreground
;;           "white"))

;;    (:propertize (
;;                  (:eval (
;;                          concat (
;;                                  replace-regexp-in-string
;;                                  "^ Git[:-]"
;;                                  " "
;;                                  vc-mode
;;                                  )
;;                                 " ")))
;;                 face (
;;                       :weight
;;                       normal
;;                       :background
;;                       "#EB6841"
;;                       :foreground
;;                       "white"))

;;    (:propertize (
;;                  (:eval (
;;                          format
;;                          " %s "
;;                          (vc-state
;;                           (buffer-file-name
;;                            (current-buffer))))))
;;                 face (
;;                       :weight:
;;                       bold
;;                       :background
;;                       "#CC333F"
;;                       :foreground
;;                       "white"))

;;    (:propertize
;;     " %l:%c "
;;     face (
;;           :background
;;           "#CC333F"
;;           :foreground
;;           "white"
;;           :weight
;;           light))))

;; (provide 'mode-line)
