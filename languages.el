(use-package vterm
  :defer t
  :ensure t
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
  :ensure t
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

;; Lisp language support
(use-package lisp
  :defer t
  :hook (after-save . check-parens))

(define-key emacs-lisp-mode-map (kbd "C-c C-l") 'eval-buffer)

(electric-pair-mode 1)
(setq-default electric-pair-pairs
              '((?\" . ?\")
                (?\{ . ?\})))

(use-package web-mode
  :defer t
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :custom ((web-mode-markup-indent-offset 2)
           (web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))))

(use-package flycheck
  :ensure t
  :defer t)

(use-package flycheck-swift
  :ensure t
  :defer t)

(use-package go-mode
  :ensure t
  :defer t)

(use-package js2-mode
  :ensure t
  :defer t)

(use-package nix-mode
  :ensure t
  :defer t)

(use-package ob-swiftui
  :ensure t
  :defer t)

(use-package fsharp-mode
  :ensure t
  :defer t)

(use-package csharp-mode
  :ensure t
  :defer t)

(use-package auctex
  :ensure t
  :defer t)

(use-package latex-preview-pane
  :ensure t
  :defer t)

;; (use-package llvm-mode
;;   :ensure t
;;   :defer t)

(use-package python-mode
  :ensure t
  :defer t)

;; (use-package rust-mode
;;   :ensure t
;;   :defer t)

(use-package slime
  :ensure t
  :defer t)

(use-package swift-mode
  :ensure t
  :config
  (setq swift-mode:repl-executable "xcrun swift repl")
  :defer t)

(use-package typescript-mode
  :ensure t
  :defer t)

(use-package web-mode
  :ensure t
  :defer t)

(use-package zig-mode
  :ensure t
  :defer t)

(use-package rustic
  :defer
  :ensure
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
  :ensure t
  :config
  (use-package lsp-treemacs
    :ensure t
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
  :ensure t
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable t))

;; Haskell & Haskell LSP
(use-package haskell-mode
  :ensure t
  :config
  (setq lsp-haskell-server-path
        "~/.ghcup/bin/haskell-language-server-9.2.4~1.8.0.0"))

(use-package lsp-haskell
  :ensure t)

;; Enable agda mode
(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

(defun lilly/literate-agda-mode ()
  "If the buffer is literate agda, use a variable width font."
  (setf (alist-get 'background agda2-highlight-faces) 'variable-pitch)\
  ())

(add-hook 'agda2-mode-hook 'lilly/literate-agda-mode)

(add-to-list 'auto-mode-alist
             '("\\.l?agda\\.(md|tex|rst)?\\'" . agda2-mode))

(provide 'languages)
;; languages.el ends here
