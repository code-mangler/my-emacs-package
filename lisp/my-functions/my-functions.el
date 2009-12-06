;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + My functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun llt ()
   (interactive)
   "Toggle longlines mode on"
   (longlines-mode 1))

(defun llf ()
   (interactive)
   "Toggle longlines mode off"
   (longlines-mode -1))

(defun my-make-directory-yes-or-no (dir)
  "Ask user to create the DIR, if it does not already exist."
  (if dir
      (if (not (file-directory-p dir))
          (if (yes-or-no-p (concat "The directory `" dir
                                   "' does not exist currently. Create it? "))
              (make-directory dir t)
            (error
             (concat "Cannot continue without directory `" dir "'"))))
    (error "my-make-directory-yes-or-no: missing operand")))

(defun my-file-executable-p (file)
  "Make sure the file FILE exists and is executable."
  (if file
      (if (file-executable-p file)
          file
        (message "Can't find `%s'" file)
        ;; sleep 3 s so that you can read the warning
        (sit-for 3))
    (error "my-file-executable-p: missing operand")))

;; attempt to load a feature/library, failing silently
(defun try-require (feature)
  "Attempt to load a library or module. Return true if the
library given as argument is successfully loaded. If not, instead
of an error, just add the package to a list of missing packages."
  (condition-case err
      ;; protected form
      (progn
        (message "Checking for library `%s'..." feature)
        (if (stringp feature)
            (load-library feature)
          (require feature))
        (message "Checking for library `%s'... Found" feature))
    ;; error handler
    (file-error  ; condition
     (progn
       (message "Checking for library `%s'... Missing" feature)
       (add-to-list 'missing-packages-list feature))
     nil)))


