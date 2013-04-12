;=================================================
; BINDINGS, COMMANDS, AND SETTINGS RELATED TO 
; OUTLINE-MINOR-MODE....
;=================================================
(provide 'hals-outline-customizations)


;----------------------------------------------------------------------
; Outline-minor-mode key map
; - From emacswiki
; Uses M-o as a prefix command rather than C-c @
;----------------------------------------------------------------------
 (define-prefix-command 'cm-map nil "Outline-")
 ; HIDE
 (define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
 (define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
 (define-key cm-map "o" 'hide-other)        ; Hide other branches
 (define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
 (define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
 (define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
 ; SHOW
 (define-key cm-map "a" 'show-all)          ; Show (expand) everything
 (define-key cm-map "e" 'show-entry)        ; Show this heading's body
 (define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
 (define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
 (define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
 ; MOVE
 (define-key cm-map "u" 'outline-up-heading)                ; Up
 (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
 (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
 (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
 (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
 (global-set-key "\M-o" cm-map)


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
;; Better for some Ruby/Rails related modes/files - e.g. Factory girl/Rspec etc
;; Current outline-regexp:
;; " *\\(def \\|class\\|module\\)"
;; For factory & Rspec
;; " *\\(def \\|class\\|module\\|factory\\describe\\)"
;; Didnt quite work
