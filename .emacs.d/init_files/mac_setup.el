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
