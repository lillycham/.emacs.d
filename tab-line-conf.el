;; Tab bar config
(defun my/tab-line-tab-name-buffer (buffer &optional _buffers)
  (format " %s  " (buffer-name buffer)))

(global-tab-line-mode 1)
(setq-default tab-line-new-button-show nil)
(setq-default tab-line-close-button-show nil)
(setq-default tab-line-new-tab-choice "*dashboard*")
(setq-default tab-width 20)
(setq-default tab-line-separator "")
(setq-default tab-bar-border nil)
(setq-default tab-line-tab-name-function #'my/tab-line-tab-name-buffer)

(defcustom tab-line-tab-min-width 10
  "Minimum width of a tab in characters."
  :type 'integer
  :group 'tab-line)

(defcustom tab-line-tab-max-width 30
  "Maximum width of a tab in characters."
  :type 'integer
  :group 'tab-line)

(defun aorst/tab-line-name-buffer (buffer &rest _buffers)
  (with-current-buffer buffer
    (let* ((window-width (window-width (get-buffer-window)))
           (close-button-size (if tab-line-close-button-show
                                  (length (substring-no-properties tab-line-close-button))
                                0))
           (tab-amount (length (tab-line-tabs-window-buffers)))
           (window-max-tab-width (/ window-width tab-amount))
           (tab-width (- (cond ((>= window-max-tab-width tab-line-tab-max-width)
                                tab-line-tab-max-width)
                               ((< window-max-tab-width tab-line-tab-min-width)
                                tab-line-tab-min-width)
                               (t window-max-tab-width))
                         close-button-size))
           (buffer-name (string-trim (buffer-name)))
           (name-width (length buffer-name)))
      (if (>= name-width (- tab-width 3))
          (concat  " " (truncate-string-to-width buffer-name (- tab-width 3)) "… ")
        (let* ((padding (make-string (/ (- tab-width name-width) 2) ?\s))
               (buffer-name (concat padding buffer-name))
       (name-width (length buffer-name)))
          (concat buffer-name (make-string (- tab-width name-width) ?\s)))))))

(add-hook 'window-configuration-change-hook
          #'(lambda ()
              (dolist (window (window-list))
                (set-window-parameter window 'tab-line-cache nil))))

(defun tab-line-close-tab (&optional e)
  "Close the selected tab.
If the tab is presented in another window, close the tab by using the `bury-buffer` function.
If the tab is unique to all existing windows, kill the buffer with the `kill-buffer` function.
Lastly, if no tabs are left in the window, it is deleted with the `delete-window` function."
  (interactive "e")
  (let* ((posnp (event-start e))
         (window (posn-window posnp))
         (buffer (get-pos-property 1 'tab (car (posn-string posnp)))))
    (with-selected-window window
      (let ((tab-list (tab-line-tabs-window-buffers))
            (buffer-list (flatten-list
                          (seq-reduce (lambda (list window)
                                        (select-window window t)
                                        (cons (tab-line-tabs-window-buffers) list))
                                      (window-list) nil))))
        (select-window window)
        (if (> (seq-count (lambda (b) (eq b buffer)) buffer-list) 1)
            (progn
              (if (eq buffer (current-buffer))
                  (bury-buffer)
                (set-window-prev-buffers window (assq-delete-all buffer (window-prev-buffers)))
                (set-window-next-buffers window (delq buffer (window-next-buffers))))
              (unless (cdr tab-list)
                (ignore-errors (delete-window window))))
          (and (kill-buffer buffer)
               (unless (cdr tab-list)
                 (ignore-errors (delete-window window)))))))
    (force-mode-line-update)))
(setq tab-line-tab-name-function #'aorst/tab-line-name-buffer)

(provide 'tab-line-conf)
;; tab-line-conf ends here
