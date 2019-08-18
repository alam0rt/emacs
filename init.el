(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
 ;; This is required for melpa to work
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-go company-anaconda anaconda-mode smartparens go-mode flycheck company zoom dashboard page-break-lines ## evil)))
 '(zoom-mode t nil (zoom))
 '(zoom-size (quote (0.618 . 0.618))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; use shift + arrow keys to move windows (WindMove)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
 ;; No toolbar
(tool-bar-mode -1)
(require 'evil)
(evil-mode 1) ;; the true way
(add-hook 'after-init-hook #'global-flycheck-mode) ;; enable flycheck mode
(add-hook 'after-init-hook 'global-company-mode) ;; enable company mode
(add-hook 'python-mode-hook 'anaconda-mode) ;; enable anaconda mode in python buffers

  ;; Show a dashboard on start-up
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Smart parens mode
(require 'smartparens-config)

;; set default `company-backends`
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-go))
(provide 'init)
;;; init.el ends here
