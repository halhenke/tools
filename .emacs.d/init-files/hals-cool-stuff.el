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


