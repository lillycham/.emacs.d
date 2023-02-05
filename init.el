;; Add MELPA package repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Initialise use-package
(eval-when-compile
  (require 'use-package))

;; Import visual stuff
(use-package theming
  :load-path "~/.emacs.d/theming.el")

(use-package keys-meow
  :load-path "~/.emacs.d/keys-meow.el")

(use-package treemacs-conf
  :defer t
  :load-path "~/.emacs.d/treemacs-conf.el")

;; Import language servers, support etc.
(use-package languages
  :defer t
  :load-path "~/.emacs.d/languages.el")

;; Import org config
(use-package org-conf
  :defer t
  :load-path "~/.emacs.d/org-conf.el")

;; enable discord rpc
(use-package elcord
  :config (elcord-mode 1))

;; disable tilde file stuff
(setq backup-directory-alist `(("." . "~/.emacs.bak")))

;; Enable fzf fuzzy finder
(use-package fzf
  :defer t
  :ensure t
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

;; Use transient mark
(transient-mark-mode 1)

;; Use corfu completions
(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-auto t)                 ;; Enable auto completion
  
  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-excluded-modes'.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

;; Custom vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d1b47fb8a148660c356bad0bcbc48da7bb1919118b05a7048a303729bfb6f389" "654d673e3044874632462652b1c636331788423e7bd66f783741aa5730ca6d53" "99c0a559a6c04db25aa055073c8390a0387db15c9684c486abc7ab33d23865d8" "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db" "2c613514f52fb56d34d00cc074fe6b5f4769b4b7f0cc12d22787808addcef12c" default))
 '(package-selected-packages
   '(treemacs-conf treemacs-magit treemacs-icons-dired treemacs dired-sidebar latex-preview-pane ligature org-preview-html zig-mode web-mode vterm typescript-mode smooth-scroll slime rust-mode rainbow-delimiters racket-mode python-mode projectile page-break-lines ob-swiftui nix-mode magit lsp-haskell js2-mode haskell-mode go-mode fzf flycheck-swift elcord doom-modeline dashboard company atom-one-dark-theme all-the-icons use-package ayu-theme))
 '(warning-suppress-types '((lsp-mode) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:background "#242936" :family "Go")))))
(put 'upcase-region 'disabled nil)
