;; SLIME setup:
 (add-to-list 'load-path "~/.emacs.d/slime")
 (add-to-list 'load-path "~/.emacs.d/slime/contrib")
 ;;(add-to-list ‘load-path "~/.emacs.d/slime")
 ;;(add-to-list ‘load-path "~/.emacs.d/slime/contrib")
 (setq slime-backend "~/.emacs.d/slime/swank-loader.lisp")
 (load "slime-autoloads")
 (require ‘slime)
 (require ‘slime-autoloads)
 (eval-after-load "slime"
 `(progn
 (slime-setup ‘(slime-repl))
 (custom-set-variables
 ‘(inhibit-splash-screen t)
 ‘(slime-complete-symbol*-fancy t)
 ‘(slime-complete-symbol-function ‘slime-fuzzy-complete-symbol)
 ‘(slime-net-coding-system ‘utf-8-unix)
 ‘(slime-startup-animation nil)
;; ‘(slime-lisp-implementations ‘((sbcl ("/Users/user/bin/sbcl"))))))) 
;;‘(slime-lisp-implementations ‘((sbcl ("/opt/local/var/macports/sources/rsync.macports.org/release/ports/lang"))))))) 
‘(slime-lisp-implementations ‘((sbcl ("/usr/local/bin/sbcl")))))))
 ;; Stop SLIME’s REPL from grabbing DEL,
 ;; which is annoying when backspacing over a ‘(‘
 (defun override-slime-repl-bindings-with-paredit ()
 (define-key slime-repl-mode-map
 (read-kbd-macro paredit-backward-delete-key) nil))
 (add-hook ‘slime-repl-mode-hook ‘override-slime-repl-bindings-with-paredit)
 ;; User’s stuff:
 (zenburn)
 (slime)
