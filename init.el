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

;; enable discord rpc
(require 'elcord)
(elcord-mode)

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

;; Custom
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
