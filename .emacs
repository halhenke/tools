;(defvar emacs-directory "~/.emacs.d/") "The directory containing the emacs configuration files."
;; Define the load-path
;(pushnew (expand-file-name emacs-directory) load-path)

;----------------------------------------------------------------------
; Customise for different environments
;----------------------------------------------------------------------
;; (require 'cl)
;; (case (window-system) 
;;   ('ns "We are on a mac")
;;   ('x "We are in UNIX")
;;   (nil "We are running a terminal?")
;;   (otherwise "Window System/Environment unknown!"))




;----------------------------------------------------------------------
; Some nice global emacs settings
;----------------------------------------------------------------------
;; Persisting command history and other things between emacs sessions
(savehist-mode 1)
(setq history-length 1000)
; Save entire emacs session - can be done manually to load/save different setups to/from different locations
(if window-system
    (desktop-save-mode 1))
;; Enables a mode where when a region is highlighted/active and text is entered that region is deleted/killed rather than deselected
;; see also pc-selection-model
(delete-selection-mode 1)
;; ;; If this is true then we will never have to type out full "yes" or "no" to confirm changes
(defalias 'yes-or-no-p 'y-or-n-p)
;; OR
;; (fset 'yes-or-no-p 'y-or-n-p)
;; Will setting this 't' or 'f' this help me with scrolling to the top and bottom of files?
;; (set 'scroll-preserve-screen-position t)
;; (set 'scroll-preserve-screen-position nil)
;; Enable Line numbers in margins of all buffers
(global-linum-mode 1)
;; Show column number in minibuffer
(column-number-mode 1)
;; Web derived theme stuff.
(set-frame-font "Menlo-16" nil t)
(load-theme 'wheatgrass) 
;; (load-theme 'tango) ;bit hard to read....
;; Should really make this so it only goes on in lisp mode...
(show-paren-mode 1)
(setq show-paren-style 'expression)
(ido-mode t)
;; Enable the use of set upper/lower case commands
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
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
; SELF INSTALLED PACKAGE MANAGEMENT
;----------------------------------------------------------------------
;; Attempting to set up my own official location for 
;; self installed packages and code
;----------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/packages/") 
;; This package provides revbufs command to automatically and safely revert all buffers e.g. after git checkout branch
(require 'revbufs)
;; A major mode for editing javascript Handlebars templates
(require 'handlebars-mode)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Setting up SLIME LISP interactive editing
;----------------------------------------------------------------------
;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(setq inferior-lisp-program "/opt/local/bin/clisp") ; your Lisp system
(add-to-list 'load-path "~/.emacs.d/slime/") ; your SLIME directory
(require 'slime)
(slime-setup)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Setting up nxHTML for mixed mode HTML editing (ruby/rails etc)
;----------------------------------------------------------------------
(load "~/.emacs.d/nxhtml/autostart.el")
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Adding stuff to the list of where we can install packages from
;----------------------------------------------------------------------
;; Add the original Emacs Lisp Package Archive
(require 'package)
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;----------------------------------------------------------------------
;; Wrapping Search
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
;----------------------------------------------------------------------
; Hals Custom Key Bindings
; 
;; A quick note about binding formats to use: 
;; WARNING - when doing keybindings either do (kbd "s-r") or <s-r> but DONT do "<s-r>" - this ended up binding <, <s, <s- and <s-r to prefix commands in my keymap! 
; Also dont do (kbd "<s-[>") unless you have to put <> round thee sequence - it will bind something that wont be triggered when you press 
; Command-[
; This might make it clearer - here is the output of kbd for a couple of different formats:
;; (kbd "<s-TAB>")
;; [s-TAB]
;; (kbd "s-<TAB>")
;; [s-TAB]
;; (kbd "s-TAB")
;; [8388617]
;; (kbd "<s>-TAB")
;; [s 45 84 65 66]

;----------------------------------------------------------------------
;; MAC OSX SPECIFIC BINDINGS
;----------------------------------------------------------------------
; Comment Bindings
;----------------------------------------------------------------------
; (global-set-key (kbd "s-C") 'comment-or-uncomment-region)       ; This is prob best - overrides show-colour-panel or something
; From Stack Overflow - changes comment-region to comment from the beginning and to end of lines that are selected
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))
(global-set-key (kbd "s-C") 'comment-or-uncomment-region-or-line)       ; SWEET!!! 
(defun comment-or-uncomment-lines ()
  "Comments or uncomments whichever line the point is on or all lines that 
are 'touched' by a particular region."
  (interactive)
  (let (beg end ;beg_line end_line
	    (origin (point)))
    (if (region-active-p)
	(progn
	  (setq beg (region-beginning) end (region-end))
	  ;; (set beg_line (line-number-at-pos beg))
	  ;; (move-to-window-line)
	  (set-window-point (selected-window) beg)
	  (setq beg (line-beginning-position))
	  (set-window-point (selected-window) end)
	  (setq end (line-end-position)))
      ;; (setq beg (line-beginning-position (region-beginning)) end (line-end-position (region-end)))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))
(global-set-key (kbd "s-C") 'comment-or-uncomment-lines) 
;----------------------------------------------------------------------
; Keyboard Macro Bindings
;----------------------------------------------------------------------
(global-set-key (kbd "s-(") 'kmacro-start-macro)
(global-set-key (kbd "s-)") 'kmacro-end-macro)
(global-set-key (kbd "s-=") 'kmacro-end-or-call-macro)
;----------------------------------------------------------------------
; Indentation Bindings
;----------------------------------------------------------------------
(global-set-key (kbd "s-\\") 'indent-region)
;----------------------------------------------------------------------
; General Rebindings for Often Used Commands...
;----------------------------------------------------------------------
;; Rebind Ctrl SPC to set mark
;; (global-set-key (kbd "<s-SPC>") 'set-mark-command)
;; rebind Meta x
(global-set-key (kbd "<s-SPC>") 'execute-extended-command)
;; Rebind Meta Tab
(global-set-key (kbd "<s-return>") 'completion-at-point)
;; Rebind Ctrl g
;; (global-set-key (kbd "<s-backspace>") 'keyboard-quit)  ; This doesnt work properly
(global-set-key (kbd "<s-backspace>") 'keyboard-escape-quit)
;; Rebind M
;; (global-set-key (kbd "<s-return>") 'completion-at-point)
;----------------------------------------------------------------------
; Open/Find File/Directory rebindings
;----------------------------------------------------------------------
;; Use default emacs function for <Command-o> and OS X version for <Command-Shift-o>
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-O") 'ns-open-file-using-panel)


;; (generate-new-buffer "Mongodb & noSQL - Thoughts")



;----------------------------------------------------------------------
; Buffer/Frame/Window Switching
;----------------------------------------------------------------------
; I basically seem to have the following unbound keys to play around with and rebind for changing windows:
;; "s-(" & "s-)" or without shift key "s-9" & "s-0" 
;; "s-{" & "s-}" or without shift key "s-[" & "s-]"
;----------------------------------------------------------------------
;; Frames
;; "s-<" & "s->" -- "s-," is bound to 'customize while "s-." is unbound
;; These give errors - wrong args - not to be used interactively?
;; (global-set-key (kbd "s-[") 'previous-window)
;; (global-set-key (kbd "s-]") 'next-window)
;; Switching Forward & Backward between frames with Command-{ & Command-}
(global-set-key (kbd "s-{") 'ns-prev-frame)
(global-set-key (kbd "s-}") 'ns-next-frame)
;----------------------------------------------------------------------
;; Windows
;----------------------------------------------------------------------
;; Navigating between windows
;; From the web - cant use Shift-Command - i want that to select text
;; http://stackoverflow.com/questions/91071/emacs-switch-active-window
;; Windows Cycling
(setq windmove-wrap-around t)
(global-set-key (kbd "<prior>") 'windmove-up)
(global-set-key (kbd "<next>") 'windmove-down)
(global-set-key (kbd "<end>") 'windmove-right)
(global-set-key (kbd "<home>") 'windmove-left)
;; (global-unset-key (kbd "<C-s-up>"))
;; (global-unset-key (kbd "<C-s-down>"))
;; (global-unset-key (kbd "<C-s-right>"))
;; (global-unset-key (kbd "<C-s-left>"))
;; Again from the web
(defun win-bck()
  "Step sequentially forwards from one window in current frame to the next."
  (interactive)
  (other-window -1))
(defun win-fwd()
  "Step sequentially backwards from one window in current frame to the next."
  (interactive)
  (other-window 1))
(global-set-key (kbd "s-[") 'win-bck)
(global-set-key (kbd "s-]") 'win-fwd)
;; (global-unset-key (kbd "<s-[>"))
;; (global-unset-key (kbd "<s-]>"))
;----------------------------------------------------------------------
;; Closing Windows - remap "s-w" from delete-frame and map "s-W" to delete-frame
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-frame)
;----------------------------------------------------------------------
;; Opening new windows - for the moment these keybindings will do as easier forms of the defaults but I would like to think of something more intuitive
;; (global-set-key (kbd "s-2") 'split-window-below)
;; (global-set-key (kbd "s-3") 'split-window-right)
;; Slightly better - open window and move to it
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 
		(lambda () (interactive)
		  "Creates a new window below the current one and then moves to the newly created window"
		  (split-window-below)
		  (windmove-down)))
(global-set-key (kbd "s-3") 
		(lambda () (interactive) 
		  "Creates a new window to the right of the current one and then moves to the newly created window"
		  (split-window-right)
		  (windmove-right)))
(global-set-key (kbd "s-4") 
		(lambda () (interactive)
		  "If we are in a frame with one window, splits it into 4 equally sized windows.
Behaviour might be a bit unpreditable in other circumstances but basically 
should turn the current window into 4 new windows."
		  (split-window-right)
		  (split-window-below)
		  (windmove-right)
		  (split-window-below)
		  (windmove-left)))

;----------------------------------------------------------------------
;; Rotating windows - an interactive version from emacswiki
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond
   ((not (> (count-windows) 1))
    (message "You can't rotate a single window!"))
   (t
    (let ((i 1)
          (num-windows (count-windows)))
      (while  (< i num-windows)
        (let* ((w1 (elt (window-list) i))
               (w2 (elt (window-list) (+ (% i num-windows) 1)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)
          (setq i (1+ i))))))))
(global-set-key (kbd "s-5") 'rotate-windows)
;----------------------------------------------------------------------
;; Changing window size - keys are actually <Function-Command-Arrow>
(global-set-key (kbd "<s-home>") 'shrink-window-horizontally)
(global-set-key (kbd "<s-end>") 'enlarge-window-horizontally)
(global-set-key (kbd "<s-next>") 'shrink-window)
(global-set-key (kbd "<s-prior>") 'enlarge-window)
;----------------------------------------------------------------------
;; Ask before closing other windows
;; (defun ask-before-closing-windows ()
;;   "Ask whether or not to close, and then close if y was pressed"
;;   (interactive)
;;   (if (y-or-n-p (format "Are you sure you want to close other windows in this frame? "))
;;       (delete-other-windows))
;;   (message "Canceled exit")))
;; ;; Use the above function when we are in a windows (non-terminal) session of emacs
;; (when window-system
;;   (global-set-key (remap 'delete-other-windows) 'ask-before-closing-windows))
;----------------------------------------------------------------------
;; Buffers
;----------------------------------------------------------------------
(global-set-key (kbd "s-<") 'previous-buffer)
(global-set-key (kbd "s->") 'next-buffer)
;----------------------------------------------------------------------
(global-set-key (kbd "s-b") 'switch-to-buffer)
(global-set-key (kbd "s-B") 'list-buffers)
;----------------------------------------------------------------------
; Navigation Bindings (within buffers)
;----------------------------------------------------------------------
; Bind the Command-left and right keys to beginning and end of line
; - previously they were bound to (ns-prev-frame) and (ns-next-frame) 
; BUT in rebinding it automatically allows Command-` to switch between frames as it would on other Apple apps! :-)
(global-set-key (kbd  "<s-left>") 'move-beginning-of-line)
(global-set-key (kbd  "<s-right>") 'move-end-of-line)
; Restore Default Command Binding
;; (global-set-key (kbd  "<s-left>") 'ns-prev-frame)
;; (global-set-key (kbd  "<s-left>") 'ns-next-frame)
;----------------------------------------------------------------------
; Set Command-Up and Down (previously unset) to scroll up and down a page (approximately)
;----------------------------------------------------------------------
;; ;; (global-set-key (kbd  "<s-up>") 'scroll-down-command)
;; ;; (global-set-key (kbd  "<s-down>") 'scroll-up-command)
;; ;Below is from the web - allows you to scroll to end/beginning of buffer 
;; (global-set-key (kbd  "<s-up>") ;[prior]
;; 		(lambda () (interactive)
;; 		  (condition-case nil (scroll-down)
;; 		    (beginning-of-buffer (goto-char (point-min))))))
;; (global-set-key (kbd  "<s-down>") ;[next]
;; 		(lambda () (interactive)
;; 		  (condition-case nil (scroll-up)
;; 		    (end-of-buffer (goto-char (point-max))))))
;; ;Similarly from the web - Alt-Up/Down scrolls the page a few lines but doesnt move the cursor...
;; (global-set-key (kbd "M-<down>")  
;; 		(lambda () (interactive) (scroll-up   4)))
;; (global-set-key (kbd "M-<up>")  
;; 		(lambda () (interactive) (scroll-down 4)))
;----------------------------------------------------------------------
;Still more from versions the web - This one is heaps better - you can use Shift to grab text as you go now
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
(global-set-key (kbd "s-<down>") 'sfp-page-down)
(global-set-key (kbd "s-<up>") 'sfp-page-up)
;----------------------------------------------------------------------
;And my modifications for the Alt-Up/Down keys
(defun sfp-bit-down (&optional arg)
  (interactive "^P")
  (setq this-command 'next-line)
  (next-line 5))
(defun sfp-bit-up (&optional arg)
  (interactive "^P")
  (setq this-command 'previous-line)
  (previous-line 5))
;Not really sure about this belowstuff yet
(put 'sfp-bit-down 'isearch-scroll t)
(put 'sfp-bit-up 'isearch-scroll t)
;(put 'sfp-bit-down 'CUA 'move)
;(put 'sfp-bit-up 'CUA 'move)
(global-set-key (kbd "M-<down>") 'sfp-bit-down)
(global-set-key (kbd "M-<up>") 'sfp-bit-up)
;----------------------------------------------------------------------


;----------------------------------------------------------------------
;; MODE SPECIFIC BINDINGS
;----------------------------------------------------------------------
;;* ELISP Mode 
;----------------------------------------------------------------------
; we can eval an s-expression with Command-r now (may have to use a mode hook if this gets overwritten...)
(define-key lisp-interaction-mode-map (kbd "s-r") 'eval-print-last-sexp)
;; Select region and it will evaluate s-expressions - 
(define-key lisp-interaction-mode-map (kbd "s-R") 'eval-region)
;; I want to comment with Command-Tab - will override Mac Expose...Oh well
; According to emacs [?\\s-\\t] should be used instead of [s-TAB]/(kbd "<s-TAB>")
;; (define-key lisp-interaction-mode-map "[?\\s-\\t]" 'completion-at-point) 
(define-key lisp-interaction-mode-map (kbd "s-<tab>") 'completion-at-point)
;; (eval-after-load 'lisp-interaction-mode-map
;;                      '(define-key lisp-interaction-mode-map (kbd "s-r") 'eval-print-last-sexp))

; Heres what some other guy has to remap Command key to Meta etc - might change these keys later 
; i.e. Caps Lock become Control or something....
;; (setq mac-option-key-is-meta nil)
;; (setq mac-command-key-is-meta t)
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier nil)

;; From StackOverflow - how to set show-paren-mode to be non-global - only in elsip mode
;; (show-paren-mode)                       ;; activate the needed timer
;; (setq show-paren-mode ())                ;; The timer will do nothing if this is nil

;; (defun show-paren-local-mode ()
;;   (interactive)
;;   (make-local-variable 'show-paren-mode) ;; The value of shom-paren-mode will be local to this buffer.
;;   (setq show-paren-mode t))

;; (add-hook 'emacs-lisp-mode-hook 'show-paren-local-mode)
;----------------------------------------------------------------------
;;* Shell Mode
;----------------------------------------------------------------------
;; Enable Search history stuff
;; (when (window-system)
;;   (define-key shell-mode-map (kbd "<up>") 'comint-previous-matching-input-from-input)
;;   (define-key shell-mode-map (kbd "<down>") 'comint-next-matching-input-from-input))

;; Some escape mode to enable maneuvering around the shell with arrow keys? A modifier specific to shell-mode?
(setq comint-input-ring-size 2000)
(eval-after-load "shell"
  '(when (window-system)
     (define-key shell-mode-map (kbd "<up>") (lambda (n) 
					       (interactive "p")
					       (if (comint-after-pmark-p)
						   (progn 
						     (comint-previous-matching-input-from-input n)
						     (setq this-command 'comint-previous-matching-input-from-input)) ;This function checks last-command to see if it was the last command called 
						 (previous-line n))))
     ;; (forward-line -n))))
     (define-key shell-mode-map (kbd "<down>") (lambda (n) 
						 (interactive "p")
						 (if (comint-after-pmark-p)
						     (progn
						     (comint-next-matching-input-from-input n)
						     (setq this-command 'comint-next-matching-input-from-input)) ;This function checks last-command to see if it was the last command called
						   (next-line n))))))
;; (forward-line n))))))

;----------------------------------------------------------------------
;; Ruby Mode
;----------------------------------------------------------------------
;;; enables outlining for ruby by default
;;; You may also want to bind hide-body, hide-subtree, show-substree,
;;; show-all, show-children, ... to some keys easy folding and unfolding
(add-hook 'ruby-mode-hook
              '(lambda ()
                 (outline-minor-mode)
                 (setq outline-regexp " *\\(def \\|class\\|module\\)")))
;----------------------------------------------------------------------
;; Ruby/Rails Specific Stuff
;; http://viget.com/extend/emacs-24-rails-development-environment-from-scratch-to-productive-in-5-minu
;----------------------------------------------------------------------
;;* A function from internet for launching rails console with "term" rather than "shell"
;; Modify to optionally call with "bundle exec" as prefix
;; (defun rails-console ()
;;   "Create a rails console process, if one doesn't exist. And switch to *rails-console* buffer."
;;   (interactive)
;;   (if (null (get-buffer "*rails-console*"))
;;       (progn
;;          (term "/bin/bash")
;;         (term-send-string (get-buffer-process "*terminal*") "rails console\n")
;;         (switch-to-buffer "*terminal*")
;;         (rename-buffer "*rails-console*")
;;         (term-line-mode))
;;     (switch-to-buffer "*rails-console*")))
;----------------------------------------------------------------------
;; My own Modes!
;----------------------------------------------------------------------
(define-generic-mode 
    'alvaro-mode                         ;; name of the mode to create
  nil                           ;; comments start with '!!'
  '("<.*>" "[.*]")                          ;; some keywords
  '(("=" . 'font-lock-operator)     ;; a list of other options
    )     
  nil                      ;; files for which to activate this mode 
  nil                              ;; other functions to call
  "A mode for Battlebaord text editing peculiar to comicboards.com"            ;; doc string for this mode
  )


;; Two small edits.
;; First is to put an extra set of parens () around the list
;; which is the format that font-lock-defaults wants
;; Second, you used ' (quote) at the outermost level where you wanted ` (backquote)
;; you were very close
(defvar hero-keywords nil)
(defvar hero-events nil)
(defvar hero-font-lock-defaults
  `((
     ;; stuff between "
     ("\"\\.\\*\\?" . font-lock-string-face)
     ;; ; : , ; { } =>  @ $ = are all special elements
     (":\\|,\\|;\\|{\\|}\\|=>\\|@\\|$\\|=" . font-lock-keyword-face)
     ( ,(regexp-opt hero-keywords 'words) . font-lock-builtin-face)
     ( ,(regexp-opt hero-events 'words) . font-lock-constant-face)
     )))

(define-derived-mode hero-mode text-mode "Battleboard Text"
  "text mode with string and basic markup highlighting."
  ;;register keywords
  (setq rich-text-font-lock-keywords
        '(("\"\\(\\(?:.\\|\n\\)*?[^\\]\\)\"" 0 font-lock-string-face)))
  (setq font-lock-defaults rich-text-font-lock-keywords)
  (font-lock-mode 1))
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
; Package Specific Stuff
;----------------------------------------------------------------------
;; RINARI
;----------------------------------------------------------------------
;; Interactively Do Things (highly recommended, but not strictly required)
       ;; (require 'ido)
       ;;(ido-mode t) ; I really think I hate this mode....
     
       ;; Rinari
       (add-to-list 'load-path "~/.emacs.d/elpa/rinari-2.9")
       (add-to-list 'load-path "~/.emacs.d/elpa/inf-ruby-2.2.3")
       (add-to-list 'load-path "~/.emacs.d/elpa/ruby-mode-1.1")
       (add-to-list 'load-path "~/.emacs.d/elpa/ruby-compilation-0.8")
       (add-to-list 'load-path "~/.emacs.d/elpa/jump-2.1")
       (add-to-list 'load-path "~/.emacs.d/elpa/findr-0.7")
       (add-to-list 'load-path "~/.emacs.d/elpa/inflections-1.0")
       (require 'rinari)
;----------------------------------------------------------------------



;----------------------------------------------------------------------
; Cool Things I Have Learned About Emacs
;----------------------------------------------------------------------
; (documentation 'foo)
; prints out a Python style docstring
; (find-library foo_mod)
; takes you to the file for a given lib name of the type (require foo_mod)
; (byte-compile-file foo.el) 
; Will use current buffer file by default (with prompt) and compile.
; Will probably be useful when package management fails to build something properly - you can probably cmopile files manually yourself
; To reload .emacs file after changes
; M-x load-file ~/.emacs
; OR it is probably safer to select changes that you have made and then
; M-x eval-region RET
; Close current bufer/window/frame:
; C-x k / C-x 0 / s-w
; reload buffer from disk:
; s-u 
;; MODES
;; C-h m or M-x describe-mode shows all the active minor modes (and major mode) and a brief description of each.
;; Also: M-: describe-mode or describe-minor-mode 
;; el-get in combination with built in package management for github goodness
;; To check whether you are in a non-terminal system look at the value of:
;; window-system
;; it will be "pc" or "ns" (OS X) or if in terminal nil
;; Also can check:
;; emacs-version
;; Changing Font
  ;; (set-face-attribute 'default (selected-frame) :height 100)
 ;; (set-frame-font
    ;; "-outline-Courier New-normal-normal-normal-mono-11-*-*-*-c-*-iso8859-1")
;; Rectangles and associated commands e.g. 
;; C-x r k - Kill the text of the region-rectangle, saving its contents as the “last killed rectangle” (kill-rectangle). 
;; C-q runs the command quoted-insert, which reads the next input character/event and inserts it.
;;  - The best way to see what is getting sent to emacs is by writing
;; (read-event)
;; in an interactive lisp session, evaluating it with <Command-r> and then moving the mouse/pressing a key whatever
;; Also use (symbol-function 'function-name) to find out what a function name is bound to
;; EDEBUG
;; M-x edebug-eval-top-level-form
;; or go to the source and do C-u C-M-x (<Control u> <Control Alt x>) to set up a function for edebugging
;; last-command and this-command
;; Normally, whenever a function is executed, Emacs sets the value of this-command to the function being executed (which in this case would be copy-region-as-kill). At the same time, Emacs sets the value of last-command to the previous value of this-command.
;; diff-buffer-with-file to see if a buffers contents are different from the file
;; M-: buffer-file-name ; to see the file name for the current buffer...
;; C-u M-x shell will let you open multiple shells
;; All the lisp files for the current installation of emacs are in:
 ;; /Applications/Emacs.app/Contents/Resources/lisp:
;; hotgirlsforall.com
;; veryniceteens.com
;; fallenteenangels.com
;; kittyangels.com
;; gallerysex.net
;; themilf.net
;; karupsdb.com/tgp.php
;; http://wildteenfuck.com/
;; http://www.dinathumbs.com/
;; jerkroom.com
;; auntmia.com
;; atozgals.com
;; erotica7.com
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; TO DO
;----------------------------------------------------------------------
;; * A comment-region that comments out all lines that are being "touched" by the current region
;; * A select-region and type that simultaneously deletes the previously selected region and inserts the new text instead of deselecting and
;; inserting text - SOLVED -  (set delete-selection-mode t)
;; * Line NUmbering package.
;; * Follow links in directories in current window
;; * Save window and frame configuration 
;; * A function bound to "s-4" (Command 4) that creates a "square" set of 4 windows in the current frame.
;; * Fix the require stuff for rinari - stuff should be in util subdirectory?
;; * <Command Tab> for tab completion or something like it
;; * Some form of command binding to help - (global-set-key (remap 'x) 'y) ? ;x and y have to be functions not key bindings in that case
;; * Find a good <Command> Binding for C-x C-f
;; * Good binding for Keyboard Macro invocation
;; * Bind Set mark - <Command Spacebar> ? (Prob not as necessary now that shift select is working good)
;; * Binding for global and regional indent - <s-\>
;; * Good available keybindings:
;; -  <s-Return>
;; -  <s-spacebar> - system bound to spotlight - UNBOUND!
;; -  <s-escape> - system bound to Front Row - UNBOUND!
;; -  <s-TAB> - system bound to expose
;; -  <s-+>
;; -  <s-=>
;; -  <s-Delete>
;; -  function key?
;; * An irb/interpreter mode for running irb (and perhaps Python) over a shell. The main thing would be to start a new interactive
;; command history - so that we dont get irb commands in our bash history and vice versa
;; * Bindings for the trackpad multitouch gestures?
;; * Get search to automatically wrap.
;; * Interactive lisp - call eval-print-last-sexp such that it evals the S-expression that the cursor is inside of OR the last one if not inside one
;;     - could be a little dangerous - we might be in an "implicit lisp environment"
;; A function to evaluate a region of lisp functions (a la eval-region) but then capture the output of each s-expression (a la eval-print-last-sexp) in a new buffer

;----------------------------------------------------------------------
; Ways to jump between predefined points in a file (function definitions etc)
;----------------------------------------------------------------------



;----------------------------------------------------------------------
; BUGS
;----------------------------------------------------------------------
;; * A fresh new buffer did not let me edit it/add any text fixed when i created new buffer in another window
;; * delete-selection-mode stopped working when i saved a new buffer and text mode was enabled. 
;; Started working again after i deactivated and re-activated the mode
;; * When I used <Command b> or tried to switch to a buffer it would not change the buffer in the current window
;; as normal but would move me to a currently open window in another frame which was already showing the buffer. 
;; Not necessarily a bad thing but would like this behaviour to be consistent. 
;----------------------------------------------------------------------
; Representative Sampling of Current key bindings			
;----------------------------------------------------------------------
;; .....
;----------------------------------------------------------------------


