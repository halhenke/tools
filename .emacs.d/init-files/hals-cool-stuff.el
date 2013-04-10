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
;;         (if (and isearch-case-fold-search
;;                (eq 'not-yanks search-upper-case))
;;           (setq string (downcase string)))
;;       (setq isearch-string string
;;             isearch-message
;;             (concat isearch-message
;;                     (mapconcat 'isearch-text-char-description
;;                                string ""))
;;             isearch-yank-flag t)
;;       (isearch-search-and-update))

;; The_end_of_days

;; def apple_enterprises("Open for business")

;; def bind_adhoc_data(params)

;; (test-rest "The_end_of_days")
;; (test-rest "\\<bind_adhoc_data\\>")


