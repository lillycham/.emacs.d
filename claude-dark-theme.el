;;; claude-dark-theme.el -*- lexical-binding: t -*-

(deftheme claude-dark
  "A warm dark theme after Claude's dark mode: charcoal, cream and terracotta.")

(let ((bg        "#262624")   ; main background
      (bg-dark   "#1F1E1D")   ; inactive and sidebar areas
      (bg-alt    "#30302E")   ; current line, tabs
      (border    "#3D3D3A")
      (fg        "#E5E3DA")   ; body text
      (fg-bright "#F5F4EF")
      (muted     "#9C9A92")
      (comment   "#85837B")
      (accent    "#D97757")   ; Claude terracotta
      (accent-dk "#B8593A")
      (region    "#4A3A32")   ; terracotta over charcoal
      (amber     "#E3B26B")
      (sage      "#B3BF8C")
      (dusty     "#8FAAC0")
      (mauve     "#C79DBB")
      (tan       "#D6A77E")
      (cream     "#E8D2AE")
      (red       "#E0685A"))
  (custom-theme-set-faces
   'claude-dark
   `(default ((t (:background ,bg :foreground ,fg :weight normal))))
   `(cursor ((t (:background ,accent))))
   `(fixed-pitch ((t (:extend nil :background ,bg :foreground ,fg))))
   `(variable-pitch ((t (:background ,bg))))
   `(escape-glyph ((t (:foreground ,tan))))
   `(minibuffer-prompt ((t (:foreground ,accent :weight bold))))
   `(highlight ((t (:background ,bg-alt))))
   `(hl-line ((t (:background ,bg-alt))))
   `(region ((t (:background ,region :extend t))))
   `(secondary-selection ((t (:background ,bg-alt))))
   `(shadow ((t (:foreground ,muted))))
   `(trailing-whitespace ((t (:background ,red))))
   `(fringe ((t (:background ,bg))))
   `(vertical-border ((t (:foreground ,border))))
   `(fill-column-indicator ((t (:foreground ,border))))
   `(line-number ((t (:background ,bg :foreground ,comment))))
   `(line-number-current-line ((t (:background ,bg :foreground ,accent :weight bold))))
   `(show-paren-match ((t (:background ,region :foreground ,fg-bright :weight bold))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,fg-bright))))

   ;; Syntax
   `(font-lock-builtin-face ((t (:foreground ,tan))))
   `(font-lock-comment-face ((t (:foreground ,comment :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-constant-face ((t (:foreground ,mauve))))
   `(font-lock-doc-face ((t (:foreground ,sage :slant italic))))
   `(font-lock-function-name-face ((t (:foreground ,amber))))
   `(font-lock-keyword-face ((t (:foreground ,accent :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,accent-dk))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,tan :weight bold))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,tan :weight bold))))
   `(font-lock-string-face ((t (:foreground ,sage))))
   `(font-lock-type-face ((t (:foreground ,dusty :weight bold))))
   `(font-lock-variable-name-face ((t (:foreground ,cream))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))

   ;; Links and buttons
   `(link ((t (:foreground ,accent :underline t))))
   `(link-visited ((t (:foreground ,accent-dk :underline t))))
   `(button ((t (:inherit link))))

   ;; Mode line and header line
   `(mode-line ((t (:background ,bg-dark :foreground ,fg :box (:line-width 1 :color ,border)))))
   `(mode-line-inactive ((t (:background ,bg-dark :foreground ,comment :box (:line-width 1 :color ,bg-dark)))))
   `(mode-line-buffer-id ((t (:foreground ,fg-bright :weight bold))))
   `(mode-line-emphasis ((t (:foreground ,accent :weight bold))))
   `(mode-line-highlight ((t (:inherit highlight))))
   `(header-line ((t (:background ,bg-dark :foreground ,muted :box nil))))
   `(tooltip ((t (:inherit variable-pitch :background ,bg-alt :foreground ,fg))))

   ;; Search
   `(isearch ((t (:background ,accent :foreground ,bg-dark :weight bold))))
   `(isearch-fail ((t (:foreground ,red))))
   `(lazy-highlight ((t (:background ,region :foreground ,fg-bright))))
   `(match ((t (:background ,region :foreground ,amber))))
   `(next-error ((t (:inherit region))))
   `(query-replace ((t (:inherit isearch))))

   ;; Rainbow delimiters: warm, then cool, so nesting stays readable
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,accent))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,amber))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,sage))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,dusty))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,mauve))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,tan))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,cream))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,muted))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,red :weight bold))))

   ;; Tab line
   `(tab-line ((t (:height 135 :background ,bg-dark :box nil))))
   `(tab-line-tab ((t (:height 135 :background ,bg-dark :box (:line-width 5 :color ,bg-dark) :weight bold))))
   `(tab-line-tab-current ((t (:inherit mode-line :height 135 :background ,bg :foreground ,fg-bright
                                        :box (:line-width 5 :color ,bg) :weight bold))))
   `(tab-line-tab-inactive ((t (:background ,bg-dark :foreground ,muted :box (:line-width 5 :color ,bg-dark) :weight bold))))
   `(tab-line-tab-inactive-alternate ((t (:background ,bg-dark :box (:line-width 5 :color ,bg-dark)))))
   `(tab-line-highlight ((t (:background ,bg-alt))))
   `(tab-line-tab-special ((t (:italic t))))

   ;; Window dividers
   `(window-divider ((t (:foreground ,border))))
   `(window-divider-first-pixel ((t (:foreground ,bg-dark))))
   `(window-divider-last-pixel ((t (:foreground ,bg-dark))))))

(provide-theme 'claude-dark)
