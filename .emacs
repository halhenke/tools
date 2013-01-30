;----------------------------------------------------------------------
; Customise for different environments
;----------------------------------------------------------------------
;; A directory with OS dependent configurations and other emacs inititialization & cusomization source files
(add-to-list 'load-path "~/.emacs.d/init-files/") 

(cond ((equal window-system 'ns)
       (require 'mac-setup))
      ((equal window-system 'x)
       (require 'unix-setup)))

;; Stuff to choose if we are using a terminal rather than one of the window system
;; (unless (display-graphic-p)
;;   (progn
;;     (define-key input-decode-map "\e[1;5C" [(control right)])
;;     (define-key input-decode-map "\e[1;5D" [(control left)])
;;     (define-key input-decode-map "\e[1;5E" [(control up)])
;;     (define-key input-decode-map "\e[1;5F" [(meta left)])))
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Some nice global emacs settings
;----------------------------------------------------------------------
;; Persisting command history and other things between emacs sessions
(savehist-mode 1)
(setq history-length 1000)
; Save entire emacs session - can be done manually to load/save different setups to/from different locations
(if window-system
    (desktop-save-mode 1))
;; Lets have lines wrap at the edge of the screen at word boundaries by default....
(global-visual-line-mode  1)
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
;; Enable column number
(column-number-mode 1)
;----------------------------------------------------------------------
;; Web Derived Theme Stuff 
;; now defined in OS-specific setup ~/.emacs.d/init_files
(load-theme 'wheatgrass) 
;; (load-theme 'tango) ;bit hard to read....
;----------------------------------------------------------------------
;; Should really make this so it only goes on in lisp mode...
(show-paren-mode 1)
(setq show-paren-style 'expression)
(ido-mode t)

;; Enable the use of set upper/lower case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; At the moment my 'frame-title-format variable is set to
;; (multiple-frames "%b" ("" invocation-name "@" system-name))
;; might be nice to set it to something that shows the path of the current file so i dont have to invoke
;; (buffer-file-name) all the time... e.g. from stack overflow:
;; (setq frame-title-format
;;       (list (format "%s %%S: %%j " (system-name))
;;         '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;----------------------------------------------------------------------
;; Mouse Scrolling Stuff From Web - scroll one line at a time (less "jumpy" than defaults)
;----------------------------------------------------------------------
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control.nil)))) ;; one line at a time - not sure what shift does
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;======================================================================
; PACKAGE MANAGEMENT
;======================================================================
;; SELF-INSTALLED PACKAGE DIRECTORY
;; Setting up my own official location for self-installed code
;----------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/packages/") 
;; This package provides revbufs command to automatically and safely revert all buffers e.g. after git checkout branch
(require 'revbufs)
;; A major mode for editing javascript Handlebars templates
(require 'handlebars-mode)
;----------------------------------------------------------------------
; ELPA
;----------------------------------------------------------------------
; Adding sources to the list of where we can install packages from
;----------------------------------------------------------------------
;; Add the original Emacs Lisp Package Archive
(require 'package)
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;----------------------------------------------------------------------
; EL-GET
;----------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; Install el-get if we dont already have it
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously 
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
;----------------------------------------------------------------------
; - RECIPES
;   Chuck this stuff in its own directory eventually
;----------------------------------------------------------------------
;; Attempting to create recipes for my stuff - either set el-get-sources or in recipe directory...i think
;; Might be able to set arbitrary list name if you explicitly call it with el-get....Cant remember
(setq 
 el-get-sources 
 '((:name org-mode-experimental
	  ;; Commit b63f5333e7bbab900b134584d07e158aeba14844 has the EXPERIMENTAL/org-export.el file with the org-export-set-backend function that we need in org-mediawiki
	  ;; Later versions do not have this - org-export.el is now in contrib/lisp but does not have the org-export-set-backend function
	  ;; The code for this package seems to have changed considerably....
	  :description "Experimental stuff for org-mode - necessary to get org-mode to media-wiki export going..."
	  :type git
	  :url "git://repo.or.cz/org-mode.git"
	  ;; :checkout "b63f5333e7bbab900b134584d07e158aeba14844"
	  ;; :post-init (add-to-list 'load-path "~/.emacs.d/el-get/org-mode-experiment/EXPERIMENTAL")
	  ;; :load-path ("EXPERIMENTAL") ;; Equivalent to above :post-init instruction
	  ;; :load-path ("./contrib/lisp" "./lisp")
	  )
   (:name org-media-wiki	  
	  :description "Export/convert from org-mode to media-wiki format - NOTE this dependds on an outdated version of org-mode and as such seems to be way more trouble than its worth"
	  :depends org-mode-experimental
	  :type http
	  :url "http://lumiere.ens.fr/~guerry/u/org-mediawiki.el"
	  ;; :features org-mediawiki
	  )
   (:name evernote-mode
	  :description "Mode for the editing of evernote documents. 
This is a fork from the package available on package-management that requires Ruby 1.9.3 etc rather than Ruby 1.8.7
This needs something called gdbm 'sudo port install gdbm ruby' and you have to run a ruby script after installation i think..."
	  :type git
	  ;; :url "git@github.com:rubbish/evernote-mode.git"
	  :url "https://github.com/rubbish/evernote-mode.git"
	  ;; either prepare or post-init
	  :post-init (setq evernote-ruby-command "/Users/Hal/.hals_macport_links/ruby") 
	  :features evernote-mode
	  )
   ))
;; Check our packages are installed and initialized properly
;; syn/asyn determines if its a synchronous operation or not
(el-get 'sync)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;;  Revert All Buffers - see self-installed
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;;  Web Mode
;----------------------------------------------------------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;----------------------------------------------------------------------
;; EVERNOTE MODE
;----------------------------------------------------------------------
;; This is installed by el-get but for now goes here...
;; (setq evernote-username "haroldpark") ; optional: you can use this username as default.
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option
;; (global-set-key "\C-cec" 'evernote-create-note)
;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)
;; (global-set-key "\C-cep" 'evernote-post-region)
;; (global-set-key "\C-ceb" 'evernote-browser)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Setting up SLIME LISP interactive editing
;----------------------------------------------------------------------
;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(setq inferior-lisp-program "/opt/local/bin/clisp") ; your Lisp system
;; (setq inferior-lisp-program "/usr/homebrew/bin/sbcl") ; your Lisp system
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Setting up nxHTML for mixed mode HTML editing (ruby/rails etc)
;----------------------------------------------------------------------
;; Yeah i kind of hate this mode
;; (load "~/.emacs.d/nxhtml/autostart.el")


;=========================
; HALS CUSTOM KEY BINDINGS
;=========================
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
; All Platforms
;----------------------------------------------------------------------
(global-set-key (kbd "s-d") 'dired) ; Have this setup in the Mac/Unix files also
;----------------------------------------------------------------------
; MAC OSX SPECIFIC BINDINGS
; See the ~/.emacs.d/init_files/mac_init.el
; LINUX SPECIFIC BINDINGS
; See the ~/.emacs.d/init_files/unix_init.el
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
;----------------------------------------------------------------------
; Buffer/Frame/Window Switching
;----------------------------------------------------------------------
; I basically seem to have the following unbound keys to play around with and rebind for changing windows:
;; "s-(" & "s-)" or without shift key "s-9" & "s-0" 
;; "s-{" & "s-}" or without shift key "s-[" & "s-]"
;----------------------------------------------------------------------
;; Frames - See OS specific implementations in ~/.emacs.d/init_files/
;----------------------------------------------------------------------
;; "s-<" & "s->" -- "s-," is bound to 'customize while "s-." is unbound
;; These give errors - wrong args - not to be used interactively?
;; (global-set-key (kbd "s-[") 'previous-window)
;; (global-set-key (kbd "s-]") 'next-window)
;; Switching Forward & Backward between frames with Command-{ & Command-}
;----------------------------------------------------------------------
;; Windows
;----------------------------------------------------------------------
;; Navigating between windows
;; From the web - cant use Shift-Command - i want that to select text
;; http://stackoverflow.com/questions/91071/emacs-switch-active-window
;; Windows Cycling
(setq windmove-wrap-around t)
;; (global-unset-key (kbd "<prior>"))
;; (global-unset-key (kbd "<next>"))
;; (global-unset-key (kbd "<end>"))
;; (global-unset-key (kbd "<home>"))
(global-set-key (kbd "<C-s-up>") 'windmove-up)
(global-set-key (kbd "<C-s-down>") 'windmove-down)
(global-set-key (kbd "<C-s-right>") 'windmove-right)
(global-set-key (kbd "<C-s-left>") 'windmove-left)
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
;; Rotate Windows - from emacswiki
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
;; Toggle Window Split - from emacswiki
(defun toggle-window-split ()
  "If you have two vertically open windows switch to two horizontally open windows and vice versa."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally}
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "s-6") 'toggle-window-split)
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

;=================================================
; MODE SPECIFIC BINDINGS, COMMANDS, AND SETTINGS
;=================================================
(require 'hals-mode-customizations)

;=================================================
; DEFINING MY OWN MODES
;=================================================
(require 'hals-mode-declarations)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
; Package Specific Stuff
;----------------------------------------------------------------------
(require 'hals-cool-stuff)
;----------------------------------------------------------------------

