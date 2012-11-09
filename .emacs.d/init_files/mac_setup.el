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
