(provide 'mac_setup)

;; Menlo font not available on linux
(set-frame-font "Menlo-16" nil t)

;----------------------------------------------------------------------
;; Frames 
;----------------------------------------------------------------------
;; Switching Forward & Backward between frames with Command-{ & Command-}
(global-set-key (kbd "s-{") 'ns-prev-frame)
(global-set-key (kbd "s-}") 'ns-next-frame)
;----------------------------------------------------------------------
;----------------------------------------------------------------------
; Open/Find File/Directory rebindings
;----------------------------------------------------------------------
;; Use  OS X version for <Command-Shift-o>
(global-set-key (kbd "s-O") 'ns-open-file-using-panel)
;----------------------------------------------------------------------


;; Different search forward command on OS X/Linux
(global-set-key (kbd "s-g") 'isearch-repeat-forward)
(global-set-key (kbd "s-d") 'dired) ; Fuck the default binding to isearch-repeat-backward


;----------------------------------------------------------------------
;; Windows
;----------------------------------------------------------------------
;; Bluetooth Keyboard
;; Changing window size - on Mac, with Bluetooth Keyboard 
;; keys are actually <Function-Command-Arrow>
(global-set-key (kbd "<s-home>") 'shrink-window-horizontally)
(global-set-key (kbd "<s-end>") 'enlarge-window-horizontally)
(global-set-key (kbd "<s-next>") 'shrink-window)
(global-set-key (kbd "<s-prior>") 'enlarge-window)
;; Unset keys i didnt like
;; (global-unset-key (kbd "<s-home>"))
;; (global-unset-key (kbd "<s-end>"))
;; (global-unset-key (kbd "<s-next>"))
;; (global-unset-key (kbd "<s-prior>"))
;----------------------------------------------------------------------



;----------------------------------------------------------------------
;; Wrapping Search - This seemed to break stuff on linux
;----------------------------------------------------------------------
;; Enable interactive search to wrap by default
(defadvice isearch-repeat (after isearch-no-fail activate)
  "isearch-repeat (<Command-g>) will automatically wrap"
  ;; If we found a match then do nothing
  (unless isearch-success
    ;; Otherwise disable this advice - ad-activate call is also necessary
    (ad-disable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)
    ;; OK - if isearch-forward returns succesfully then we call isearch-repeat with "forward" arg
    (isearch-repeat (if isearch-forward 'forward))
    ;; Re-enable this advice - ad-activate call is also necessary
    (ad-enable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)))
;; My attempt to do the same for isearch-forward - not ready yet
(defadvice isearch-forward (after isearch-forward-no-fail activate)
  "isearch-forward (<Command-f>) will automatically wrap"
  ;; If we found a match then do nothing
  (unless isearch-success
    ;; Otherwise disable this advice - ad-activate call is also necessary
    (ad-disable-advice 'isearch-forward 'after 'isearch-forward-no-fail)
    (ad-activate 'isearch-forward)
    (isearch-repeat (if isearch-forward 'forward))
    ;; Re-enable this advice - ad-activate call is also necessary
    (ad-enable-advice 'isearch-forward 'after 'isearch-forward-no-fail)
    (ad-activate 'isearch-forward)))
