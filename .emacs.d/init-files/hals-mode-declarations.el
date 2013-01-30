;****************************************
;; In this file are my attempts to create/modify my own modes for syntax highlighting etc
;;----------------------------------------
(provide 'hals-mode-declarations)
;;----------------------------------------
;; For instructions see:
;; http://ergoemacs.org/emacs/elisp_syntax_coloring.html
;;****************************************

;;----------------------------------------
;; Trying to do a mode from scratch
;; (define-generic-mode 
;;     MODE 
;;   COMMENT-LIST 
;;   KEYWORD-LIST 
;;   FONT-LOCK-LIST
;;  AUTO-MODE-LIST 
;;  FUNCTION-LIST 
;;  &optional DOCSTRING)

(require 'generic-x) ;; we need this

(define-generic-mode 
    'alvaro-mode                ;; name of the mode to create
  nil                           ;; comments start with '!!'
  '("quote")            ;; some keywords
  '("<.*?>") 
  nil                ;; files for which to activate this mode 
  nil                ;; other functions to call
  "A mode for Battlebaord text editing peculiar to comicboards.com"            ;; doc string for this mode
  )
 
;; example from internet
(define-generic-mode 
  'foo-mode                         ;; name of the mode to create
  '("!!")                           ;; comments start with '!!'
  '("account" "user" 
    "password")                     ;; some keywords
  '(("=" . 'font-lock-operator)     ;; '=' is an operator
    (";" . 'font-lock-builtin))     ;; ';' is a a built-in 
  '("\\.foo$")                      ;; files for which to activate this mode 
   nil                              ;; other functions to call
  "A mode for foo files"            ;; doc string for this mode
)

;;----------------------------------------

;;----------------------------------------
;; Trying to do a mode derived from another mode 

;; Two small edits.
;; First is to put an extra set of parens () around the list
;; which is the format that font-lock-defaults wants
;; Second, you used ' (quote) at the outermost level where you wanted ` (backquote)
;; you were very close

;; (defvar hero-keywords nil)
;; (defvar hero-events nil)

;; (defvar hero-font-lock-defaults
;;   `((
;;      ;; stuff between "
;;      ("\"\\.\\*\\?" . font-lock-string-face)
;;      ;; ; : , ; { } =>  @ $ = are all special elements
;;      (":\\|,\\|;\\|{\\|}\\|=>\\|@\\|$\\|=" . font-lock-keyword-face)
;;      ( ,(regexp-opt hero-keywords 'words) . font-lock-builtin-face)
;;      ( ,(regexp-opt hero-events 'words) . font-lock-constant-face)
;;      )))

;; (define-derived-mode hero-mode text-mode "Battleboard Text"
;;   "text mode with string and basic markup highlighting."
;;   ;;register keywords
;;   (setq rich-text-font-lock-keywords
;;         '(("\"\\(\\(?:.\\|\n\\)*?[^\\]\\)\"" 0 font-lock-string-face)))
;;   (setq font-lock-defaults rich-text-font-lock-keywords)
;;   (font-lock-mode 1))
;;----------------------------------------

;;----------------------------------------
;; ;; An example from the net 

;; (setq myKeywords
;;  '(("Sin\\|Cos\\|Sum" . font-lock-function-name-face)
;;    ("\\|Infinity" . font-lock-constant-face)
;;   )
;; )

;; (define-derived-mode xah-math-lang-mode fundamental-mode
;;   (setq font-lock-defaults '(myKeywords))
;;   (setq mode-name "math lang"))
;;----------------------------------------

;;----------------------------------------
;; An ALVARO Specific mode
;; - with explicit reg-exps
;; highlights for quote, img, bold and italic tags
(setq hero-keywords '(("\\[.*?quote\\]\\|<.*?\\(i\\|I\\)>\\|<.*?\\(b\\|B\\)>\\|\".*\"" . font-lock-function-name-face)
   ("<img.*?src=\\(.*\\)>" . font-lock-constant-face)
  )
)
(define-derived-mode hero-mode fundamental-mode
  (setq font-lock-defaults '(hero-keywords))
  (setq mode-name "hero"))
;;----------------------------------------

;;----------------------------------------
;; A slightly different, more declarative way with regexp-opt

(defvar comic-quotes '("[quote]" "[/quote]") "Alvaro quote tags")
(defvar comic-markup '("<i>" "</i>" "<b>" "</b>") "Simple html markup")
(defvar comic-image '("<img src="">") "Alvaros image tags")

;; Create regular expressions
;; - dont use 'words it doesnt seem to match anything
;; If you want to change any of these variables after definition you have to use setq
(defvar comic-quotes-regexp (regexp-opt comic-quotes))
(defvar comic-markup-regexp (regexp-opt comic-markup))
;; (defvar comic-italic "<\\(i\\|I\\)>\\(.*?\\)</\\(i\\|I\\)>")
;; (defvar comic-bold "<\\(b\\|B\\)>\\(.*?\\)</\\(b\\|B\\)>")
(defvar comic-italic "<\\(i\\|I\\)>\\(.*?\\)</\\1>")
(defvar comic-bold "<\\(b\\|B\\)>\\(.*?\\)</\\1>")
(defvar comic-image-regexp (regexp-opt comic-image))

;; Order is important here - a word will be matched once and then wont be available for other modes
(setq comicboard-font-lock-keywords
      `(
	(,comic-quotes-regexp . font-lock-type-face)
	(,comic-markup-regexp . font-lock-constant-face)
	(,comic-bold 2 'bold)
	(,comic-italic 2 'italic)
	(,comic-image-regexp . font-lock-function-name-face)
	))

(define-derived-mode comicboard-mode fundamental-mode
  "Comicboards mode"
  "Major mode for editing posts destined to be published on Alvaros boards at comicboards.com"
  ;; code for syntax highlighting
  (setq font-lock-defaults '(comicboard-font-lock-keywords))
)
;;----------------------------------------


;;----------------------------------------
;; Comicvine mode
;; - Cant get it to highlight everything within 
;;   blockquotes though...
(setq vine-block '("<blockquote>" "</blockquote>"))
(setq vine-block-regexp (regexp-opt vine-block))
(setq vine-in-block "<blockquote>\\(.\\|\n\\)*?</blockquote>")
(setq vine-generic-tag "<.*?>")
(setq vine-string "\"\\(.\\|\n\\)*?\"")
(setq vine-username "<strong>\\(.*?\\)</strong>")

(setq vine-font-lock-keywords
      `(
	(,vine-block-regexp . font-lock-constant-face)
	(,vine-in-block . font-lock-comment-face)
	(,vine-string . font-lock-string-face)
	(,vine-username . font-lock-warning-face)
	(,vine-generic-tag . font-lock-doc-face)
	))
(define-derived-mode vine-mode html-mode
  "ComicVine mode"
  "Major mode for editing posts destined to be published on Comicvine"
  ;; code for syntax highlighting
  (make-face 'username-font)
  (set-face-attribute 'username-font nil :weight 'bold :foreground "red")
  (font-lock-add-keywords nil 
  			  `(
			    ("<.*?blockquote>" . font-lock-warning-face)
			    (,vine-username 1 'username-font)
			    ;; ("^\\s *def\\s +\\([^( ]+\\)" 1 font-lock-function-name-face)
;; 
  			    ))
  ;; (setq font-lock-defaults '(vine-font-lock-keywords))
  )
;;----------------------------------------


;;----------------------------------------
;; Doing a mode from scratch
;; Example from
;; http://ergoemacs.org/emacs/elisp_menu_for_major_mode.html

;; First make a local keymap

;; define a var for your keymap, so that you can set it as local map
;; (meaning, active only when your mode is on)
(defvar xlsl-mode-map nil "Keymap for xlsl-mode")
;; definition for your keybinding and menu
(when (not xlsl-mode-map) ; if it is not already defined
  ;; assign command to keys
  (setq xlsl-mode-map (make-sparse-keymap))
  (define-key xlsl-mode-map (kbd "C-c C-c") 'xlsl-copy-all)
  (define-key xlsl-mode-map (kbd "C-c C-l") 'xlsl-syntax-check)
  (define-key xlsl-mode-map (kbd "C-c C-r") 'xlsl-lookup-lsl-ref)
  (define-key xlsl-mode-map (kbd "C-c C-g") 'xlsl-convert-rgb)
  ;; … more here …
  (define-key xlsl-mode-map [remap comment-dwim] 'xlsl-comment-dwim)
   ; above: make your comment command “xlsl-comment-dwim” use the current key for “comment-dwim” (because user may have changed the key for “comment-dwim”)

  ;; define your menu
  (define-key xlsl-mode-map [menu-bar] (make-sparse-keymap))
  (let ((menuMap (make-sparse-keymap "LSL")))
    (define-key xlsl-mode-map [menu-bar xlsl] (cons "LSL" menuMap))
    (define-key menuMap [about]
      '("About xlsl-mode" . xlsl-about))
    (define-key menuMap [customize]
      '("Customize xlsl-mode" . xlsl-customize))
    (define-key menuMap [separator]
      '("--"))
    (define-key menuMap [convert-rgb]
      '("Convert #rrggbb under cursor" . xlsl-convert-rgb))
    (define-key menuMap [copy-all]
      '("Copy whole buffer content" . xlsl-copy-all))
    (define-key menuMap [syntax-check]
      '("Check syntax" . xlsl-syntax-check))
    (define-key menuMap [lookup-onlne-doc]
      '("Lookup ref of word under cursor" . xlsl-lookup-lsl-ref))))


(defun xlsl-mode ()
  "Major mode for editing LSL (Linden Scripting Language)"
  (interactive)
  (kill-all-local-variables)

  (setq major-mode 'xlsl-mode)
  (setq mode-name "LSL") ; for display purposes in mode line
  (use-local-map xlsl-mode-map)

  ;; … other code here

  ;; Major modes should use run-mode-hooks rather than run-hooks
  (run-mode-hooks 'xlsl-mode-hook))
;;----------------------------------------



