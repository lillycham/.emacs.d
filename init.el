
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
 '(default ((t (:inherit nil :stipple nil :background "#000919" :foreground "#c3c0bb" :inverse-video nil :box nil :strike-through nil :extend nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Liga SFMono Nerd Font")))))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
