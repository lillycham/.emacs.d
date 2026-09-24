;; Add MELPA package repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Initialise use-package
(eval-when-compile
  (require 'use-package))

(use-package apheleia
  :ensure t
  :defer t)

(use-package projectile
  :ensure t
  :defer t)

(use-package corfu
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t)

(use-package company-flx
  :ensure t
  :defer t)

(use-package company-ipa
  :ensure t
  :defer t)

(use-package org-preview-html
  :ensure t
  :defer t)

(use-package page-break-lines
  :ensure t
  :defer t)

(use-package which-key
  :ensure t
  :defer t)

(load-file "~/.emacs.d/theming.el")

;; (load-file "~/.emacs.d/keys-meow.el")

(load-file "~/.emacs.d/treemacs-conf.el")

;; Import language servers, support
(load-file "~/.emacs.d/languages.el")

;; Import org config
(load-file "~/.emacs.d/org-conf.el")

;; Buffer names are already in the modeline
;; (load-file "~/.emacs.d/tab-line-conf.el")

;; enable discord rpc
(use-package elcord
  :ensure t
  :config (elcord-mode 1))

(use-package smudge
  :ensure t
  :config
  (setq smudge-oauth2-client-id "7ff47910ba82426e9bc717ff27fe847b"
        smudge-transport 'connect)
  ;; The secret is kept out of the repo, so it may be missing
  (when (file-exists-p "~/.emacs.d/smudge.json")
    (setq smudge-oauth2-client-secret (json-read-file "~/.emacs.d/smudge.json"))))

(define-key smudge-mode-map (kbd "C-c .") 'smudge-command-map)

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
  :ensure t
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

;; Custom vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d1b47fb8a148660c356bad0bcbc48da7bb1919118b05a7048a303729bfb6f389"
     "654d673e3044874632462652b1c636331788423e7bd66f783741aa5730ca6d53"
     "99c0a559a6c04db25aa055073c8390a0387db15c9684c486abc7ab33d23865d8"
     "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db"
     "2c613514f52fb56d34d00cc074fe6b5f4769b4b7f0cc12d22787808addcef12c"
     default))
 '(package-selected-packages nil)
 '(warning-suppress-types '((lsp-mode) (comp))))
