;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Generic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-font-lock-mode 1) ;for all buffers
(tool-bar-mode nil)
(show-paren-mode t) ;will highlight matching parentheses next to cursor.
(icy-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'org-mode-hook
          #'(lambda ()
              (setq yas/fallback-behavior
                    `(apply ,(lookup-key org-mode-map [tab])))
              (local-set-key [tab] 'yas/expand)))
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only

;; add hooks for modes you want to use the tab completion for:
(add-hook 'c-mode-hook          'my-tab-fix)
(add-hook 'sh-mode-hook         'my-tab-fix)
(add-hook 'emacs-lisp-mode-hook 'my-tab-fix)
(add-hook 'clojure-mode-hook    'my-tab-fix)

; set up paredit mode
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))

; turn on eldoc mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Yes-or-no prompt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p) ;will allow you to type just "y" instead of "yes" when you exit.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Split window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(split-window-horizontally)      ;; want two windows at startup 
(enlarge-window-horizontally 20) ;; after split, make left side larger
(setq w (other-window 1))        ;; move to other window

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/site-lisp/yasnippet-0.6.0c/snippets") - WINDOWS
;(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets") - MAC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only

;;_ + add org-remember
(org-remember-insinuate)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Emacs tab completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))
 
(defun my-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left3")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-source-path (quote ("c:/usr/home/.emacs.d" "c:/usr/home/.emacs.d/site-lisp" "c:/usr/home/clojure-files" "c:/usr/home/org" "C:/CES/Applications/XMART/Conversion/xDoc" "C:/Documents and Settings/mikesmi/Desktop/Working Folder/XmlSawgCPlusPlus" "C:/Program Files/Quadralay")))
 '(lj-compose-init-body-hook nil)
 '(lj-compose-pre-prepare-body-hook nil)
 '(lj-default-username "codemangler"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_ + Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t) ;don't show the startup message
(setq next-line-add-newlines nil) ;disallow new lines when pressing "arrow-down key" at end of the buffer.
(setq show-paren-mode t) ;highlight matching parentheses
(setq default-frame-alist (append (list 
  '(width  . 165)  ; Width set to 100 characters 
  '(height . 55)) ; Height set to 80 lines 
   default-frame-alist))
(setq org-todo-keyword-faces (quote ( ;to-do keywords/colors
  ("TODO" :foreground "red" :weight bold)
  ("OPEN" :foreground "blue" :weight bold)
  ("INPROGRESS" :foreground "green" :weight bold)
  ("WAITING" :foreground "yellow" :weight bold)
  ("RESOLVED" :foreground "orange" :weight bold)
  ("CLOSED" :foreground "red" :weight bold))))  
(setq org-agenda-custom-commands ;org-mode agenda view
  '(("a" "My custom agenda"
    ((org-agenda-list nil nil 1)
     (tags "PROJECT-WAITING")
     (tags-todo "WAITING")
     (tags-todo "-MAYBE")))))
(setq org-remember-templates
  '((?t "* TODO %?\n  %i\n" "~/org/notes.org" "Inbox")
    (?b "* BUG %^{ID}\n %^{Title}  :TITLE: \n  %i\n" "~/org/cases.org" "Inbox")
    (?j "* %U %?\n\n  %i\n" "~/org/journal.org" "Journal Entries")
    (?i "* %^{Title}\n  %i\n" "~/org/journal.org" "Info")))
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
