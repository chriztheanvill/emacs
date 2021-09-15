
;; 
;; ;; ## Alias
;; alias emacs="emacs -nw"
;; alias emacsd="emacs --daemon"
;; alias emacsdf="emacs --fg-daemon"
;; alias emacsdd="emacsclient -e \"(kill-emacs)\"" ## Kill-current daemon
;; alias emacst="emacsclient -t"
;; alias emacsg="emacsclient -c"

;;
;; ;; Daemon
;; emacs --daemon ;; Runs in the background
;; ;; Recommended when the pc starts
;;
;; emacs --fg-daemon ;; Runs and you can see all in the console
;; ;; Recommend after pc starts, then run the command
;;
;; ;; Revisar que daemon esta corriendo
;; C-h v
;; Eval: server-socket-dir
;;
;; ;; En ubuntu esta en /run/user/1000/emacs/
;;
;; ;; Correr otro daemon
;; ;; emacs --daemon=two
;;
;; ;; Kill Daemon
;; ;; emacsclient -e "(kill-emacs)" ;; Mata el daemon en uso
;; ;; emacsclient -e "(kill-emacs)" -s two ;; Mata el daemon two
;;
;; ;; After run the daemon
;; ;; emacsclient -t ;; console mode
;; ;; emacsclient -c ;; GUI mode
;;

;;
;; ;; Clean files
;; ~/.emacs.d/auto-save-list 
;; ~/.emacs.d/semanticdb 
;; ~/.emacs.d/.cache 
;; ~/.emacs.d/.lsp-session-v1
;; ~/.emacs.d/recentf
;; ~/.emacs.d/recentf~
;; ~/.emacs.d/.emacs_workgroups
;; ~/.emacs.d/.emacs_workgroups~
;;
;; ;; Sessions / Workspaces
;; ;; lsp Salva las secciones en ~/.emacs.d/.lsp-session-v1
;; ;; ;; Se puede alterar: lsp-save-vscode-workspace, editar ese archivo y cargarlo de nuevo. Esto edita tambien el archivo: .lsp-session-v1
;;
;; ;; dap solo detecta el lsp-session-v1.
;; ;; ;; Si no detecta el project root, verificar el .lsp-session-v1 a donde esta apuntando el project root.
;;
;;
;; ;; Clean Projectile
;;
;; ;; Tratar de limpiar de vez en cuando:
;;
;; projectile-purge-dir-from-cache
;;
;;


;;
;; ;; Shortcuts
;;
;; lsp
;; ;; lsp-describe-thing-at-point
;; ;; lsp-treemacs-type-hierarchy
;; ;; treemacs-errors-list
;; ;; helm-lsp-workspace-symbol
;; ;; xref-find-definitions(M-. and s-l g g)
;; ;; xref-find-references(s-l g r)
;;
;; treemacs
;; ;; Help ?
;; ;; Edit workspaces <f8> <up>
;; ;; Finish editing C-c C-c or C-c C-w
;; ;; Overlapping name use shift left or right
;; 
;; yas (Create snippet)
;; ;; dir ~/.emacs.d/snippets
;; ;; yas-new-snippet
;; ;; yas-visit-snippet-file
;; 
;; ivy-xref M-? usar Alt + Shift + ?
;; ;; 
;; 
;; ;; ;; Great shortcuts
;; ;; C-l ;; Center the line, Nove along the screen if you constantly press it
;; 
;; 
;; 
;; 
;; 
;; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Treat all themes as safe
(setq custom-safe-themes t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"])
 '(beacon-color "#ed0547ad8099")
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(darkokai))
 '(diff-hl-show-hunk-posframe-internal-border-color "#357535753575")
 '(evil-emacs-state-cursor '("#E57373" hbar))
 '(evil-insert-state-cursor '("#E57373" bar))
 '(evil-normal-state-cursor '("#FFEE58" box))
 '(evil-visual-state-cursor '("#C5E1A5" box))
 '(exwm-floating-border-color "#262626")
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   '("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80"))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
	 ("#679A01" . 20)
	 ("#4BBEAE" . 30)
	 ("#1DB4D0" . 50)
	 ("#9A8F21" . 60)
	 ("#A75B00" . 70)
	 ("#F309DF" . 85)
	 ("#3C3D37" . 100)))
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#8CD0D3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#7F9F7F"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#494949"))
 '(magit-diff-use-overlays nil)
 '(mlscroll-in-color "#56bc56bc56bc")
 '(mlscroll-out-color "#424242")
 '(modern-c++-font-lock-global-mode t)
 '(objed-cursor-color "#CC9393")
 '(org-agenda-files '("/media/cris/Panzer/Cris/Documents/org/Main.org"))
 '(package-selected-packages
   '(eldoc-overlay org treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil avy centaur-tabs company company-quickhelp company-quickhelp-terminal dap-mode flycheck flycheck-inline helm-lsp helm-swoop helm-xref highlight-indentation hydra iedit imenu-anywhere imenu-list indent-guide ivy lsp-mode lsp-treemacs lsp-ui markdown-preview-mode neotree powerline projectile quick-peek smartparens swiper treemacs use-package which-key yasnippet))
 '(pdf-view-midnight-colors (cons "#DCDCDC" "#3F3F3F"))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(rustic-ansi-faces
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCDC"])
 '(tabbar-background-color "#357535753575")
 '(tetris-x-colors
   [[229 192 123]
	[97 175 239]
	[209 154 102]
	[224 108 117]
	[152 195 121]
	[198 120 221]
	[86 182 194]])
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
	 (40 . "#CF4F1F")
	 (60 . "#C26C0F")
	 (80 . "#E6DB74")
	 (100 . "#AB8C00")
	 (120 . "#A18F00")
	 (140 . "#989200")
	 (160 . "#8E9500")
	 (180 . "#A6E22E")
	 (200 . "#729A1E")
	 (220 . "#609C3C")
	 (240 . "#4E9D5B")
	 (260 . "#3C9F79")
	 (280 . "#A1EFE4")
	 (300 . "#299BA6")
	 (320 . "#2896B5")
	 (340 . "#2790C3")
	 (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
;; ;; Check So

;; ;; To check C-x C-e at the end of the parenteses
;; ;; To check C-j at the end of the parenteses (The result will be set it after the parenteses)
(pcase system-type
  ('gnu/linux "It's Linux!")
  ('windows-nt "It's Windows!")
  ('cygwin "It's Windows-Cygwin!")
  ('darwin "It's MacOS!")
  ) ;; <==== set the cursor at the end of the parenteses and run C-x C-e

;; ;; Imprime si esta cargando un daemon (su nombre si tiene)
(if (daemonp)
	(message "Loading in the daemon!")
  (message "Loading in regular Emacs!")
	) ;; <==== set the cursor at the end of the parenteses and run C-x C-e

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
;; ;; Loading modular

;; ;; Emacs System
(load "~/.emacs.d/Emacs_System.el")

;; ;; Emacs Packages
(load "~/.emacs.d/Emacs_Packages.el")

;; ;; C++ Compile, Cmake
(load "~/.emacs.d/Emacs_Task_Cpp.el")

;; ;; C++ Skeletons
(load "~/.emacs.d/Emacs_Skeletons.el")

;; ;; Org
(load "~/.emacs.d/Emacs_Org.el")

;; ;; ;; Testing
;; (load "~/.emacs.d/Emacs_Testing_Package.el")

(provide '.emacs)
;;; .emacs ends here
