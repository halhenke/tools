;; ============================================================
;; Just a file to have some cool functions
;; - probaby gotten from the internet
;; ============================================================

(provide 'hals-cool-stuff)

;; Apparently can be used to highlight text and will then google it automagically!
(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))


;; ----------------------------------------------------------------------
;; From SO - to add search for word/text at point
;; http://stackoverflow.com/a/590915/935470
;; ----------------------------------------------------------------------
;; Problems
;; - only worked when called as my-isearch-word-at-point from command line
;; - Worked on an ordinary word but when i put it over: 
;;   def bind_adhoc_data(params)
;; it fails with:
;;   isearch-search-and-update: Wrong type argument: arrayp, nil 
;; even failed as: 
;;   def 
;; bind_adhoc_data 
;; (params)
;; ----------------------------------------------------------------------
;; THIS DOESNT WORK WITHOUT FURHTER DEBUGGING
;; ----------------------------------------------------------------------
;; (defun my-isearch-word-at-point ()
;;   (interactive)
;;   (call-interactively 'isearch-forward-regexp))

;; (defun my-isearch-yank-word-hook ()
;;   (when (equal this-command 'my-isearch-word-at-point)
;;     (let ((string (concat "\\<"
;;                           (buffer-substring-no-properties
;;                            (progn (skip-syntax-backward "w_") (point))
;;                            (progn (skip-syntax-forward "w_") (point)))
;;                           "\\>")))
;;       (if (and isearch-case-fold-search
;;                (eq 'not-yanks search-upper-case))
;;           (setq string (downcase string)))
;;       (setq isearch-string string
;;             isearch-message
;;             (concat isearch-message
;;                     (mapconcat 'isearch-text-char-description
;;                                string ""))
;;             isearch-yank-flag t)
;;       (isearch-search-and-update))))
;; (add-hook 'isearch-mode-hook 'my-isearch-yank-word-hook)
;; ----------------------------------------------------------------------
;; Mucking around - trying to find out why it isnt working....

;; (defun test-stuff ()
;;   (interactive)
;;   (let ((string (concat "\\<"
;; 			(buffer-substring-no-properties
;; 			 (progn (skip-syntax-backward "w_") (point))
;; 			 (progn (skip-syntax-forward "w_") (point)))
;; 			"\\>")))
;;     (print string)
;;     ))

;; (defun test-rest (string)
;;   (interactive)
;;   (if (and isearch-case-fold-search
;; 	   (eq 'not-yanks search-upper-case))
;;       (setq string (downcase string)))
;;   (setq isearch-string string
;; 	isearch-message
;; 	(concat isearch-message
;; 		(mapconcat 'isearch-text-char-description
;; 			   string ""))
;; 	isearch-yank-flag t)
;;   (isearch-search-and-update))

;; ----------------------------------------------------------------------
;; Alternative implementation from emacswiki
;; http://www.emacswiki.org/emacs/SearchAtPoint
;; ----------------------------------------------------------------------
;; I-search with initial contents
(defvar isearch-initial-string nil)
(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))
(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
	   (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
	  (isearch-forward regexp-p no-recursive-edit)
	(setq isearch-initial-string (buffer-substring begin end))
	(add-hook 'isearch-mode-hook 'isearch-set-initial-string)
	(isearch-forward regexp-p no-recursive-edit)))))
(global-set-key (kbd "s-f") 'isearch-forward-at-point)


;; ----------------------------------------------------------------------
;; Not that cool - but useful - byte recompile our main directory of elisp code
;; ----------------------------------------------------------------------
(defun byte-compile-my-shit ()
  "Will recompile files in emacs init directory - set to ask what to do
if file is not previously compiled."
  (interactive)
  (byte-recompile-directory "~/.emacs.d/init-files" 'ask))
;; ----------------------------------------------------------------------

;; ----------------------------------------------------------------------
;; My own method to store and restore the entire frame configuration 
;; between shutdown and reopening of emacs
;; ----------------------------------------------------------------------
(defvar stored-frame-config-path "~/.emacs.d/stored-frames"
  "This variable indicates the file in which functions such as store-current-frame-config will store and read the current state of emacs frames, windows and buffers")
(defun store-current-frame-config ()
  "Will write the current emacs frame/window/buffer setup to a file"
  (interactive)
  (let ((current-frames (current-frame-configuration)))
    (if stored-frame-config-path
	;; Create file if it doesnt previously exist
	(progn
	  (if (not (file-exists-p stored-frame-config-path))
	      (shell-command (concat "touch " stored-frame-config-path)))
	  (with-temp-file stored-frame-config-path (insert (format "%s" current-frames))))
      (print "stored-frame-config-path is not set - frame configuration has not been saved..."))))
(defun restore-previous-frame-config ()
  "Will restore a previously saved emacs frame/window/buffer setup from a file"
  (interactive)
  (if (file-exists-p stored-frame-config-path)
      (let ((previous-frames 
	     (with-temp-buffer 
	       (insert-file-contents stored-frame-config-path)
	      (buffer-string))))
	;; (print (concat "Hey bo: " previous-frames))
	(set-frame-configuration (read-from-string previous-frames)))))
;; Meh - 
;; set-frame-configuration: Invalid read syntax: "#"
;; ----------------------------------------------------------------------

;; ----------------------------------------------------------------------
;; Making a popup menu
;; ----------------------------------------------------------------------
;; Doesnt work yet
;; (x-popup-menu '((10 10) (selected-window)) '("Bad idea" ("Dig". 1) ("Dog" . 2)))
;; Does work
;; (x-popup-menu t '("Bad idea" ("t1" ("Dig". 1)) ("t2" ("Dog" . 2))))
;; ----------------------------------------------------------------------
