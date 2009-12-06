;;_ + Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; remap alt-m to ctrl-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

; remap ctrl-w to backward-delete word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

; org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cr" 'org-remember)

; ibuffer mode
;(global-set-key "\C-x\C-b") 'ibuffer-other-window)
