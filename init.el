
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil)

(require 'init-elpa)
(require 'init-global)

(require 'packages)

(require 'theme)

;; Languages

(require 'conf-python)
(require 'conf-cpp)
(require 'conf-go)
(require 'conf-writing)
(require 'conf-git)
(require 'conf-rust)
(require 'conf-js)
(require 'conf-haskell)
(require 'conf-yasnippet)
(require 'conf-org)
(require 'conf-docker)
(require 'conf-neotree)

(require 'settings)
(require 'utility-funcs)
(require 'mode-line)
(require 'bindings)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (neotree ac-ispell flyspell-correct-helm flyspell-correct-ivy flyspell-correct visual-fill-column visual-fill-mode ac-helm helm-ack yaml-mode ws-butler writeroom-mode window-numbering web-mode smart-mode-line realgud rainbow-mode rainbow-delimiters popwin plsql multi-term material-theme magit js2-mode jedi iedit highlight-symbol helm-swoop helm-projectile helm-flx helm-c-yasnippet haskell-mode go-mode git-timemachine fuzzy-format flycheck-pos-tip fill-column-indicator evil diminish diff-hl default-text-scale cmake-mode change-inner buffer-move bind-key autopair anzu anaconda-mode)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#419941994199"))))
 '(company-scrollbar-fg ((t (:background "#34cc34cc34cc"))))
 '(company-tooltip ((t (:inherit default :background "gray"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit default :foreground "red")))))
 ;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
