;;; init.el -*- lexical-binding: t -*-

;; All packages come from Nix (config/editors/epkgs.nix in nixfiles),
;; so package.el never installs anything itself.
(setq package-archives nil)

;; Initialise use-package
(eval-when-compile
  (require 'use-package))

;; Keep Custom's writes out of this file.
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

(setq warning-suppress-types '((lsp-mode) (comp)))

;; Format buffers on save
(use-package apheleia
  :config
  (apheleia-global-mode 1))

(use-package projectile
  :config
  (projectile-mode 1))

(use-package magit
  :defer t)

(use-package org-preview-html
  :defer t)

(use-package page-break-lines
  :config
  (global-page-break-lines-mode 1))

(use-package which-key
  :config
  (which-key-mode 1))

(load (locate-user-emacs-file "theming"))

;; (load (locate-user-emacs-file "keys-meow"))

(load (locate-user-emacs-file "treemacs-conf"))

;; Import language servers, support
(load (locate-user-emacs-file "languages"))

;; Import org config
(load (locate-user-emacs-file "org-conf"))

;; disable tilde file stuff
(setq backup-directory-alist `(("." . "~/.emacs.bak")))

;; Enable fzf fuzzy finder
(use-package fzf
  :defer t
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
  :custom
  ;; Enable auto completion
  (corfu-auto t)

  ;; Enable Corfu globally.
  :init
  (global-corfu-mode))

(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  (setq tab-always-indent 'complete))

(put 'upcase-region 'disabled nil)
