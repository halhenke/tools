(provide 'unix_setup)

;; Menlo font not available on linux
(set-frame-font "DejaVu Serif-10" nil t)

;----------------------------------------------------------------------
;; Frames 
;----------------------------------------------------------------------
;; Switching Forward & Backward between frames with Command-{ & Command-}
(global-set-key (kbd "s-{") (lambda () (interactive) 
			       "Go to previous frame"
			       (interactive)
			       (other-frame -1)))
(global-set-key (kbd "s-}")  (lambda () (interactive) 
			       "Go to next frame"
			       (interactive)
			       (other-frame 1)))
;----------------------------------------------------------------------


;----------------------------------------------------------------------
;; LINUX SPECIFIC BINDINGS
;----------------------------------------------------------------------
;; I cant believe I somehow forgot this stuff apparently 
;; or it hasnt been defined yet in this old version of my .init file
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-f") 'isearch-forward)
(global-set-key (kbd "s-g") 'isearch-repeat)
;; (global-set-key (kbd "s-o") 'execute-extended-command)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-k") 'kill-buffer)
(global-set-key (kbd "s-n") 'make-frame-command)
(global-set-key (kbd "s-d") 'dired)
(global-set-key (kbd "s-u") 'revert-buffer)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
;----------------------------------------------------------------------
