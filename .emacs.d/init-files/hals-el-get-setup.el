;=================================================
; EL_GET RELATED BINDINGS, COMMANDS, AND SETTINGS
;=================================================
;; This is where stuff goes related to customizing and using el-get.
;; In particular this is where el-get-sources is defined
(provide 'hals-el-get-setup)

;----------------------------------------------------------------------
; - RECIPES
;   Chuck this stuff in its own directory eventually
;----------------------------------------------------------------------
;; Attempting to create recipes for my stuff - either set el-get-sources or in recipe directory...i think
;; Might be able to set arbitrary list name if you explicitly call it with el-get....Cant remember
(setq 
 el-get-sources 
 '(
   (:name evernote-mode
	  :description "Mode for the editing of evernote documents. 
This is a fork from the package available on package-management that requires Ruby 1.9.3 etc rather than Ruby 1.8.7
This needs something called gdbm 'sudo port install gdbm ruby' and you have to run a ruby script after installation i think..."
	  :type git
	  :url "https://github.com/rubbish/evernote-mode.git"
	  ;; either prepare or post-init
	  :post-init (setq evernote-ruby-command "/Users/Hal/.hals_macport_links/ruby") 
	  :features evernote-mode
	  )
   (:name rect-mark
	  :features rect-mark
	  ;; :autoloads ("rm-set-mark" "rm-kill-region" "rm-kill-ring-save" "rm-mouse-drag-region")
	  )
   (:name rtf-mode
	  :features rtf-mode
	  )
   ;; ..................................................
   ;; rails-el
   ;; ..................................................
   (:name rails-el
	  ;; :depends ruby-electric ;; (inf-ruby)
	  ;; The package requires these packages but some will be built-in (speedbar inf-ruby ruby-mode ruby-electric)
	  )
   ;; (:name ruby-electric
   ;; 	  :submodule nil
   ;; 	  )
   ;; ..................................................
   ;; skewer-mode
   ;; ..................................................
   (:name skewer-mode
	  :type git
	  :url "https://github.com/skeeto/skewer-mode"
	  :depends (emacs-http-server js2-mode)
	  ;; :depends (simple-httpd js2-mode)
	  :features skewer-mode
	  )
   ;; This is subbing in for simple-httpd which is temp unavailable on MELPA
   (:name emacs-http-server   
	  :type git
	  :url "https://github.com/skeeto/emacs-http-server"
	  :features simple-httpd
	  )
   ;; ..................................................
   ;; jquery-doc - problems with load-path and the dependents receipes were outdated
   ;; ..................................................
   (:name popup 
       :description "Visual Popup Interface Library for Emacs" 
       :url "https://github.com/auto-complete/popup-el" 
       :type git)
   (:name auto-complete
	  :description "The most intelligent auto-completion extension." 
	  :url "https://github.com/auto-complete/auto-complete" 
	  :type git 
	  :depends (popup fuzzy))
   (:name jquery-doc 
	  :load-path "."
	  )
   ;; ..................................................
   ;;   (:name alt-font-menu
   ;;	  :before (defalias 'x-font-family-list 'font-family-list)
   ;;	  :features alt-font-menu
   ;;	  )
   ;; (:name haml-mode
   ;; 	  :after (add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
   ;; 	  )
   ;; (:name haml-mode   
   ;; 	  :type elpa
   ;; 	  )
   ;; ..................................................
   ;; workgroups - maybe do here or in main file after el-get installation
   (:name workgroups
	  :after (wg-load "~/.emacs.d/workgroups/initial-wg")
	  (workgroups-mode 1)
	  )
   ;; ..................................................
   ))

;; list all installed packages   
;; (el-get-list-package-names-with-status "installed")

 ;; Make a list of all packages we want to install apart from el-get-sources
(setq my-el-get-packages  
     (append  
      ;; Some of the below (magit slime) require "apt-get install texinfo" to compile on linux
     ;; '(el-get evernote-mode magit rails-el re-builder+ rect-mark regex-tool slime sr-speedbar workgroups)
     '(evernote-mode magit rails-el re-builder+ rect-mark regex-tool slime sr-speedbar workgroups)
      (mapcar 'el-get-source-name el-get-sources)))  
;; Check our packages are installed and initialized properly
;; syn/asyn determines if its a synchronous operation or not
(el-get 'sync my-el-get-packages)
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;; Duplicate recipes?
;; (el-get-duplicates (el-get-read-all-recipes
;; 		    (el-get-as-string (plist-get package :name))))
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;; Install an ELPA package from a local archive/directory and then 
;; forget that local archive
(defun package-let (package archive)
  "Install a package using the specified archive."
  (let ((package-archives
         (cons (cons "archive" archive)
               package-archives)))
    (package-refresh-contents)
    (package-install
     (if (stringp package)
         (intern package)
       package)))
  (package-refresh-contents))

;; An example of it’s use:
;; (package-let 'kv "~/teamchat.net/shoesoff-elpa")
;;----------------------------------------------------------------------

