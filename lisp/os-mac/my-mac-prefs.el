;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq current-language-environment "UTF-8")

;;;;;;;;;;;;
;;_ + slime
;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load "slime" '(progn (slime-setup '(slime-repl))))
(slime-setup)
(setq slime-net-coding-system 'utf-8-unix)


