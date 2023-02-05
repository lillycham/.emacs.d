;; Function to run a string in vterm
(defun vterm-exec (xs)
  "Execute string xs in vterm."
  (interactive "sCommand to run: ")
  (progn (vterm-other-window)
         (vterm-send-string xs)
         (vterm-send-return)))

;; Override racket-racket, so we can run racket files in a vterm
;; instead of eshell.
(defun racket-racket ()
  "Do \"racket <file>\" in a shell buffer."
  (interactive)
  (vterm-exec
   (concat (shell-quote-argument racket-program)
           " "
           (shell-quote-argument (racket--buffer-file-name)))))

;; Racket language support
(use-package racket-mode
  :defer t)

(use-package racket-xp
  :defer t
  :hook ((racket-mode . racket-xp-mode)))

(use-package web-mode
  :defer t
  :init (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :custom ((web-mode-markup-indent-offset 2)
           (web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))))

(use-package lsp
  :defer t
  :config
  (lsp-treemacs-sync-mode 1)
  :hook ((haskell-mode          . lsp)
         (literate-haskell-mode . lsp)
         (rust-mode             . lsp)
         (web-mode              . lsp)
         (lsp-mode              . lsp-enable-which-key-integration)
         (nix-mode              . lsp)))

;; Haskell & Haskell LSP
(use-package haskell-mode
  :config
  (setq lsp-haskell-server-path
        "~/.ghcup/bin/haskell-language-server-9.2.4~1.8.0.0"))

(use-package lsp-haskell)

;; Enable agda mode
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                (shell-command-to-string "agda-mode locate")))

(provide 'languages)
;; languages.el ends here
