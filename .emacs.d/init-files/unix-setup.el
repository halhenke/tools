;=================================================
; UNIX/LINUX SPECIFIC BINDINGS, COMMANDS, AND SETTINGS
;=================================================
(provide 'unix-setup)

;; Menlo font not available on linux
;; (set-default-font "DejaVu Serif-10" nil t) ;; Apparently deprecated
(set-frame-font "DejaVu Sans Mono-10" 'keep-size t)
;; Actually at the moment, after a lot of troubles, i kind of want this as returned by
;; describe-font:
;; ----------------------------------------------------------------------
;; name (opened by): -unknown-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1
;;        full name: DejaVu Sans Mono:pixelsize=13:foundry=unknown:weight=normal:slant=normal:width=normal:spacing=100:scalable=true
;;             size: 13
;;           height: 17
;;  baseline-offset:  0
;; relative-compose:  0
;; ----------------------------------------------------------------------
;; But whats it proper name?


;----------------------------------------------------------------------
;; Frames 
;----------------------------------------------------------------------
;; Switching Forward & Backward between frames with Command-{ & Command-}
;; NOTE - I'm not sure if this is just a UNIX/GNOME thing but it seemed to make more 
;; sense whn I switched the sign of the (other-frame +|- 1) commands
(global-set-key (kbd "s-{") (lambda () (interactive) 
			       "Go to previous frame"
			       (interactive)
			       (other-frame 1)))
(global-set-key (kbd "s-}")  (lambda () (interactive) 
			       "Go to next frame"
			       (interactive)
			       (other-frame -1)))
;; Select frame after loading
(add-hook 'after-make-frame-functions 'select-frame)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;; Windows
;----------------------------------------------------------------------
;; Think of something - using Apple full sized aluminium keyboard
;; Changing window size - keys are actually <Function-Command-Arrow>
;; (global-set-key (kbd "<s-home>") 'shrink-window-horizontally)
;; (global-set-key (kbd "<s-end>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "<s-next>") 'shrink-window)
;; (global-set-key (kbd "<s-prior>") 'enlarge-window)

;; Unset keys i didnt like
;; (global-unset-key (kbd "<s-home>"))
;; (global-unset-key (kbd "<s-end>"))
;; (global-unset-key (kbd "<s-next>"))
;; (global-unset-key (kbd "<s-prior>"))
;----------------------------------------------------------------------
;----------------------------------------------------------------------
;; Navigation Specific
;----------------------------------------------------------------------
;; Apple full sized aluminium keyboard specific
(global-set-key (kbd  "<home>") 'move-beginning-of-line)
(global-set-key (kbd  "<end>") 'move-end-of-line)
;; This will have to be refactored i think 
;;  - already these functions are already defined in main .emacs file 
;; AFTER this file is sourced...
(defun sfp-page-down (&optional arg)
  (interactive "^P")
  (setq this-command 'next-line)
  (next-line
   (- (window-text-height)
      next-screen-context-lines)))
(defun sfp-page-up (&optional arg)
  (interactive "^P")
  (setq this-command 'previous-line)
  (previous-line
   (- (window-text-height)
      next-screen-context-lines)))
; I think this stuff means you can use it in search-scroll mode and in CUA
(put 'sfp-page-down 'isearch-scroll t)
(put 'sfp-page-down 'CUA 'move)
(put 'sfp-page-up 'isearch-scroll t)
(put 'sfp-page-up 'CUA 'move)
; The bindings
(global-set-key (kbd "<prior>") 'sfp-page-up)
(global-set-key (kbd "<next>") 'sfp-page-down)

;----------------------------------------------------------------------

;----------------------------------------------------------------------
;; LINUX SPECIFIC BINDINGS
;----------------------------------------------------------------------
;; I cant believe I somehow forgot this stuff apparently 
;; or it hasnt been defined yet in this old version of my .init file
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-f") 'isearch-forward)
(global-set-key (kbd "s-F") 'search-forward)
;; isearch-repeat DOES NOT SEEM TO EXIST ON LINUX!!!
;; (global-set-key (kbd "s-g") 'isearch-repeat)
;; (global-set-key (kbd "s-o") 'execute-extended-command)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-k") 'kill-buffer)
(global-set-key (kbd "s-n") 'make-frame-command)
(global-set-key (kbd "s-d") 'dired)
(global-set-key (kbd "s-u") 'revert-buffer)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-l") 'goto-line)
;----------------------------------------------------------------------
 

;; Trying to fix search repeat which appears to be broken on linux
(global-set-key (kbd "s-g") 'isearch-repeat-forward)
(global-set-key (kbd "s-G") 'isearch-repeat-backward)


;----------------------------------------------------------------------
;; What follows is a bunch of horrible attempts to figure out what was happening with key bindings
;; in KDE - might be useful one day
;----------------------------------------------------------------------


;; (global-unset-key (kbd "<S-left>"))

;; (setq x-super-keysym 'super)
;; x-meta-keysym
;; x-super-keysym

;; x-keysym-table
;; #s(hash-table size 900 test eql rehash-size 1.5 rehash-threshold 0.8 data (160 160 161 161 162 162 163 163 164 164 165 165 166 166 167 167 168 168 169 169 170 170 171 171 ...))


;; Do something like:
;; $ xkbcomp $DISPLAY .out
;; to get what xkb is doing
;; or to edit and change:
;; xkbcomp $DISPLAY xkb.dump
;; editor xkb.dump
;; xkbcomp xkb.dump $DISPLAY


;; http://www.emacswiki.org/emacs/MetaKeyProblems#toc6
;; http://www.emacswiki.org/emacs/SettingMetaWithXKB
;; OK so I can use xmodmap to change Command key to a different Keysym
;; keycode 133 = F13
;; and then emacs will see that when its pressed.
;; Alternatively I can bind Super_L to control and the Command key will function as a Control key
;; mod3 and mod4 seem not to work however




;; Trying to fix Super key commands which appears to be broken on KDE
;; (global-set-key (kbd  "S-<left>") 'move-beginning-of-line)
;; move-beginning-of-line
;; (global-set-key (kbd  "<s-right>") 'move-end-of-line)

;; (define-key input-decode-map "F13" [(s)])
;; (define-key key-translation-map  (kbd "<f13>") (kbd "<s>"))
;; (define-key function-key-map (kbd "<f13>") 'event-apply-super-modifier)

;; (define-key input-decode-map  (kbd "<f13>") (kbd "<s>"))
;; (define-key input-decode-map  (kbd "<f13>") [(Control)])


;; ;;; Print out chars typed - useful for finding out what sequences are 
;; ;;; generated by mouse, or fn keys in emacs.
;; ;;; Randal L. Schwartz <merlyn@intelob.intel.com>
;; (defun show-chars ()
;;   "Displays characters typed, terminated by a 3-second timeout."
;;   (interactive)
;;   (let ((chars "")
;; 	(inhibit-quit t))
;;     (message "Enter characters, terminated by 3-second timeout.")
;;     (while (not (sit-for 3))
;;       (setq chars (concat chars (list (read-char)))
;; 	    quit-flag nil))             ; quit-flag maybe set by C-g
;;     (message "Characters entered: %s" (key-description chars))))




;; (kbd <f13>)
;; (kbd "<C-f1>")
;; [C-f1]
;; (kbd "s-o")
;; (key-description [8388719])
;; "s-o"
;; (kbd "s-c")
;; [8388707]
;; (key-description [8388707])
;; "s-c"
;;  (kbd "<f13>")
;; [f13]
;; (key-description [26])

;; (defun event-apply-super-modifier (_ignore-prompt)
;;   "\\<function-key-map>Add the Super modifier to the following event.
;; For example, type \\[event-apply-super-modifier] & to enter Super-&."
;;   (vector (event-apply-modifier (read-event) 'super 23 "s-")))


;; event-apply-modifier is a compiled Lisp function in `simple.el'.

;; (event-apply-modifier EVENT SYMBOL LSHIFTBY PREFIX)

;; Apply a modifier flag to event EVENT.
;; SYMBOL is the name of this modifier, as a symbol.
;; LSHIFTBY is the numeric value of this modifier, in keyboard events.
;; PREFIX is the string that represents this modifier in an event type symbol.



;; (define-key key-translation-map  (kbd "<F13>") 'nil)


;;  (kbd "<s-right>")
;; [s-right]
;; (kbd "<s>")
;; [s]
;; (kbd "s")
;; "s"
;; (kbd "s")




;; Original values...
;; key-translation-map
;; (keymap (S-dead-tilde keymap (32 . "~") (126 . [172]) (116 . [254]) (111 . [245]) (110 . [241]) (100 . [240]) (97 . [227]) (84 . [222]) (79 . [213]) (78 . [209]) ...) (S-dead-asciitilde keymap (32 . "~") (126 . [172]) (116 . [254]) (111 . [245]) (110 . [241]) (100 . [240]) (97 . [227]) (84 . [222]) (79 . [213]) (78 . [209]) ...) (dead-tilde keymap (32 . "~") (126 . [172]) (116 . [254]) (111 . [245]) (110 . [241]) (100 . [240]) (97 . [227]) (84 . [222]) (79 . [213]) (78 . [209]) ...) (dead-asciitilde keymap (32 . "~") (126 . [172]) (116 . [254]) (111 . [245]) (110 . [241]) (100 . [240]) (97 . [227]) (84 . [222]) (79 . [213]) (78 . [209]) ...) (mute-asciitilde keymap (32 . "~") (126 . [172]) (116 . [254]) (111 . [245]) (110 . [241]) (100 . [240]) (97 . [227]) (84 . [222]) (79 . [213]) (78 . [209]) ...) (4194430 keymap (32 . "~") (126 . [172]) (116 . [254]) (111 . [245]) (110 . [241]) (100 . [240]) (97 . [227]) (84 . [222]) (79 . [213]) (78 . [209]) ...) (4194428 . [166]) (4194424 . [215]) (4194413 . [181]) (4194421 . [181]) (4194415 . [176]) ...)

;; local-function-key-map
;; (keymap (backspace . [127]) (kp-delete . [4]) (delete . [deletechar]) keymap (S-iso-lefttab . [backtab]) (iso-lefttab . [backtab]) (M-escape . [134217755]) (M-return . [134217741]) (M-clear . [134217740]) (M-linefeed . [134217738]) (M-tab . [134217737]) ...)

;; input-decode-map
;; (keymap (27 keymap (C-backspace) (C-delete)) (C-M-backspace) (C-M-delete) (M-backspace) (M-delete))




