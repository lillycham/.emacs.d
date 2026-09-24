;;; languages.el -*- lexical-binding: t -*-

(use-package vterm
  :defer t
  :config
  
  ;; Function to run a string in vterm
  (defun vterm-exec (xs)
    "Execute string xs in vterm."
    (interactive "sCommand to run: ")
    (progn (vterm-other-window)
           (vterm-send-string xs)
           (vterm-send-return))))

;; Racket language support
(use-package racket-mode
  :defer t
  :config
  ;; Override racket-racket, so we can run racket files in a vterm
  ;; instead of eshell.
  (defun racket-racket ()
    "Do \"racket <file>\" in a shell buffer."
    (interactive)
    (vterm-exec
     (concat (shell-quote-argument racket-program)
             " "
             (shell-quote-argument (racket--buffer-file-name))))))

;; (use-package racket-xp
;;   :defer t
;;   :ensure t
;;   :hook ((racket-mode . racket-xp-mode)))

;; Check for unbalanced parens when saving elisp
(add-hook 'emacs-lisp-mode-hook
          (lambda () (add-hook 'after-save-hook #'check-parens nil t)))

(define-key emacs-lisp-mode-map (kbd "C-c C-l") 'eval-buffer)

(electric-pair-mode 1)
(setq-default electric-pair-pairs
              '((?\" . ?\")
                (?\{ . ?\})))

(use-package web-mode
  :defer t
  :init (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :custom ((web-mode-markup-indent-offset 2)
           (web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))))

(use-package flycheck
  :defer t)

(use-package flycheck-swift
  :defer t)

(use-package go-mode
  :defer t)

(use-package js2-mode
  :defer t)

(use-package nix-mode
  :defer t)

(use-package ob-swiftui
  :defer t)

(use-package fsharp-mode
  :defer t)

(use-package csharp-mode
  :defer t)

(use-package auctex
  :defer t)

(use-package latex-preview-pane
  :defer t)

;; (use-package llvm-mode
;;   :ensure t
;;   :defer t)

(use-package python-mode
  :defer t)

;; (use-package rust-mode
;;   :ensure t
;;   :defer t)

(use-package slime
  :defer t)

(use-package swift-mode
  :config
  (setq swift-mode:repl-executable "xcrun swift repl")
  :defer t)

(use-package typescript-mode
  :defer t)

(use-package zig-mode
  :defer t)

(use-package rustic
  :defer
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status)))

(use-package lsp-mode
  :config
  (use-package lsp-treemacs
    :defer t)
  (lsp-treemacs-sync-mode 1)

  :custom
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  (lsp-rust-server 'rust-analyzer)
  
  :hook ((haskell-mode          . lsp)
         (literate-haskell-mode . lsp)
         (rust-mode             . lsp)
         (web-mode              . lsp)
         (lsp-mode              . lsp-enable-which-key-integration)
         (nix-mode              . lsp)))

(use-package lsp-ui
  :defer t
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable t))

;; Haskell & Haskell LSP
(use-package haskell-mode
  :defer t)

(use-package lsp-haskell
  :after haskell-mode)

;; Enable agda mode, if agda is installed
(when (executable-find "agda-mode")
  (load-file (let ((coding-system-for-read 'utf-8))
               (shell-command-to-string "agda-mode locate"))))

(defun lilly/literate-agda-mode ()
  "If the buffer is literate agda, use a variable width font."
  (setf (alist-get 'background agda2-highlight-faces) 'variable-pitch))

(add-hook 'agda2-mode-hook 'lilly/literate-agda-mode)

(add-to-list 'auto-mode-alist
             '("\\.l?agda\\.(md|tex|rst)?\\'" . agda2-mode))

(provide 'languages)
;; languages.el ends here
