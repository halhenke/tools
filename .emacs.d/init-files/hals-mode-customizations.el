;=================================================
; MODE SPECIFIC BINDINGS, COMMANDS, AND SETTINGS
;=================================================
(provide 'hals-mode-customizations)
;================================================================================
; Associating filetypes with modes
;================================================================================
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gitignore\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.inputrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.bash.*" . shell-script-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;----------------------------------------------------------------------
;  Shell Mode
;----------------------------------------------------------------------
          ;----------------------------------------------------------------------
          ;  Bash Completion - GIT
          ;  - a basic bit of bash completion
          ;----------------------------------------------------------------------
;; (defconst pcmpl-git-commands
;;   '("add" "bisect" "branch" "checkout" "clone"
;;     "commit" "diff" "fetch" "grep"
;;     "init" "log" "merge" "mv" "pull" "push" "rebase"
;;     "reset" "rm" "show" "status" "tag" )
;;   "List of `git' commands")

(defconst pcmpl-git-commands
  '("add" "merge-one-file" "merge-ours" "am" "merge-recursive" "annotate" "merge-resolve" "apply" "merge-subtree" "archimport" "merge-tree" "archive" "mergetool" "bisect" "mktag" "mktree" "blame" "mv" "branch" "name-rev" "bundle" "notes" "cat-file" "p4" "check-attr" "pack-objects" "check-ref-format" "pack-redundant" "checkout" "pack-refs" "checkout-index" "patch-id" "cherry" "peek-remote" "cherry-pick" "prune" "citool" "prune-packed" "clean" "pull" "clone" "push" "column" "quiltimport" "commit" "read-tree" "commit-tree" "rebase" "config" "receive-pack" "count-objects" "reflog" "credential" "relink" "credential-cache" "remote" "remote-ext" "credential-store" "remote-fd" "cvsexportcommit" "remote-ftp" "cvsimport" "remote-ftps" "cvsserver" "remote-http" "daemon" "remote-https" "describe" "remote-testgit" "diff" "remote-testsvn" "diff-files" "repack" "diff-index" "replace" "diff-tree" "repo-config" "difftool" "request-pull" "rerere" "fast-export" "reset" "fast-import" "rev-list" "fetch" "rev-parse" "fetch-pack" "revert" "filter-branch" "rm" "fmt-merge-msg" "send-email" "for-each-ref" "send-pack" "format-patch" "fsck" "shell" "fsck-objects" "shortlog" "gc" "show" "get-tar-commit-id" "show-branch" "grep" "show-index" "gui" "show-ref" "stage" "hash-object" "stash" "help" "status" "http-backend" "stripspace" "http-fetch" "submodule" "http-push" "subtree" "imap-send" "symbolic-ref" "index-pack" "tag" "init" "tar-tree" "init-db" "unpack-file" "instaweb" "unpack-objects" "log" "update-index" "lost-found" "update-ref" "ls-files" "update-server-info" "ls-remote" "upload-archive" "ls-tree" "upload-pack" "mailinfo" "var" "mailsplit" "verify-pack" "merge" "verify-tag" "merge-base" "merge-file" "whatchanged" "merge-index" "write-tree" "merge-octopus" "credential-osxkeychain")
  "List of `git' commands")


(defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
  "The `git' command to run to get a list of refs")
 
(defun pcmpl-git-get-refs (type)
  "Return a list of `git' refs filtered by TYPE"
  (with-temp-buffer
    (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
    (goto-char (point-min))
    (let ((ref-list))
      (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
        (add-to-list 'ref-list (match-string 1)))
      ref-list)))
 
(defun pcomplete/git ()
  "Completion for `git'"
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-git-commands)  
  ;; complete files/dirs forever if the command is `add' or `rm'
  (cond
   ((pcomplete-match (regexp-opt '("add" "rm")) 1)
    (while (pcomplete-here (pcomplete-entries))))
   ;; provide branch completion for the command `checkout'.
   ;; ((pcomplete-match "checkout" 1)
   ((pcomplete-match (regexp-opt '("checkout" "show") 1))
    (pcomplete-here* (pcmpl-git-get-refs "heads")))))


;----------------------------------------------------------------------
;  Outline Minor Mode
;----------------------------------------------------------------------
; Try to get some nicer behaviour in outline minor mode for code folding...
;----------------------------------------------------------------------
;; For now - this bit is disabled - the keybindings seemed to not go away after 
;; outline-minor-mode was disabled - at least in the same buffer - weird...
;; Actually no - it adds the keybindings to PHP-mode rather than outline-minor-mode. Stupid.
;; Even doing
;; (setq php-mode-user-hook nil)
;; doesnt restore php-mode key bindings to normal


;;     (defun show-onelevel ()
;;       "show entry and children in outline mode"
;;       (interactive)
;;       (show-entry)
;;       (show-children))
;; ;; Some better/more useful  bindings
;;     (defun cjm-outline-bindings ()
;;       "sets shortcut bindings for outline minor mode"
;;       (interactive)
;;       (local-set-key [?\C-,] 'hide-sublevels)
;;       (local-set-key [?\C-.] 'show-all)
;;       (local-set-key [C-up] 'outline-previous-visible-heading)
;;       (local-set-key [C-down] 'outline-next-visible-heading)
;;       (local-set-key [C-left] 'hide-subtree)
;;       (local-set-key [C-right] 'show-onelevel)
;;       (local-set-key [M-up] 'outline-backward-same-level)
;;       (local-set-key [M-down] 'outline-forward-same-level)
;;       (local-set-key [M-left] 'hide-subtree)
;;       (local-set-key [M-right] 'show-subtree))
;; (add-hook 'outline-minor-mode-hook
;;               'cjm-outline-bindings) 
;; Better for PHP mode
(add-hook 'php-mode-user-hook
	  '(lambda ()
	     (outline-minor-mode)
	     (setq outline-regexp " *\\(private funct\\|public funct\\|funct\\|class\\|#head\\)")
	     (hide-sublevels 1)))
;; Better for Python mode
(add-hook 'python-mode-hook
	  '(lambda ()
	     (outline-minor-mode)
	     (setq outline-regexp " *\\(def \\|clas\\|#hea\\)")
	     (hide-sublevels 1)))
;----------------------------------------------------------------------
;;  Org Mode
;----------------------------------------------------------------------
(set 'org-support-shift-select 1)
(set 'org-replace-disputed-keys 1)
(require 'cl)
(defun org-insert-BEGIN-region (block-type)
 "An org-mode helper that encloses the lines highlighted by the current region in a '#+BEGIN_BLOCK' where 'BLOCK' is determined interactively.

Possible values are VERSE, SRC language, QUOTE and EXAMPLE."
  (interactive "S Give us a type of Begin block (v: VERSE, s: SRC, q: QUOTE, e: EXAMPLE ): ")
  (let (beg end beg-string end-string lang)
	    ;; (beg-string "\n#+BEGIN_VERSE\n")
	    ;; (end-string "\n#+END_VERSE\n"))
    (catch 'break
      (case block-type
	(v 
	 (setq beg-string "#+BEGIN_VERSE\n")
	 (setq end-string "\n#+END_VERSE"))
	(s 
	 (setq lang (read-string "What language does this block contain?: " nil nil "elisp"))
	 (setq beg-string (format "#+BEGIN_SRC %s\n" lang))
	 (setq end-string "\n#+END_SRC"))
	(q 
	 (setq beg-string "#+BEGIN_QUOTE\n")
	 (setq end-string "\n#+END_QUOTE"))
	(e 
	 (setq beg-string "#+BEGIN_EXAMPLE\n")
	 (setq end-string "\n#+END_EXAMPLE"))
	(otherwise (print "Bad block type - aborting!")
		   (throw 'break "You have to give a valid org-mode BEGIN block type..."))
	)
    (if (region-active-p)
	(progn
	  (setq beg (region-beginning) end (region-end))
	  (set-window-point (selected-window) beg)
	  (beginning-of-line) ;; else insert newline before beg-string
	  (insert beg-string)
	  (set-window-point (selected-window) (+ end (length beg-string)))
	  (end-of-line) ;; else insert newline after end-string
	  (insert end-string)
	  ;; (next-line)
	  )
      (progn
	  (beginning-of-line) ;; else insert newline before beg-string
	  (insert beg-string)
	  (end-of-line) ;; else insert newline after end-string
	  (insert end-string)
       )
    ))
  ))
;; (global-set-key (kbd "M-P") 'org-insert-BEGIN-region)
(add-hook 'org-mode-hook 
	  '(define-key org-mode-map (kbd "M-P") 'org-insert-BEGIN-region))

;; Sample text for screwing aruond
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Insert the
arguments, either strings or characters, at point.
Point and before-insertion markers move forward to end up
 after the inserted text.
Any other markers at the point of insertion remain before the text. and a good day
abra
#+BEGIN_SRC elisp
cadabra
#+END_SRC
here is good






;; (insert-BEGIN)
;; (read-key )function-b is:
;; 98 (#o142, #x62)
;; (defun block-verse-region-or-line (beg end)
;;   ;; (set temp-left comment-start)
;;   ;; (set comment-start ": ")
;;   (comment-or-uncomment-region-or-line)
;;   ;; (set comment-start temp-left)
;;   )
;; (define-key org-mode-map [98] (block-verse-region-or-line ())) ;; function-b

;; (add-hook 'org-mode-hook 'block-verse-region-or-line)


;;----------------------------------------------------------------------
;; * ELISP Mode 
;; - And also lisp interactive mode
;;----------------------------------------------------------------------
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


;================================================================================

;;----------------------------------------------------------------------
;; Ruby Mode
;;----------------------------------------------------------------------
;; enables outlining for ruby by default
;; You may also want to bind hide-body, hide-subtree, show-substree,
;; show-all, show-children, ... to some keys easy folding and unfolding
(add-hook 'ruby-mode-hook
              '(lambda ()
                 (outline-minor-mode)
                 (setq outline-regexp " *\\(def \\|class\\|module\\)")))

;;----------------------------------------------------------------------
;; Haml Mode
;;----------------------------------------------------------------------
;; Haml-modes default indentation sucks - I want to be able to control 
;; the indentation myself by moving it forward or backwards without cycling 
;; through all possibilities.
;; Rewriting a high level method may be too time consuming so i might just 
;; have a function that moves a line in or out by multiples of two

;; (defun hals-haml-indent-line ()
;;   "Indent the current line.
;; If called with no argument then indent to the maximum sensible indentation.
;; Otherwise move forward by n indentations. 
;; In practice this is intended to be bound to positive and negative values."
;;   )
  ;; The first time this command is used, the line will be indented to the
  ;; maximum sensible indentation.  Each immediately subsequent usage will
  ;; back-dent the line by `haml-indent-offset' spaces.  On reaching column
  ;; 0, it will cycle back to the maximum sensible indentation."
  ;; (interactive "*")
  ;; (let ((ci (current-indentation))
  ;;       (cc (current-column)))
  ;;   (destructuring-bind (need strict) (haml-compute-indentation)
  ;;     (save-excursion
  ;;       (beginning-of-line)
  ;;       (delete-horizontal-space)
  ;;       (if (and (not strict) (equal last-command this-command) (/= ci 0))
  ;;           (indent-to (* (/ (1- ci) haml-indent-offset) haml-indent-offset))
  ;;         (indent-to need))))
  ;;   (when (< (current-column) (current-indentation))
  ;;     (forward-to-indentation 0))))
(defun hal-haml-indent-small ()
  "Just trying to do a simple method to move a line one level more or less indented"
  (interactive "*")
  (let ((ci (current-indentation))
        (cc (current-column)))      ;; Current line position
    (save-excursion  ;; Do stuff and then return to the same spot in buffer
      ;; Go to beginning of line and delete all tabs and spaces
      (beginning-of-line)               
      (delete-horizontal-space)
      ;; (indent-to (* (/ (1- ci) haml-indent-offset) haml-indent-offset))
      (indent-to (- ci 2))
      )))
hal-haml-indent-small

hal-haml-indent-small

	  hal-haml-indent-small


;; (global-set-key (kbd "<home>") (hal-haml-indent-small 14))
;; (global-unset-key (kbd "<home>"))

(add-hook 'haml-mode-hook
               (lambda ()
                 (setq indent-tabs-mode nil)
                 (define-key haml-mode-map "\C-m" 'newline-and-indent)))
;;----------------------------------------------------------------------

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
