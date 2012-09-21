;(defvar emacs-directory "~/.emacs.d/") "The directory containing the emacs configuration files."
;; Define the load-path
;(pushnew (expand-file-name emacs-directory) load-path)


;; Will setting this 't' or 'f' this help me with scrolling to the top and bottom of files?
;; (set 'scroll-preserve-screen-position t)
;; (set 'scroll-preserve-screen-position nil)

;----------------------------------------------------------------------
; Persisting command history and other things between emacs sessions
;----------------------------------------------------------------------
(savehist-mode 1)
; Save entire emacs session - can be done manually to load/save different setups to/from different locations
(desktop-save-mode 1)
;----------------------------------------------------------------------

;; How to make Pho Soup
;; Heat up soup
;; Bean sprouts in a bowl
;; Pour soup on top
;; Add chopped basil
;; Add lemon
;; Add some chilli

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
;----------------------------------------------------------------------
; Navigation Bindings
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
;; From the web - cant use Shift-Command - i want that to select text
;; http://stackoverflow.com/questions/91071/emacs-switch-active-window
(hglobal-set-key (kbd "<M-s-up>") 'windmove-up )
(global-set-key (kbd "<M-s-down>") 'windmove-down)
(global-set-key (kbd "<M-s-right>") 'windmove-right)
(global-set-key (kbd "<M-s-left>") 'windmove-left)
;; Again from the web
(defun win-bck()
  (interactive)
  (other-window -1))
(defun win-fwd()
  (interactive)
  (other-window 1))
(global-set-key (kbd "s-[") 'win-bck)
(global-set-key (kbd "s-]") 'win-fwd)
;; (global-unset-key (kbd "<s-[>"))
;; (global-unset-key (kbd "<s-]>"))
;; Closing Windows - remap "s-w" from delete-frame and map "s-W" to delete-frame
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-frame)
;----------------------------------------------------------------------
;; Buffers
;----------------------------------------------------------------------
(global-set-key (kbd "s-<") 'previous-buffer)
(global-set-key (kbd "s->") 'next-buffer)
;----------------------------------------------------------------------
(global-set-key (kbd "s-b") 'switch-to-buffer)
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
;Set Command-Up and Down (previously unset) to scroll up and down a page (approximately)
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
;;* ELISP Interactivity Bindings
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
;----------------------------------------------------------------------


;----------------------------------------------------------------------
; Package Specific Stuff
;----------------------------------------------------------------------
;; RINARI
;----------------------------------------------------------------------
;; Interactively Do Things (highly recommended, but not strictly required)
       (require 'ido)
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
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Representative Sampling of Current key bindings			
;----------------------------------------------------------------------
;; C-@		set-mark-command
;; C-a		move-beginning-of-line
;; C-b		backward-char
;; C-c		mode-specific-command-prefix
;; C-d		delete-char
;; C-e		move-end-of-line
;; C-f		forward-char
;; C-g		keyboard-quit
;; C-h		help-command
;; TAB		indent-for-tab-command
;; C-j		newline-and-indent
;; C-k		kill-line
;; C-l		recenter-top-bottom
;; RET		newline
;; C-n		next-line
;; C-o		open-line
;; C-p		previous-line
;; C-q		quoted-insert
;; C-r		isearch-backward
;; C-s		isearch-forward
;; C-t		transpose-chars
;; C-u		universal-argument
;; C-v		scroll-up-command
;; C-w		kill-region
;; C-x		Control-X-prefix
;; C-y		yank
;; C-z		suspend-frame
;; ESC		ESC-prefix
;; C-\		toggle-input-method
;; C-]		abort-recursive-edit
;; C-_		undo
;; s-&		kill-this-buffer
;; s-'		next-multiframe-window
;; s-,		customize
;; s--		center-line
;; s-:		ispell
;; s-;		ispell-next
;; s-?		info
;; s-C		comment-or-uncomment-region
;; s-D		dired
;; s-E		edit-abbrevs
;; s-H		ns-do-hide-others
;; s-L		shell-command
;; s-M		manual-entry
;; s-S		ns-write-file-using-panel
;; s-^		kill-some-buffers
;; s-`		other-frame
;; s-a		mark-whole-buffer
;; s-b		switch-to-buffer
;; s-c		ns-copy-including-secondary
;; s-d		isearch-repeat-backward
;; s-e		isearch-yank-kill
;; s-f		isearch-forward
;; s-g		isearch-repeat-forward
;; s-h		ns-do-hide-emacs
;; s-j		exchange-point-and-mark
;; s-k		kill-this-buffer
;; s-l		goto-line
;; s-m		iconify-frame
;; s-n		make-frame
;; s-o		ns-open-file-using-panel
;; s-p		ns-print-buffer
;; s-q		save-buffers-kill-emacs
;; s-s		save-buffer
;; s-t		ns-popup-font-panel
;; s-u		revert-buffer
;; s-v		yank
;; s-w		delete-frame
;; s-x		kill-region
;; s-y		ns-paste-secondary
;; s-z		undo
;; s-|		shell-command-on-region
;; s-~		ns-prev-frame
;; C-SPC		set-mark-command
;; C--		negative-argument
;; C-/		undo
;; C-0 .. C-9	digit-argument
;; <C-M-down>	down-list
;; <C-M-end>	end-of-defun
;; <C-M-home>	beginning-of-defun
;; <C-M-left>	backward-sexp
;; <C-M-right>	forward-sexp
;; <C-M-up>	backward-up-list
;; <C-S-backspace>			kill-whole-line
;; <C-backspace>			backward-kill-word
;; <C-delete>	kill-word
;; <C-down>	forward-paragraph
;; <C-down-mouse-1>		mouse-buffer-menu
;; <C-down-mouse-2>		facemenu-menu
;; <C-end>		end-of-buffer
;; <C-home>	beginning-of-buffer
;; <C-insert>	kill-ring-save
;; <C-insertchar>	kill-ring-save
;; <C-left>	left-word
;; <C-next>	scroll-left
;; <C-prior>	scroll-right
;; <C-right>	right-word
;; <C-up>		backward-paragraph
;; <C-wheel-down>	mwheel-scroll
;; <C-wheel-up>	mwheel-scroll
;; <M-begin>	beginning-of-buffer-other-window
;; <M-down>	sfp-bit-down
;; <M-down-mouse-1>		mouse-drag-secondary
;; <M-drag-mouse-1>		mouse-set-secondary
;; <M-end>		end-of-buffer-other-window
;; <M-home>	beginning-of-buffer-other-window
;; <M-left>	left-word
;; <M-mouse-1>	mouse-start-secondary
;; <M-mouse-2>	mouse-yank-secondary
;; <M-mouse-3>	mouse-secondary-save-then-kill
;; <M-next>	scroll-other-window
;; <M-prior>	scroll-other-window-down
;; <M-right>	right-word
;; <M-up>		sfp-bit-up



