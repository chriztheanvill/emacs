
;; (setq mode-line-format
;;   (list " ||-"
;;    'mode-line-mule-info
;;    'mode-line-modified
;;    " - "
;;    'mode-line-frame-identification
;;    ;; 'mode-line-buffer-identification   
;;    "%b  --  "
;;    ;; Note that this is evaluated while making the list.
;;    ;; It makes a mode line construct which is just a string.
;;    (getenv "HOST")
;;    ": "
;;    'default-directory
;;    "   "
;;    'global-mode-string
;;    "   %[("
;;    '(:eval (format-time-string "%F"))
;;    'mode-line-process
;;    ;;'minor-mode-alist
;;    "%n"
;;    ")%]--"
;;    '(which-function-mode ("" which-func-format "--"))
;;    '(line-number-mode "L%l")
;;    "  "
;;    '(column-number-mode "C%c")
;;    "  "
;;    '(-3 "%p"))
;;   )


 ;; (setq mode-line-format
 ;;          (list
 ;;           ;; value of `mode-name'
 ;;           "%m: "
 ;;           'mode-line-mule-info
 ;; 		   'mode-line-modified
 ;;           " %b - "
 ;; 		   ;; 'default-directory
 ;; 		   "   "
 ;; 		   'global-mode-string
 ;; 		   "   %[("
 ;; 		   '(:eval (format-time-string "%F"))
 ;; 		   'mode-line-process
 ;; 		   ;;'minor-mode-alist
 ;; 		   "%n"
 ;; 		   ")%]--"
 ;; 		   '(which-function-mode ("" which-func-format "--"))
 ;;           ;; value of current line number
 ;; 		   ;; '(column-number-mode " %C")
 ;;           " line %l "
 ;;           ;; " -- user: "
 ;; 		   " -- %p"
 ;;           ;; value of user
 ;;           ;; (getenv "USER")
 ;; 		   ))


;; ;;;;;;;;;;;;;;;;; Themes ;;;;;;;;;;;;;;;;; ;;

;;; Code:
(load-theme 'darkokai t )
;; (load-theme 'monokai-pro t )
;;(load-theme 'atom-dark t)
;;(load-theme 'danneskjold t)

;;(load-theme 'monokai-alt t)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/themes")
;; (setq sml/no-confirm-load-theme t)

;; ;;;;;;;;;;;;;;;; Set default font ;;;;;;;;;;;;;;;;;;; ;;
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 120
                    :weight 'normal
                    :width 'normal)

;; (global-ligature-mode 't)

;; ;;;;;;;;;;;;;;;;; System ;;;;;;;;;;;;;;;;; ;;

;;
;; ;; Dired
(setq dired-listing-switches "-aBhvl  --group-directories-first")

;; Copy Paste ;;
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

;;
;; Copy and Paste.
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;;
;; Cursor color
;;(setq-default cursor-type 'bar) 
;;(set-cursor-color "#ffffff")
(global-hl-line-mode +1)
(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'package-menu-mode-hook 'hl-line-mode)
(add-hook 'buffer-menu-mode-hook 'hl-line-mode)

;;
;; Size Font X
;(set-face-attribute 'default nil :height 90)

;;
;; Mouse
(xterm-mouse-mode 1)

;;
;; Max lisp eval depth
;; (setq max-lisp-eval-depth 10000)

;;
;; Specpdl size
;; (setq max-specpdl-size 1000)  ; default is 1000, reduce the backtrace level
;; (setq debug-on-error t)    ; now you should get a backtrace

;;(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;;    (setq exec-path (append exec-path '("/usr/local/bin")))

;; Font lock
;;(global-font-lock-mode 0)
(global-font-lock-mode 1)

;;
;; Keys
;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
;; (global-unset-key [(control /)])
(global-unset-key [(control x)(control z)])

;; ;; Windows Style Undo
(global-set-key [(control z)] 'undo)
;;(global-set-key (kbd "C-Z") 'redo)

(global-set-key [(control \\)] 'sp-forward-sexp)
(global-set-key (kbd "C-M-\\") 'sp-backward-sexp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Duplicate lines
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-S-d") 'duplicate-line)

;; ;; avoid bug
;; (global-set-key (kbd "<delete>") 'delete-char)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Comment
(defun xah-comment-dwim ()
  "Like `comment-dwim', but toggle comment if cursor is not at end of line.

URL `http://ergoemacs.org/emacs/emacs_toggle_comment_by_line.html'
Version 2016-10-25"
  (interactive)
  (if (region-active-p)
      (comment-dwim nil)
    (let (($lbp (line-beginning-position))
          ($lep (line-end-position)))
      (if (eq $lbp $lep)
          (progn
            (comment-dwim nil))
        (if (eq (point) $lep)
            (progn
              (comment-dwim nil))
          (progn
            (comment-or-uncomment-region $lbp $lep)
            (forward-line )))))))

(global-set-key (kbd "M-;") 'xah-comment-dwim)
(global-set-key (kbd "C-M-;") 'comment-box)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Move lines
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Save cursor
(save-place-mode 1)

;; ;; Save format
(add-hook 'before-save-hook 'lsp-format-buffer)

;; ;;;;;;;;;;;;;;;;; SHOW ;;;;;;;;;;;;;;;;; ;;
;;
;; Menu
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar -1)
;;(global-set-key [(control c) r] 'revert-buffer)

;; Line numbers
(global-linum-mode t)
;;(setq linum-format "%d   ")
(setq linum-format "%4d \u2502 ")
;; (column-number-mode 1)

;;
;; Whitespace
(require 'whitespace)
;; (setq whitespace-style '(newline space-mark tab-mark ))
;; (setq whitespace-style '( space-mark tab-mark ))

;; (whitespace-mode 1)
(global-whitespace-mode 1) ;; this


; (setq whitespace-display-mappings
 ;	  '(
 		;;(space-mark 32 [183] [46]) ; normal space
		;(space-mark 32 [183] [95]) ; normal space
 		;(space-mark 160 [164] [95])
 		;(space-mark 2208 [2212] [95])
 		;(space-mark 2336 [2340] [95])
 		;(space-mark 3616 [3620] [95])
 		;;(space-mark 3872 [3876] [95])
 		;;(newline-mark 10 [182 10]) ; newlne
;		(tab-mark 9 [9655 9] [92 9]) ; tab
; 		))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;

(setq whitespace-style (quote
( spaces tabs newline space-mark tab-mark newline-mark)))

(setq whitespace-display-mappings
      '(
 	(space-mark   ?\     [? ]) ;;;use space not dotimes
 	(space-mark   ?\xA0  [?\u00A4]     [?_])
 	(space-mark   ?\x8A0 [?\x8A4]      [?_])
 	(space-mark   ?\x920 [?\x924]      [?_])
 	(space-mark   ?\xE20 [?\xE24]      [?_])
 	(space-mark   ?\xF20 [?\xF24]      [?_])
 	;; (newline-mark ?\n    [? ?\n]) ;; No muestra bien los cuadros de dialogo
 	;; (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])
	;; (tab-mark 9 [9654 9] [92 9]) ; tab arrow
	;; (tab-mark 9 [9619 9] [92 9]) ; tab bar middle white
	;; (tab-mark 9 [9618 9] [92 9]) ; tab bar middle gray
	;; (tab-mark 9 [9617 9] [92 9]) ; tab bar middle dark gray
	;; (tab-mark 9 [9616 9] [92 9]) ; tab bar thin white gray
	(tab-mark 9 [9615 9] [92 9]) ; tab bar thin dark gray
	;; (tab-mark 9 [9647 9] [92 9]) ; tab
	))

;;;; 

;; 4 char wide for TAB
(setq tab-width 4)
;; (setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(global-set-key (kbd "RET") 'newline-and-indent)

;;
;; use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)

;;
;; when cursor is on edge, move to the other side, as in a torus space
(setq windmove-wrap-around t )

;; Disable welcome screen
;; (setq inhibit-startup-message t)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
;; (setq initial-buffer-choice "/media/kik1n/Bomb/Cris/Documentos/")


;;; Ignorar determinados buffers.
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
			   "*Messages*" "Async Shell Command" 
			   "*tramp*"))

;;
;; Auto-insert-mode
(auto-insert-mode)

;; Keep buffers automatically up to date
(global-auto-revert-mode t)

;;
;; (global-so-long-mode 1)
(global-so-long-mode -1)
(setq so-long-file-local-mode-function 'so-long-inhibit)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Markdown
;; (markdown-display-inline-images)

(provide 'Emacs_System)
;;; Emacs_System.el ends here
