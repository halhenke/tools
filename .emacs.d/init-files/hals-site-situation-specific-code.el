;; ============================================================
;; Mostly functions that might only be useful in a particular environment
;; - more specific than just an OS thing
 ;; - and not cool enough for hals-cool-stuff ;-)
;; ============================================================

(provide 'hals-site-situation-specific-code)

;; Following is of course only useful in a very specific place 
;; OK THIS IS CRAP
;; WHAT IS SHOULD DO - create a new emacs in a subshell/fork and get it to run
;;   (progn
;;     (ido-ubiquitous-mode 1)
;;     (setq current-prefix-arg 3)
;;     (call-interactively 'magit-status)
;;     (my magit-mode))
;; and it should do that AFTER i set magit-repo-dirs
(defun bridge-magit-init ()
  "Upon initialization should create a new frame iin the appropriate directory and setup magit"
  (interactive)
  (progn
    (make-frame-command)
    ;; May later want to maximize frame here - prob easiet using the "frame-cmds.el" library
    (cd "~/bridge")
    (magit-status (pwd))
    )
)

;; ----------------------------------------------------------------------
;; Stuff to automatically do before i push to production
 ;; - Probably add as a magit pre-push hook?
;; ----------------------------------------------------------------------
;; ==================================================
;; First - get my changes - git diff?
;; ==================================================

;; ==================================================
;; Ruby Lint over commits/changes
;; ==================================================


;; ==================================================
;; Check for any "console.log"s in javascript - ( just assets or also views, or even controllers?)
;; ==================================================


;; ==================================================
;; Check for any debugger calls or binding.prys
;; ==================================================



;; ----------------------------------------------------------------------
;; Maximize frame size
;; - Yeah this prob is going to be difficult to get working
;; ----------------------------------------------------------------------
;; Relevant Functions for converting between pixels and rows/cols
;; (/ (frame-pixel-height) (frame-char-height))
;; (/ (frame-pixel-width) (frame-char-width))
(defun max-size-frame ()
  "Set frame size"
  (interactive)
  (setq Airbook-screen '((height . 175) (width . 47)))
  (setq JN-screen '((height . 175) (width . 47)))
  (setq JN-screen '((height . 175) (width . 47)))
  (let ((screen)
	(rows)
	(cols)) 
    ;; test against screen pixel width
    (cond (display-pixel-width)
	  ((1440) (setq screen Airbook-screen))
	  ((1920) (setq screen JN-screen)))
    (setq rows (assoc-default 'height screen))
    (setq cols (assoc-default 'width screen))    
    (progn
      (set-frame-position  (selected-frame) 0 0)
      (set-frame-size  (selected-frame) cols rows)
      (set-frame-position  (selected-frame) 0 0)
      )))
;; The after frame creation hook is after-make-frame-functions
(defun my-new-frame ()
  "Make a new frame, select it, maximise it"
  (interactive)
  (make-frame)
  (select-frame-set-input-focus (next-frame))
  (max-size-frame)
  )
(defun smart-size-frame ()
  "Find the max size for a frame from the screen size and maximize the frame. designed to be added as a hook after we make a new frame"
  (interactive)
  (let 
      ((rows 47) (cols 175))
      ;; ((rows (/ (frame-pixel-height) (frame-char-height)))
      ;;  (cols (- (/ (frame-pixel-width) (frame-char-width)) 4)))
    (progn
      (set-frame-position  (selected-frame) 0 0)
      (set-frame-size  (selected-frame) cols rows)
      (set-frame-position  (selected-frame) 0 0)
      ;; (setq vertical-scroll-bars 'right)      
      (print (format "This is %d rows and %d cols\n" rows cols)))
    ))
;; ;; This doesnt work:
;; (let (
;;       (my-height (/ (frame-pixel-height) (frame-char-height)))
;;       (my-width (/ (frame-pixel-width) (frame-char-width))))
;;   (make-frame '((width . my-width) 
;;   	       (height . my-height)
;;   	       (name . "crazy-frame"))
;; 	      ))
;; This works:
;; (make-frame '((width . 23) 
;; 	      (height . 10)
;; 	      (name . "crazy-frame"))
;; 	    )
;; ----------------------------------------------------------------------

