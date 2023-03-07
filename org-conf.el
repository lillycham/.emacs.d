;; Org mode configuration
(use-package org
  :ensure t
  :defer t
  :init
  (use-package org-variable-pitch
    :ensure t)
  (use-package org-bullets
    :ensure t
    :defer t)

  (use-package org-roam
    :ensure t
    :defer t)
  :config
  (setq org-agenda-files '("~/org"))
  ;; Automatic switching to variable pitch mode in org buffers
  :hook ((org-mode . org-variable-pitch-minor-mode)
         (org-agenda-mode . org-variable-pitch-minor-mode)))

(defun my/org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

(defun argi ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))

;; Custom agenda view
(setq org-agenda-custom-commands
      '(("d" "Daily agenda and all TODOs"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "" ((org-agenda-ndays 1)))
          (alltodo ""
                   ((org-agenda-skip-function
		     '(or (my/org-skip-subtree-if-habit)
                          (my/org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))
                    (org-agenda-overriding-header "ALL normal priority tasks:")))))))

(add-to-list
 'org-agenda-custom-commands
 '("u" "Undated tasks" alltodo ""
   ((org-agenda-todo-ignore-with-date t))))

(provide 'org-conf)
;; org-conf.el ends here

