;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Applescript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun activate-finder ()
  (interactive)
  (shell-command-to-string
    "osascript -e 'tell application \"Finder\" to activate'"))