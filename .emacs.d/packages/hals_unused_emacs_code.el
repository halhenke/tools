;----------------------------------------------------------------------
;; Setup our init/customization directory
;----------------------------------------------------------------------
;(defvar emacs-directory "~/.emacs.d/") "The directory containing the emacs configuration files."
;; Define the load-path
;(pushnew (expand-file-name emacs-directory) load-path)
;----------------------------------------------------------------------
;; (require 'cl)
;; (case (window-system) 
;;   ('ns "We are on a mac")
;;   ('x "We are in UNIX")
;;   (nil "We are running a terminal?")
;;   (otherwise "Window System/Environment unknown!"))
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Heres what some other guy has to remap Command key to Meta etc - might change these keys later 
; i.e. Caps Lock become Control or something....
;; (setq mac-option-key-is-meta nil)
;; (setq mac-command-key-is-meta t)
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier nil)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;; Javascript useful stuff
;----------------------------------------------------------------------
;; JSFiddle
(defun js-to-fiddle ()
  "Switching the contents of a js script that is set up to run in the browser and log 
error messages to console.log to append error messages to a <div> on the page with the id #messages.
Basically so I can quickly grab the contents of a buffer and chuck it into jsFiddle."
  (interactive)
  ;; (query-replace '"console.log" '"$("\#messages").append"))
  (replace-string '"console.log" '"$("\#messages").append"))
;----------------------------------------------------------------------


;----------------------------------------------------------------------
;; USEFUL FUNCTIONS
;----------------------------------------------------------------------
;; (defun count-words-in-region (&optional begin end)
;;   "count words between BEGIN and END (region); if no region defined, count words in buffer"
;;   (interactive "r")
;;   (let ((b (if mark-active begin (point-min)))
;;       (e (if mark-active end (point-max))))
;;     (message "Word count: %s" (how-many "\\w+" b e))))
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;; RINARI
;----------------------------------------------------------------------     
       ;; Rinari
       ;; (add-to-list 'load-path "~/.emacs.d/elpa/rinari-2.9")
       ;; (add-to-list 'load-path "~/.emacs.d/elpa/inf-ruby-2.2.3")
       ;; (add-to-list 'load-path "~/.emacs.d/elpa/ruby-mode-1.1")
       ;; (add-to-list 'load-path "~/.emacs.d/elpa/ruby-compilation-0.8")
       ;; (add-to-list 'load-path "~/.emacs.d/elpa/jump-2.1")
       ;; (add-to-list 'load-path "~/.emacs.d/elpa/findr-0.7")
       ;; (add-to-list 'load-path "~/.emacs.d/elpa/inflections-1.0")
       ;; (require 'rinari)
;----------------------------------------------------------------------

;; (generate-new-buffer "Mongodb & noSQL - Thoughts")


;----------------------------------------------------------------------
; Setting up SLIME LISP interactive editing
;----------------------------------------------------------------------
;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(setq inferior-lisp-program "/opt/local/bin/clisp") ; your Lisp system
;(add-to-list 'load-path "~/.emacs.d/slime/") ; your SLIME directory
;; (setq inferior-lisp-program "/usr/homebrew/bin/sbcl") ; your Lisp system
;; (add-to-list 'load-path "/Users/Hal/Code/Packages/slime") ; your SLIME directory
;; (require 'slime)
;; (slime-setup)
;----------------------------------------------------------------------



;----------------------------------------------------------------------
;; Mouse Scrolling Stuff From Web - scroll one line at a time (less "jumpy" than defaults)
;----------------------------------------------------------------------
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control.nil)))) ;; one line at a time - not sure what shift does
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; Evaluate Current Values of These Variables
;; scroll-step
;; mouse-wheel-scroll-amount
;; ;; (5 ((shift) . 1) ((control))) ;Old value
;; mouse-wheel-progressive-speed
;; mouse-wheel-follow-mouset
;; scroll-conservatively

;----------------------------------------------------------------------
;; Stuff related to me trying to debug smooth-scroll
;----------------------------------------------------------------------
;; (read-event)
;; (wheel-up (#<window 11 on .emacs> 2501 (874 . 477) 683593592 nil 2501 (87 . 25) nil (874 . 2) (10 . 19)))
;; (wheel-down (#<window 11 on .emacs> 2371 (472 . 519) 683337656 nil 2371 (47 . 27) nil (472 . 6) (10 . 19)))
;; mouse-wheel-mode
;; smooth-scroll-mode

;; (fboundp 'smooth-scroll/orig-scroll-down)
;; t
;; (fboundp 'smooth-scroll/scroll-down)
;; t
;; (fboundp 'scroll-down)
;; t
;; (fboundp 'smooth-scroll/boks_snot)
;; nil
;; (symbol-function 'scroll-down)
;; #[(&optional arg) "\301\302\"\207" [arg smooth-scroll/\.vscroll-aux nil] 3 ("/Users/Noches/.emacs.d/elpa/smooth-scroll-1.1/smooth-scroll.elc" . 5262) "P"]

;; #[(&optional arg) "\301\302\"\207" [arg smooth-scroll/\.vscroll-aux nil] 3 ("/Users/Noches/.emacs.d/elpa/smooth-scroll-1.1/smooth-scroll.elc" . 5262) "P"]
;; #[(&rest args) "\300\207" [nil] 1]
;; (symbol-function 'smooth-scroll/orig-scroll-down)
;; #[(&rest args) "\300\207" [nil] 1]
;; (symbol-function 'smooth-scroll/scroll-down)
;; #[(&optional arg) "\301\302\"\207" [arg smooth-scroll/\.vscroll-aux nil] 3 ("/Users/Noches/.emacs.d/elpa/smooth-scroll-1.1/smooth-scroll.elc" . 5262) "P"]

;; (require 'smooth-scroll)
;; (smooth-scroll-mode)
;----------------------------------------------------------------------


;----------------------------------------------------------------------
;; Trying to write a function to go from a vert-split window to a horizontal-split window and vice versa

;; 		(lambda () (interactive)
;; 		  "If we are in a frame with two windows that is split vertically then 'rotate' frame so that the split is horizontal.
;; If, on the other hand we are in a frame with two windows that is split horizontally then 'rotate' frame so that the split is vertical."
;; 		  ;; check we have two windows in current frame - if not, error message
;; 		  ;; get buffer names		  
;; 		  (let (b1 )(b2)
;; 		       ()
;; 		       )
;; 		  )
;----------------------------------------------------------------------
