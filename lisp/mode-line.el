(set-face-background 'mode-line "#EDC951")

(setq-default mode-line-format
      '(
        ;; add a noticeable red block that says 'READ ONLY' when the file's, er, read only
        (:eval
         (when (eql buffer-read-only t)
             (propertize " (R) " 'face
                         '(:foreground "white" :background "#eb6841" :weight bold))))
        (:eval
         (propertize " %b " 'face
                     (if (buffer-modified-p)
                         '(:background "#CC333F" :foreground "white" :weight bold)
                       '(:background "#00A0B0" :foreground "white" :weight bold))))
	(:propertize (
		      (:eval (format "%s" (if indent-tabs-mode " (T) " " (S) "))))
		     face (:background "#6a4a3c" :foreground "white"))
        (:propertize " %m " face (:background "#6A4A3C" :foreground "white"))
        (:propertize (
		      (:eval (
                  concat (replace-regexp-in-string "^ Git[:-]" " " vc-mode) " " )))
		     face (:weight normal :background "#EB6841" :foreground "white"))
        (:propertize " %l:%c " face (:background "#CC333F" :foreground "white" :weight light))))

(provide 'mode-line)
