;; Set theme
(load-theme 'acme t)
(set-foreground-color "#000000")
(set-face-attribute 'default nil :font "Liga SFMono Nerd Font-14" )
(set-face-attribute 'variable-pitch nil :font "Lucida Grande-14" )

;; enable 80 col ruler
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; enable line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Disable tool bar
(tool-bar-mode -1)

;; use bar cursor
(setq-default cursor-type 'bar)

;; Set the title bar to black
(defun set-selected-frame-dark (&rest _)
  (call-process-shell-command "xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT \"dark\" -id \"$(xdotool getactivewindow)\""))

;; Make titlebar dark on linux gtk
(when (eq system-type 'gnu/linux)
  (add-hook 'after-make-frame-functions #'set-selected-frame-dark))

;; transparent titlebar
(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . light))
  (setq ns-use-proxy-icon  nil)
  (setq frame-title-format nil))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package ligature
;;  :load-path "https://github.com/mickeynp/ligature.el"
  :ensure t
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  (ligature-set-ligatures 't '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package all-the-icons
  :ensure t
  :defer t)

;; Enable dashboard
(use-package dashboard
  :ensure t
  :config
  ;; Set title and banner
  (setq dashboard-banner-logo-title "λ emacs")
  (setq dashboard-startup-banner 'logo)
  
  ;; Enable init info
  (setq dashboard-set-init-info t)

  ;; Custom footer
  (setq dashboard-footer-messages '("have a nice day!"))
  (setq dashboard-footer-icon
        (all-the-icons-octicon "heart"
                               :height 1.1
                               :v-adjust -0.05
                               :face 'font-lock-keyword-face))

  ;; Control what shows in dashboard
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 5)))
  ;; Center content
  (setq dashboard-center-content t)

  ;; Use dashboard as initial buffer.
  (setq initial-buffer-choice
        (lambda () (get-buffer-create "*dashboard*"))))

(dashboard-setup-startup-hook)

;; Line numbers config
(setq display-line-numbers-width 4)
(setq display-line-numbers 'relative)

;; Use doom modeline
(use-package doom-modeline
  :ensure t
  :config
  ;; Set height of modeline
  (setq-default doom-modeline-height 30)
  (doom-modeline-mode 1))


(provide 'theming)
