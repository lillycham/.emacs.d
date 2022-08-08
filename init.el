;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

;; Add MELPA package repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Set theme
(use-package ayu-theme
  :config (load-theme 'ayu-grey t))

;; Enable dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Dashboard config
;; Set the title
(setq dashboard-banner-logo-title "Welcome to GNU Emacs, Lilly.")
;; Enable init info
(setq dashboard-set-init-info t)
;; Use cool emacs logo instead of the GNU one
(setq dashboard-startup-banner 'logo)
;; Custom footer
(setq dashboard-footer-messages '("Have a nice day!"))
(setq dashboard-footer-icon (all-the-icons-octicon "heart"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face))
;; Center content
(setq dashboard-center-content t)

;; Use dashboard as initial buffer.
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; Use doom modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

;; Set height for modeline
(setq-default doom-modeline-height 30)

;; enable discord rpc
(require 'elcord)
(elcord-mode)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Use transient mark
(transient-mark-mode 1)

;;; Org mode configuration
;; Enable Org mode
(require 'org)

;; enable web mode for jsx
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

;; enable 80 col ruler
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; enable line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; use bar cursor
(setq-default cursor-type 'bar)

;; disable tilde file stuff
(setq backup-directory-alist `(("." . "~/.emacs.bak")))

;; Enable racket xp minor mode
(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)

;; Enable code completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'racket-mode-hook 'company-mode)
(add-hook 'racket-repl-mode-hook 'company-mode)
(add-to-list 'company-backends #'company-tabnine)


;; Disable tool bar
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2c613514f52fb56d34d00cc074fe6b5f4769b4b7f0cc12d22787808addcef12c" default))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000919" :foreground "#c3c0bb" :inverse-video nil :box nil :strike-through nil :extend nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Liga SFMono Nerd Font"))))
 '(line-number ((t (:inherit (shadow default) :background "gray7"))))
 '(line-number-current-line ((t (:foreground "VioletRed1" :inherit line-number)))))
