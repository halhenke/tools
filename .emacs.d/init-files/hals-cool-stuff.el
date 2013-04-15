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
(defun my-isearch-word-at-point ()
  (interactive)
  (call-interactively 'isearch-forward-regexp))

(defun my-isearch-yank-word-hook ()
  (when (equal this-command 'my-isearch-word-at-point)
    (let ((string (concat "\\<"
                          (buffer-substring-no-properties
                           (progn (skip-syntax-backward "w_") (point))
                           (progn (skip-syntax-forward "w_") (point)))
                          "\\>")))
      (if (and isearch-case-fold-search
               (eq 'not-yanks search-upper-case))
          (setq string (downcase string)))
      (setq isearch-string string
            isearch-message
            (concat isearch-message
                    (mapconcat 'isearch-text-char-description
                               string ""))
            isearch-yank-flag t)
      (isearch-search-and-update))))

(add-hook 'isearch-mode-hook 'my-isearch-yank-word-hook)
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

isearch-string
#("isearch-forward-at-pointnil" 0 24 (face font-lock-function-name-face fontified t))
