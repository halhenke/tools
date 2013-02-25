;;; kill-dead-buffs.el -- Interactively prompt to kill any buffers that don't have associated files

;; Author:   Hal Henke <halhenke@gmail.com>
;; Version:  0.1

(defun kill-dead-buffs ()
  (interactive)
  (let ((conflicts  '())
        (orphans    '())
        (reverts    '())
        (report-buf (get-buffer-create "*kill-dead-buffs*")))

    ;; Process the buffers.
    (mapcar (function
             (lambda (buf)
	       (let ((file-name (buffer-file-name buf)))
                 (cond
                  ;; If buf is the report buf, ignore it.
                  ((eq buf report-buf) nil)
                  ;; If buf is not a file buf, ignore it.
                  ((not file-name) nil)
                  ;; If buf file doesn't exist, buf is an orphan - prompt to delete it.
                  ((not (file-exists-p file-name))
		   ;; switch to buffer
		   ;; ido-switch-buffer or set-buffer ?
		   (set-buffer buf)
		   ;; prompt for kill
		   ;; if yes kill, if no keep going
		   ;; Should also give kill-all-prompt (!)
		   ;; and quit (q)
		   )))))
                   ;; (setq orphans (nconc orphans (list buf))))
                  ;; If file modified since buf visit, buf is either a conflict (if it's modified) or we should revert it.
                  ;; ((not (verify-visited-file-modtime buf))
                  ;;  (if (buffer-modified-p buf)
                  ;;      (setq conflicts (nconc conflicts (list buf)))
                  ;;    (save-excursion
                  ;;      (set-buffer buf)
                  ;;      (revert-buffer t t))
                  ;;    (setq reverts (nconc reverts (list buf)))))))))
            (copy-sequence (buffer-list)))

    ))
