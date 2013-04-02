;; ======================================================================
;; This is where I am going to chuck some macros that have proven helpful more than once
;; Being macros they are not as reliable or foolproof as 'proper code' but may be useful in the future
;; ======================================================================

;; ----------------------------------------------------------------------
;; This is something I primarily used at JN solutions 
;; - would use it to take a list of pair of strings that I had 
;; copied and pasted from a Word Doc that came out in the format:
;; 2153
;; In Progress
;; 2891
;; Awaiting Specialist
;; to produce:
;; '2153' => 'In Progress',
;; '2891' => 'Awaiting Specialist',
;; This code will particularly have trouble with details strings that have single quotes in them 
;; or that end with a closing parenthesis - check these case
(fset 'code-def-pair-2-hash-entry
   (lambda (&optional arg) 
     "Keyboard macro." 
     (interactive "p") 
     (kmacro-exec-ring-item 
      (quote 
       ([s-left M-right M-left 39 M-right 39 32 61 62 down s-left M-right M-left 39 s-right M-left M-right 39 44 s-left backspace 32 tab down] 0 "%d")) arg)))
;; ----------------------------------------------------------------------
