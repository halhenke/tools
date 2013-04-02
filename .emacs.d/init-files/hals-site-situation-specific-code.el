;; ============================================================
;; Mostly functions that might only be useful in a particular environment
;; - more specific than just an OS thing
 ;; - and not cool enough for hals-cool-stuff ;-)
;; ============================================================

(provide 'hals-site-situation-specific-code)

;; Following is of course only useful in a very specific place 
(defun bridge-magit-init ()
  "Upon initialization should create a new frame iin the appropriate directory and setup magit"
  (interactive)
  (progn
    (make-frame-command)
    ;; May later want to maximize frame here - prob easiet using the "frame-cmds.el" library
    (cd "~/bridge")
    (magit-status (pwd))
    )
)
;; Seriously though I better discuss this with my agent. He will want his 10% cut of 
