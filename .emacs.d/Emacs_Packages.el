;; 
;; Despues de instalar
;; M-x all-the-icons-install-fonts
;; M-x dap-cpptools-setup
;;
;;
;;
;;
;; 
;; 
;; ;;;;;;;;;;;;;;;;; PACKAGES ;;;;;;;;;;;;;;;;; ;;
;; ;;;;;;;;;;;;;;;;; C++ ;;;;;;;;;;;;;;;;; ;;
(require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq package-archives '(
                         ("gnu" . "http://elpa.gnu.org/packages/")
			             ;;("marmalade" . "https://marmalade-repo.org/packages/")
			             ;;("milkmelpa" . "http://melpa.milkbox.net/packages/")
			             ;;("stablemelpa" . "http://stable.melpa.org/packages/")
			             ("melpa" . "https://melpa.org/packages/")
			             ("org" . "http://orgmode.org/elpa/")
			             ;;("melpa" . "http://melpa.org/packages/")
                         ))

(package-initialize)

(setq package-selected-packages '(
								  ;; Themes
								  ;; apropospriate-theme ;; horrible
								  atom-one-dark-theme ;; bien
								  ;; brutal-theme ;;horrible
								  ;; danneskjold-theme
								  darkokai-theme ;; El mejor, muestra mejor los errores
								  ;; darktooth-theme
								  doom-themes ;; muy variado, muy bueno
								  ;; dracula-themes
								  ;; flucui-themes
								  material-theme
								  monokai-pro-theme
								  monokai-theme

								  ;; Packages
								  avy 
								  all-the-icons
								  all-the-icons-dired
								  all-the-icons-ibuffer
								  all-the-icons-ivy-rich
								  ;; ccls
								  centaur-tabs
								  ;; cmake-ide
								  cmake-mode
								  ;; cmake-project
								  company
								  company-box
								  company-posframe
								  company-prescient
								  company-quickhelp
								  company-quickhelp-terminal
								  counsel
								  counsel-projectile
								  ;; consult
								  ;; consult-dir
								  ;; consult-flycheck
								  ;; consult-lsp
								  dashboard
								  dashboard-ls
								  dap-mode
								  default-font-presets
								  doom-modeline
								  eldoc-box
								  ;;eldoc-overlay
								  flycheck 
								  flycheck-inline
								  flycheck-posframe
								  fzf
								  ;; git-gutter ;; Orphan
								  ghub
								  helm-ag
								  helm-icons
								  helm-lsp
								  helm-ls-git
								  helm-projectile
								  helm-swoop
								  helm-xref 
								  highlight-indentation
								  ;; hl-block-mode
								  hl-todo
								  hydra 
								  iedit
								  imenu-anywhere
								  imenu-list
								  indent-guide
								  ivy
								  ivy-dired-history
								  ivy-file-preview
								  ivy-prescient
								  ivy-rich
								  ivy-todo
								  ivy-xref
								  lsp-ivy 
								  lsp-mode 
								  lsp-treemacs 
								  lsp-ui
								  ;;	math-preview ;; requires nodejs
								  magit
								  markdown-preview-mode
								  ;; modern-cpp-font-lock
								  multiple-cursors
								  ;; minimap <-- Heavy
								  neotree
								  ;; origami ;; Dicen que es lento
								  org-bullets
								  org-elp
								  org-roam
								  page-break-lines
								  ;; powerline
								  projectile
								  quick-peek
								  ;;	workgroups2 ;; Beta
								  selectrum
								  selectrum-prescient
								  ;; snails
								  smartparens
								  swiper
								  treemacs
								  treemacs-all-the-icons
								  treemacs-magit
								  ;; treemacs-perspective
								  use-package
								  undo-fu
								  ;; vimish-fold ;; ???? Basura
								  which-key 
								  yasnippet 
	))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Icons

(require 'all-the-icons)

;; ;; ;; For slow rendering
(setq inhibit-compacting-font-caches t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hl

(global-hl-todo-mode)
(setq hl-todo-keyword-faces
      '(
		("NOTE"   . "#008FFF")
		("TODO"   . "#00AFFF")
        ("FIXME"  . "#0FF000")
        ("ERROR"  . "#FF0000")
        ("DEBUG"  . "#A020F0")
        ("GOTCHA" . "#FF4500")
        ("STUB"   . "#1E90FF")
		))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dasboard

(require 'dashboard)
(dashboard-setup-startup-hook)
(use-package dashboard
  :config
  (setq show-week-agenda-p t)
  ;; (setq dashboard-items '((recents . 15) (agenda . 10)))
  (setq dashboard-week-agenda t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-init-info t)
  (setq dashboard-startup-banner 5)
  (setq dashboard-set-navigator t)
  (dashboard-setup-startup-hook)
  )

;; Set the title
;;(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
;; (setq dashboard-startup-banner [official])
(setq dashboard-startup-banner 'logo)
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts t)

;; (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 10)
                        (projects . 10)
                        (agenda . 5)
                        (registers . 5)))

;; ;;;;;;;;;;;;;;;;;;; for daemon ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (daemonp)
	(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (message "Normal session")
  )


;; ;; ;; ;;;;;;;;;;;;;;;;; org-latex ;;;;;;;;;;;;;;;;; ;;
;; ;; org elp
(use-package org-elp
  :config
  (setq org-elp-idle-time 0.5
        org-elp-split-fraction 0.25))

;; ;; ;; ;;;;;;;;;;;;;;;;; treemacs ;;;;;;;;;;;;;;;;; ;;
;; ;; ;; ;;;;;;;;;;;;;;;;; treemacs ;;;;;;;;;;;;;;;;; ;;

(use-package treemacs
  :ensure t
  :defer t
  :init
  ;; (with-eval-after-load 'winum
    ;; (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   t
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-width                           35
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
;;        ("M-0"       . treemacs-select-window)
;;        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-c w <left>"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  ) ;; 

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;; ;; If emacs have problems with backgrounds
;;(set-face-attribute 'hl-line nil :background "#333333")
    

;; ;; Treemacs lsp
(lsp-treemacs-sync-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
:config
(global-set-key (kbd "C-c m") 'magit-status))

;;;; ? ;; Help
;;;; g ;; refresh
;;;; c ;; Commit
;;;; In commit, use C-c C-c to save

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Markdown code-blocks
(setq markdown-fontify-code-blocks-natively t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; modern cpp
;; (require 'modern-cpp-font-lock)
;; (modern-c++-font-lock-global-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Detect files and modes
(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
;;(add-hook 'lisp-mode-hook 'lsp)
(add-hook 'cmake-mode-hook 'company-mode)
;;(add-hook 'emacs-lisp-mode-hook 'lsp)
;; (add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

;; ;; Syntax highlight C++
;; (add-to-list 'modern-c++-operators "=")
;; (add-to-list 'modern-c++-operators "*")
;; (add-to-list 'modern-c++-operators "&")
;; (add-to-list 'modern-c++-operators "-")
;; (add-to-list 'modern-c++-operators ">")
;; ;;
;; (add-to-list 'modern-c++-operators "(")
;; (add-to-list 'modern-c++-operators ")")
;; (add-to-list 'modern-c++-operators "[")
;; (add-to-list 'modern-c++-operators "]")
;; (add-to-list 'modern-c++-operators "{")
;; (add-to-list 'modern-c++-operators "}")


(font-lock-add-keywords 'c++-mode
  `((,(concat
       "\\<[_a-zA-Z][_a-zA-Z0-9]*\\>"       ; Object identifier
       "\\s *"                              ; Optional white space
       "\\(?:\\.\\|->\\)"                   ; Member access
       "\\s *"                              ; Optional white space
       "\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>" ; Member identifier
       "\\s *"                              ; Optional white space
       "(")                                 ; Paren for method invocation
     1 'font-lock-function-name-face t)))

;; ;; or Other method
;; (defface font-lock-method-call-face
;;   '((t . (:foreground "orangered" :bold t)))
;;   "Face to display method calls in.")

;;(add-hook 'XXX-mode-hook #'lsp)
(add-hook 'emacs-lisp-mode #'lsp-deferred)
(add-hook 'lisp-mode-hook #'lsp-deferred)
;;(add-hook 'prog-mode-hook #'lsp)

;; ;; Switch between Header and Source
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "M-o") 'ff-find-other-file)))


;;
;; ;; Folding

(add-hook 'c-mode-common-hook (lambda () (hs-minor-mode t)))
(add-hook 'json-mode-hook (lambda () (hs-minor-mode t)))
(add-hook 'js-mode-hook (lambda () (hs-minor-mode t)))
(add-hook 'markdown-mode-hook (lambda () (hs-minor-mode t)))

(defun hs-toggle-fold ()
  (interactive)
  (save-excursion
    (end-of-line)
    (hs-toggle-hiding)))

(eval-after-load 'hideshow
 '(progn
	;; (global-set-key (kbd "C--") 'hs-toggle-hiding)
	(global-set-key (kbd "C-+") 'hs-show-block)
	(global-set-key (kbd "C--") 'hs-toggle-fold)
	))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP + Company
;; (require 'lsp-mode)

;;;; company
;; (use-package company
;;   :ensure
;;   :defer 4
;;   :init (progn
;;           (global-company-mode)
;;           (setq company-global-modes '(not python-mode cython-mode sage-mode))
;;           )
;;   :config (progn
;;             (setq company-tooltip-limit 20
;;                   company-idle-delay .1
;;                   company-echo-delay 0
;;                   company-begin-commands '(self-insert-command)
;;                   company-transformers '(company-sort-by-occurrence)
;;                   company-selection-wrap-around t
;;                   company-idle-delay .1
;;                   company-minimum-prefix-length 1
;;                   company-selection-wrap-around t
;;                   company-dabbrev-downcase nil
;;                   )
;;             (bind-keys :map company-active-map
;;                        ("C-n" . company-select-next)
;;                        ("C-p" . company-select-previous)
;;                        ("C-d" . company-show-doc-buffer)
;;                        ("<tab>" . company-complete)
;;                        ("<escape>" . company-abort)
;;                        )
;;             )
;;   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;; 	  ;; ;; LSP

;; 	  ;; ;; lsp-keymap-prefix t
;; 	  ;; ;; lsp-enable-file-watchers t
;; 	  ;; ;; lsp-enable-text-document-color t
;; 	  ;; ;; lsp-enable-on-type-formatting t
;; 	  ;; ;; lsp-log-io t
;; 	  ;; ;; lsp-enable-folding t
;; 	  ;; ;; lsp-diagnostic-package :none
;; 	  ;; lsp-enable-completion-at-point t
;; 	  ;; lsp-enable-symbol-highlighting t
;; 	  ;; lsp-enable-links t
;; 	  lsp-restart 'auto-restart
;; 	  ;; lsp-enable-snippet t
;; 	  lsp-enable-symbol-highlighting t
;; 	  ;; lsp-ui-doc-header t
;; 	  ;; lsp-ui-doc-include-signature t

;; 	  ;;lsp-ui-doc-alignment 'window
;; 	  ;;lsp-ui-doc-glance t
;; 	  lsp-ui-doc-enable t
;; 	  ;; lsp-ui-doc-enable nil				
;; 	  lsp-ui-doc-show-with-cursor t
;; 	  lsp-ui-doc-show-with-mouse t
;; 	  ;;lsp-ui-doc-text-scale-level 5
;; 	  lsp-ui-doc-position 'at-point
;; 	  lsp-lens-mode t
;; 	  lsp-lens-enable t
;; 	  lsp-headerline-breadcrumb-enable t
;; 	  lsp-headerline-breadcrumb-icons-enable t
;; 	  lsp-ui-sideline-show-code-actions t
;; 	  lsp-ui-sideline-enable t
;; 	  lsp-ui-sideline-show-hover t
;; 	  lsp-modeline-code-actions-segments '(count icon name)
;; 	  lsp-modeline-code-actions-enable t
;; 	  lsp-diagnostics-provider :flycheck
;; 	  ;; lsp-ui-sideline-enable t
;; 	  lsp-ui-sideline-show-diagnostics t
;; 	  lsp-eldoc-enable-hover t
;; 	  lsp-modeline-diagnostics-enable t
;; 	  lsp-signature-auto-activate t ;; you could manually request them via `lsp-signature-activate`
;; 	  lsp-signature-render-documentation t
;; 	  ;; ;;lsp-completion-provider :company-mode
;; 	  lsp-completion-show-detail t
;; 	  lsp-completion-show-kind t
;; 	  lsp-idle-delay 2
	  
;; 	  ;; ;; Company
;; 	  company-idle-delay 0.0
;; ;;	  company-cmake t
;; 	  company-show-numbers t
;; 	  company-minimum-prefix-length 1
;; 	  company-selection-wrap-around nil
;; 	  company-tooltip-limit 10
;; 	  company-tooltip-align-annotations t
;; 	  ;;company-require-match 'never

;; 	  ;; company-dabbrev-other-buffers t
;; 	  ;; company-dabbrev-code-other-buffers 'all
;; 	  ;; company-dabbrev-code-everywhere t
;; 	  ;;	company-dabbrev-downcase        nil
;; 	  ;;	company-transformers '(company-sort-prefer-same-case-prefix)
;; 	  ;;	(company-sort-by-occurrence)
;; 	  ;;	(company-sort-by-backend-importance)
;; 	  ;;	(company-sort-prefer-same-case-prefix)

;; 	  ;; tab-always-indent 'complete
;; 	  ;;
;; 	  company-clang t
;; 	  company-clang-executable "/usr/bin/clang++"
;; 	  ;;
;; 	  )  ;; clangd is fast

;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;   (require 'dap-cpptools)
;;   (yas-global-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;

(use-package lsp-mode
	:commands lsp
	:hook (lsp-mode . flycheck-mode)
	:config
	(setq

	 ;; ;; ;; lsp-keymap-prefix t
	 ;; ;; lsp-enable-file-watchers t
	 ;; ;; lsp-enable-text-document-color t
	 ;; ;; lsp-enable-on-type-formatting t
	 lsp-log-io t
	 lsp-enable-folding t
	 ;; ;; lsp-diagnostic-package :none
	 ;; lsp-enable-completion-at-point t
	 lsp-enable-symbol-highlighting t
	 ;; lsp-enable-links t
	 lsp-enable-snippet t
	 ;; lsp-ui-doc-header t
	 ;; lsp-ui-doc-include-signature t

	 ;; lsp-workspace-folders-changed-functions t
	 ;; lsp-semantic-tokens-enable t

	 lsp-idle-delay 1
	 lsp-restart 'auto-restart
	 ;;lsp-ui-doc-alignment 'window
	 ;;lsp-ui-doc-glance t
	 ;; lsp-ui-doc-enable nil
	 ;; lsp-ui-doc-enable nil				
	 lsp-ui-doc-enable t
	 lsp-ui-doc-delay 2
	 lsp-ui-doc-show-with-cursor t
	 lsp-ui-doc-show-with-mouse t
	 ;;lsp-ui-doc-text-scale-level 5
	 lsp-ui-doc-position 'at-point
	 lsp-lens-mode t
	 lsp-lens-enable t
	 lsp-headerline-breadcrumb-enable t
	 lsp-headerline-breadcrumb-icons-enable t
	 lsp-ui-sideline-show-code-actions t
	 lsp-ui-sideline-enable t
	 ;;	 lsp-ui-sideline-enable t
	 lsp-ui-sideline-show-hover t
	 lsp-modeline-code-actions-segments '(count icon name)
	 lsp-modeline-code-actions-enable t
	 lsp-diagnostics-provider :flycheck
	 lsp-ui-sideline-show-diagnostics t
	 lsp-eldoc-enable-hover t
	 lsp-modeline-diagnostics-enable t
	 lsp-signature-auto-activate nil ;; you could manually request them via `lsp-signature-activate`
	 lsp-signature-render-documentation t
	 ;;lsp-completion-provider :company-mode
	 lsp-completion-show-detail t
	 lsp-completion-show-kind t
	 lsp-prefer-capf t
	 
	 ;; ;; Clang
	 
	 lsp-clients-clangd-executable "/usr/bin/clangd"
	 lsp-clients-clangd-args
		   '("-j=8"
			 "--header-insertion=never"
			 "--all-scopes-completion"
			 "--background-index"
			 "--clang-tidy"
			 "--log=verbose"
			 "--pretty"
			 "--compile-commands-dir=./build"
			 "--cross-file-rename"
			 "--suggest-missing-includes"
			 )

		   ;; ;; Flycheck
		   lsp-ui-flycheck-enable t
      lsp-ui-flycheck-list-position 'right
      lsp-ui-flycheck-live-reporting t
      lsp-ui-peek-enable t
	  
	 )
	;; :bind(:map dap-mo)
	
	;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	(require 'dap-cpptools)
	(yas-global-mode)
	) ;;

;; (add-to-list 'display-buffer-alist
;;              `(,(rx bos "*lsp-help*" eos)
;;               (display-buffer-reuse-window
;;                display-buffer-in-side-window)
;;               (side            . bottom)
;;               (reusable-frames . visible)
;;               (window-height   . 0.23)))


;;
;; ;; Company

(use-package company
  :hook (after-init . global-company-mode)
  :config 
  (setq company-idle-delay 0.5
		company-minimum-prefix-length 1
		company-selection-wrap-around nil
		company-tooltip-limit 10
		company-tooltip-align-annotations t
		;; company-require-match 'never
		company-clang t
		company-clang-executable "/usr/bin/clang++"
		
		tab-always-indent 'complete
		;; tab-always-indent 'company-complete
		;; company-clang-arguments "-I/usr/local/include" "-I/usr/include"
		;; company-clang-arguments (quote ("-I/usr/local/include" "-I/usr/include"))
		;; company-backends '(( company-capf company-files company-yasnippet company-cmake ))

		company-selection-wrap-around nil
		;; company-dabbrev-other-buffers t
		;; company-dabbrev-code-other-buffers 'all
		;; company-dabbrev-code-everywhere t
		company-transformers '(company-sort-prefer-same-case-prefix)
		;; 	  ;;	company-dabbrev-downcase        nil
		;; 	  ;;	(company-sort-by-occurrence)
		;; 	  ;;	(company-sort-by-backend-importance)
		;; 	  ;;	(company-sort-prefer-same-case-prefix)

		)
	:bind (:map company-active-map)
	(
	 ([(tab)] . company-complete)
	 ;; ("C-c c" . company-complete-common)
	 ;; ("C-j"    . company-select-next)
	 ;; ("C-k"    . company-select-previous)
	 ;; ("C-a"    . company-complete-selection)
	 ;; ("C-h" . backward-delete-char)
	 ;; ("C-h" . backward-delete-char)
	 ))

;; (use-package posframe :defer 0)
;; (use-package flycheck-posframe
;; 	:hook (flycheck-mode . flycheck-posframe-mode))
;; (use-package company-posframe
;; 	:hook (company-mode . company-posframe-mode)
;; 	:config (setq company-posframe-quickhelp-delay 0.6))

(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends '( company-capf  company-files company-yasnippet company-cmake  )))

(eval-after-load 'company
  '(add-to-list 'company-backends '( company-capf company-bbdb company-files company-yasnippet company-cmake  )))

(global-set-key  (kbd "C-c c") 'company-complete)
;; (global-set-key  (kbd "C-c c") 'company-complete-common)

;; company-capf company-bbdb company-files company-yasnippet  company-dabbrev-code  company-semantic company-cmake
;; company-capf company-bbdb company-files company-yasnippet company-cmake company-clang 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'dap-cpptools)
(setq dap-auto-configure-features '(sessions locals controls tooltip))


(require 'dap-lldb)
(require 'dap-gdb-lldb)

(use-package dap
  :bind (:map dap-mode-map)
  (
   ("C-c g d" . dap-disconnect)
   ("C-c g g" . dap-debug)
   ("C-c g n" . dap-next)
   ("C-c g c" . dap-continue)
   ("C-c g s" . dap-step-in)
   ("C-c g t" . dap-breakpoint-toggle)
   ("C-c g l" . dap-ui-breakpoints-list)
   ("C-c g r" . dap-debug-restart)
   ) 
  ) ;; use-package

;; (setq dap-ui-breakpoints-mode t) ;; ;; Tiene errores

;; ;; (require 'eldoc-box)
;; ;; (eldoc-box-hover-mode )

;; ;; (use-package
;; ;;   lsp-ui
;; ;;   :hook (lsp-mode . lsp-ui-mode)
;; ;;   :after flycheck
;; ;;   :bind (:map lsp-mode-map
;; ;;               ("<f11>" . lsp-find-references)
;; ;;               ("S-<f11>" . lsp-ui-peek-find-references)
;; ;;               ("<f12>" . lsp-find-definition)
;; ;;               ("S-<f12>" . lsp-find-declaration)
;; ;;               ("<f9>" . lsp-ui-doc-glance)
;; ;;               ("C-c f" . lsp-format-buffer)
;; ;;               ("C-<return>" . lsp-ui-sideline-apply-code-actions)
;; ;;               ("M-p" . lsp-ui-find-prev-reference)
;; ;;               ("M-n" . lsp-ui-find-next-reference))
;; ;;   :custom (lsp-ui-sideline-diagnostic-max-lines 3)
;; ;;   (lsp-ui-flycheck-enable t)
;; ;;   (lsp-ui-doc-enable nil)
;; ;;   (lsp-ui-sideline-ignore-duplicate t)
;; ;;   (lsp-ui-sideline-show-code-actions t)
;; ;;   (lsp-ui-sideline-show-hover t)
;; ;;   (lsp-ui-sideline-show-symbol nil)
;; ;;   (lsp-ui-sideline-actions-kind-regex ".*")
;; ;;   (lsp-clients-clangd-args '("--compile-commands-dir=build"
;; ;;                              "--header-insertion=never") nil nil
;; ;;                              "Customized with use-package lsp-clients")
;; ;;   :custom-face
;; ;;   ;; Make the sideline overlays less annoying
;; ;;   (lsp-ui-sideline-global ((t
;; ;;                             (:background "444444"))))
;; ;;   (lsp-ui-sideline-symbol-info ((t
;; ;;                                  (:foreground "gray45"
;; ;;                                               :slant italic
;; ;;                                               :height 0.99)))))


;; ;; ;;;;;;;;;;;;;;;;; Centaur Tabs ;;;;;;;;;;;;;;;;; ;;
;; ;;

;;(setq centaur-tabs-style "alternate")
;;(setq centaur-tabs-style "box")
;; (setq centaur-tabs-style "rounded")
;; (setq centaur-tabs-style "bar")
;;(centaur-tabs-change-fonts "arial" 160)

(use-package centaur-tabs
  :demand
   ;; :load-path "~/.emacs.d/other/centaur-tabs"
   :config
   (centaur-tabs-mode t)
   (setq centaur-tabs-style "bar"
	  centaur-tabs-height 28
	  centaur-tabs-set-icons t
	  ;; centaur-tabs-plain-icons t
	  centaur-tabs-set-close-button nil
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-show-navigation-buttons t
	  centaur-tabs-set-bar 'under
	  x-underline-at-descent-line t)
   (centaur-tabs-headline-match)
   ;; (setq centaur-tabs-gray-out-icons 'buffer)
   ;; (centaur-tabs-enable-buffer-reordering)
   ;; (setq centaur-tabs-adjust-buffer-order t)
   (setq uniquify-separator "/")
   (setq uniquify-buffer-name-style 'forward)
   (defun centaur-tabs-buffer-groups ()
     "`centaur-tabs-buffer-groups' control buffers' group rules.
 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
     (list
      (cond
	;; ((not (eq (file-remote-p (buffer-file-name)) nil))
	;; "Remote")
	((or (string-equal "*" (substring (buffer-name) 0 1))
	     (memq major-mode '(magit-process-mode
				magit-status-mode
				magit-diff-mode
				magit-log-mode
				magit-file-mode
				magit-blob-mode
				magit-blame-mode
				)))
	 "Emacs")
	((derived-mode-p 'prog-mode)
	 "Editing")
	((derived-mode-p 'dired-mode)
	 "Dired")
	((memq major-mode '(helpful-mode
			    help-mode))
	 "Help")
	((memq major-mode '(org-mode
			    org-agenda-clockreport-mode
			    org-src-mode
			    org-agenda-mode
			    org-beamer-mode
			    org-indent-mode
			    org-bullets-mode
			    org-cdlatex-mode
			    org-agenda-log-mode
			    diary-mode))
	 "OrgMode")
	(t
	 (centaur-tabs-get-group-name (current-buffer))))))
   :hook
   (dashboard-mode . centaur-tabs-local-mode)
   (term-mode . centaur-tabs-local-mode)
   (calendar-mode . centaur-tabs-local-mode)
   (org-agenda-mode . centaur-tabs-local-mode)
   (helpful-mode . centaur-tabs-local-mode)
   :bind
   ("M-<S-left>" . centaur-tabs-backward)
   ("M-<S-right>" . centaur-tabs-forward)
   ;; ("C-c t s" . centaur-tabs-counsel-switch-group)
   ;; ("C-c t p" . centaur-tabs-group-by-projectile-project)
   ;; ("C-c t g" . centaur-tabs-group-buffer-groups)
   ;; (:map evil-normal-state-map
   ;; 	  ("g t" . centaur-tabs-forward)
   ;; 	  ("g T" . centaur-tabs-backward))
   )


;; ;; ;;;;;;;;;;;;;;;;; Indent-Guide ;;;;;;;;;;;;;;;;; ;;
;; (require 'indent-guide)
;; (indent-guide-global-mode) ;; ;; Tiene problemas con los cuadros de dialogo
;; (setq indent-guide-delay 0.1)
;; ;(set-face-background 'indent-guide-face "dimwhite")
;; ;;(set-face-background 'indent-guide-face "gray")
;; ;;(set-face-background 'indent-guide-face "#000000")
;; ;;(set-face-background 'indent-guide-face "blue")
;; (setq indent-guide-recursive t)
;; (setq indent-guide-char "|")

;; ;; ;; ;;;;;;;;;;;;;;;;; iMenu ;;;;;;;;;;;;;;;;; ;;
;;(global-set-key (kbd "<f8> <right>") #'imenu-list-smart-toggle)
(global-set-key (kbd "C-c w <right>") #'imenu-list-smart-toggle)

;; (setq imenu-list-focus-after-activation t)
;; (global-set-key (kbd "C-.") #'imenu-anywhere)

;; (imenu-list-smart-toggle)
(setq imenu-list-size 40)

;;(setq imenu-list-auto-resize t)
;;(setq imenu-max-item-length 40)
;;(setq imenu-min-item-length 30)

;; ;; ;;;;;;;;;;;;;;;;; Projectile ;;;;;;;;;;;;;;;;; ;;
(projectile-mode +1)
;; Recommended keymap prefix on macOS
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;(setq projectile-indexing-method 'native)
(setq projectile-sort-order 'access-time)
(setq projectile-enable-caching t)
(setq projectile-require-project-root t)
(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-switch-project-action #'projectile-find-dir)
(setq projectile-find-dir-includes-top-level t)

;; ;; Projectile CMake
(setq projectile-enable-cmake-presets t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; Doom-modeline

(require 'doom-modeline)
(doom-modeline-mode 1)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 4)

;; Whether to use hud instead of default bar. It's only respected in GUI.
;; (defcustom doom-modeline-hud nil)

;; The limit of the window width.
;; If `window-width' is smaller than the limit, some information won't be displayed.
(setq doom-modeline-window-width-limit fill-column)

;; How to detect the project root.
;; nil means to use `default-directory'.
;; The project management packages have some issues on detecting project root.
;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
;; to hanle sub-projects.
;; You can specify one if you encounter the issue.

;;
(setq doom-modeline-project-detection 'auto)

;; How to disable symbolic links expanding in mode-line?
;; built-in `project' on 26+
;; (setq doom-modeline-project-detection 'project)


;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   auto => emacs/lisp/comint.el (in a project) or comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   truncate-nil => ~/Projects/FOSS/emacs/lisp/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are experiencing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'auto)

;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback nil)

;; Whether display the minor modes in the mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info nil)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display the workspace name. Non-nil to display in the mode-line.
(setq doom-modeline-workspace-name t)

;; Whether display the perspective name. Non-nil to display in the mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; If non nil the perspective name is displayed alongside a folder icon.
(setq doom-modeline-persp-icon t)

;; Whether display the `lsp' state. Non-nil to display in the mode-line.
(setq doom-modeline-lsp t)

;; Whether display the GitHub notifications. It requires `ghub' package.
(setq doom-modeline-github nil)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display the modal state icon.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
;; (setq doom-modeline-mu4e nil)
;; also enable the start of mu4e-alert
;; (mu4e-alert-enable-mode-line-display)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Wheter gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
(setq doom-modeline-gnus-timer 2)

;; Wheter groups should be excludede when gnus automatically being updated.
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; Whether display the IRC notifications. It requires `circe' or `erc' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version t)

;; Or for individual languages
;; (setq doom-modeline-env-enable-python t)
;; (setq doom-modeline-env-enable-ruby t)
;; (setq doom-modeline-env-enable-perl t)
;; (setq doom-modeline-env-enable-go t)
;; (setq doom-modeline-env-enable-elixir t)
;; (setq doom-modeline-env-enable-rust t)
;; (setq doom-modeline-env-enable-c++ t)
;; (setq doom-modeline-env-enable-cpp t)
;; (setq doom-modeline-env-enable-gcc t)
;; (setq doom-modeline-env-enable-g++ t)

;; Change the executables to use for the language version string
;; (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
;; (setq doom-modeline-env-ruby-executable "ruby")
;; (setq doom-modeline-env-perl-executable "perl")
;; (setq doom-modeline-env-go-executable "go")
;; (setq doom-modeline-env-elixir-executable "iex")
;; (setq doom-modeline-env-rust-executable "rustc")

;; What to display as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ParenMode.
;; https://www.emacswiki.org/emacs/ShowParenMode
;;(require 'paren)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

;; Smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;
;; Multiple Cursors
;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(setq multiple-cursors-mode t)

;; (global-set-key (kbd "S-M-<down>") 'mc/mark-next-like-this)
;; (global-set-key (kbd "S-M-<up>") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c <") 'mc/mark-all-words-like-this)
(global-set-key (kbd "s-.") 'mc/mark-next-like-this)
(global-set-key (kbd "s-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-x") 'mc/mark-all-like-this)
;; (global-set-key (kbd "s-x") 'mc/edit-lines)
;; (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)


;; ;; ;;;;;;;;;;;;;;;;; Flycheck ;;;;;;;;;;;;;;;;; ;;

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-flycheck-mode)

(autoload 'flycheck "flycheck-list-errors")

;; (setq-default flycheck-disabled-checkers '(c/c++-clang))
;; (setq-default flycheck-disabled-checkers '(c/c++-gcc))

;; ;;;;;;;;;;;;;;;;
;; Flycheck inline (Si no funciona/uso LSP, este muestra debajo los errores)
;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;; ;;;;;;;;;;;;;;;;

;; (setq flycheck-inline-display-function
;;      (lambda (msg pos err)
;;        (let* ((ov (quick-peek-overlay-ensure-at pos))
;;               (contents (quick-peek-overlay-contents ov)))
;;          (setf (quick-peek-overlay-contents ov)
;;                (concat contents (when contents "\n") msg))
;;          (quick-peek-update ov)))
;;      flycheck-inline-clear-function #'quick-peek-hide)

;; ;;;;;;;;;;;;;
;; ;; Old
;; (require 'flycheck-tip)
;; (define-key your-prog-mode (kbd "C-c C-n") 'flycheck-tip-cycle)
;; (flycheck-tip-use-timer 'verbose)
;; (with-eval-after-load 'flycheck  (flycheck-pos-tip-mode))
;; ;;;;;;;;;;;;;

;;(setq  flycheck-indication-mode 'left-fringe)
;; (setq flycheck-check-syntax-automatically '(mode-enabled ))

;; (setq flycheck-highlighting-mode 'columns)
;; (setq flycheck-highlighting-mode 'symbols)
(setq flycheck-highlighting-mode 'lines)
;; (setq flycheck-highlighting-mode 'sexps)

;; (add-to-list 'display-buffer-alist
;;              `(,(rx bos "*Flycheck errors*" eos)
;;               (display-buffer-reuse-window
;;                display-buffer-in-side-window)
;;               (side            . bottom)
;;               (reusable-frames . visible)
;;               (window-height   . 0.13)))

;; (add-hook 'flycheck-after-syntax-check-hook
;;          (lambda  ()
;;            (if flycheck-current-errors
;;                (flycheck-list-errors)
;;              (when (get-buffer "*Flycheck errors*")
;;                (switch-to-buffer "*Flycheck errors*")
;;                (kill-buffer (current-buffer))
;;                ;;;(delete-window)
;; 				))))



;; ;;
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;  Selectrum ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; Works with Ivy

(selectrum-mode +1)
;; ;;to make sorting and filtering more intelligent
(selectrum-prescient-mode +1)

;; ;; to save your command history on disk, so the sorting gets more
;; ;; intelligent over time
(prescient-persist-mode +1)

;;
;; ;; Prescient
;; https://github.com/raxod502/prescient.el
(ivy-prescient-mode)
(company-prescient-mode)
(selectrum-prescient-mode)


;; ;; ;; 
;; ;; ;; ;;;;;;;;;;;;;;;;; Ivy ;;;;;;;;;;;;;;;;; ;;


(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
 ;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x d") 'counsel-dired)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git) ;; Solo lista los archivos en git
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; ;; Sobre-escribe el original
(global-set-key (kbd "C-c p f") 'counsel-projectile-find-file)
(global-set-key (kbd "C-c p d") 'counsel-projectile-find-dir)
(global-set-key (kbd "C-c p B") 'counsel-projectile)


;; ;; Disable ^ at start
(setq ivy-initial-inputs-alist nil)

;; ;; Make Fuzzy search
;; (setq ivy-re-builders-alist
;;       '((ivy-switch-buffer . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))

;; Or use .* in ivy/counsel

;;
;; ;; Ivy rich
(require 'ivy-rich)
(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)

(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

(ivy-rich-modify-columns
 'ivy-switch-buffer
 '((ivy-rich-switch-buffer-size (:align right))
   (ivy-rich-switch-buffer-major-mode (:width 20 :face error))))

;;
;; ;; Ivy icons
;; Whether display the icons
(setq all-the-icons-ivy-rich-icon t)

;; Whether display the colorful icons.
;; It respects `all-the-icons-color-icons'.
(setq all-the-icons-ivy-rich-color-icon t)

;; The icon size
(setq all-the-icons-ivy-rich-icon-size 1.0)

;; Whether support project root
(setq all-the-icons-ivy-rich-project t)

;; Definitions for ivy-rich transformers.
;; See `ivy-rich-display-transformers-list' for details."
;; all-the-icons-ivy-rich-display-transformers-list

;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple icons simultaneously,
;; you can try setting the following variable
(setq inhibit-compacting-font-caches t)

;; M-?
;; ;; Ivy xref
(require 'ivy-xref)
;; xref initialization is different in Emacs 27 - there are two different
;; variables which can be set rather than just one
(when (>= emacs-major-version 27)
  (setq xref-show-definitions-function #'ivy-xref-show-defs))
;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
;; commands other than xref-find-definitions (e.g. project-find-regexp)
;; as well
(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)


;; Ivy history
(require 'savehist)
(add-to-list 'savehist-additional-variables 'ivy-dired-history-variable)
(savehist-mode 1)
;; ;; or if you use desktop-save-mode
;;(add-to-list 'desktop-globals-to-save 'ivy-dired-history-variable)


(with-eval-after-load 'dired
  (require 'ivy-dired-history)
  ;; if you are using ido,you'd better disable ido for dired
  ;; (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil) ;in ido-setup-hook
  (define-key dired-mode-map "," 'dired))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ivy todo
(use-package ivy-todo :ensure t
  :bind ("C-c t" . ivy-todo)
  :commands ivy-todo
  ;; :config
  ;; (setq ivy-todo-default-tags '("PROJECT"))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Consult

;; ;; Example configuration for Consult
;; (use-package consult
;;   ;; Replace bindings. Lazily loaded due by `use-package'.
;;   :bind (;; C-c bindings (mode-specific-map)
;;          ("C-c h" . consult-history)
;;          ("C-c m" . consult-mode-command)
;;          ("C-c b" . consult-bookmark)
;;          ("C-c k" . consult-kmacro)
;;          ;; C-x bindings (ctl-x-map)
;;          ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
;;          ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
;;          ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
;;          ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
;;          ;; Custom M-# bindings for fast register access
;;          ("M-#" . consult-register-load)
;;          ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
;;          ("C-M-#" . consult-register)
;;          ;; Other custom bindings
;;          ("M-y" . consult-yank-pop)                ;; orig. yank-pop
;;          ("<help> a" . consult-apropos)            ;; orig. apropos-command
;;          ;; M-g bindings (goto-map)
;;          ("M-g e" . consult-compile-error)
;;          ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
;;          ("M-g g" . consult-goto-line)             ;; orig. goto-line
;;          ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
;;          ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
;;          ("M-g m" . consult-mark)
;;          ("M-g k" . consult-global-mark)
;;          ("M-g i" . consult-imenu)
;;          ("M-g I" . consult-imenu-multi)
;;          ;; M-s bindings (search-map)
;;          ("M-s f" . consult-find)
;;          ("M-s F" . consult-locate)
;;          ("M-s g" . consult-grep)
;;          ("M-s G" . consult-git-grep)
;;          ("M-s r" . consult-ripgrep)
;;          ("M-s l" . consult-line)
;;          ("M-s L" . consult-line-multi)
;;          ("M-s m" . consult-multi-occur)
;;          ("M-s k" . consult-keep-lines)
;;          ("M-s u" . consult-focus-lines)
;;          ;; Isearch integration
;;          ("M-s e" . consult-isearch)
;;          :map isearch-mode-map
;;          ("M-e" . consult-isearch)                 ;; orig. isearch-edit-string
;;          ("M-s e" . consult-isearch)               ;; orig. isearch-edit-string
;;          ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
;;          ("M-s L" . consult-line-multi))           ;; needed by consult-line to detect isearch

;;   ;; Enable automatic preview at point in the *Completions* buffer.
;;   ;; This is relevant when you use the default completion UI,
;;   ;; and not necessary for Vertico, Selectrum, etc.
;;   :hook (completion-list-mode . consult-preview-at-point-mode)

;;   ;; The :init configuration is always executed (Not lazy)
;;   :init

;;   ;; Optionally configure the register formatting. This improves the register
;;   ;; preview for `consult-register', `consult-register-load',
;;   ;; `consult-register-store' and the Emacs built-ins.
;;   (setq register-preview-delay 0
;;         register-preview-function #'consult-register-format)

;;   ;; Optionally tweak the register preview window.
;;   ;; This adds thin lines, sorting and hides the mode line of the window.
;;   (advice-add #'register-preview :override #'consult-register-window)

;;   ;; Optionally replace `completing-read-multiple' with an enhanced version.
;;   (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

;;   ;; Use Consult to select xref locations with preview
;;   (setq xref-show-xrefs-function #'consult-xref
;;         xref-show-definitions-function #'consult-xref)

;;   ;; Configure other variables and modes in the :config section,
;;   ;; after lazily loading the package.
;;   :config

;;   ;; Optionally configure preview. The default value
;;   ;; is 'any, such that any key triggers the preview.
;;   ;; (setq consult-preview-key 'any)
;;   ;; (setq consult-preview-key (kbd "M-."))
;;   ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
;;   ;; For some commands and buffer sources it is useful to configure the
;;   ;; :preview-key on a per-command basis using the `consult-customize' macro.
;;   (consult-customize
;;    consult-theme
;;    :preview-key '(:debounce 0.2 any)
;;    consult-ripgrep consult-git-grep consult-grep
;;    consult-bookmark consult-recent-file consult-xref
;;    consult--source-file consult--source-project-file consult--source-bookmark
;;    :preview-key (kbd "M-."))

;;   ;; Optionally configure the narrowing key.
;;   ;; Both < and C-+ work reasonably well.
;;   (setq consult-narrow-key "<") ;; (kbd "C-+")

;;   ;; Optionally make narrowing help available in the minibuffer.
;;   ;; You may want to use `embark-prefix-help-command' or which-key instead.
;;   ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

;;   ;; Optionally configure a function which returns the project root directory.
;;   ;; There are multiple reasonable alternatives to chose from.
;;   ;;;; 1. project.el (project-roots)
;;   (setq consult-project-root-function
;;         (lambda ()
;;           (when-let (project (project-current))
;;             (car (project-roots project)))))
;;   ;;;; 2. projectile.el (projectile-project-root)
;;   ;; (autoload 'projectile-project-root "projectile")
;;   ;; (setq consult-project-root-function #'projectile-project-root)
;;   ;;;; 3. vc.el (vc-root-dir)
;;   ;; (setq consult-project-root-function #'vc-root-dir)
;;   ;;;; 4. locate-dominating-file
;;   ;; (setq consult-project-root-function (lambda () (locate-dominating-file "." ".git")))
;; )

;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; ;;  Consult dir

;; (use-package consult-dir
;;   :ensure t
;;   :bind (("C-x C-d" . consult-dir)
;;          :map minibuffer-local-completion-map
;;          ("C-x C-d" . consult-dir)
;;          ("C-x C-j" . consult-dir-jump-file)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; Consult LSP
;; (define-key lsp-mode-map [remap xref-find-apropos] #'consult-lsp-symbols)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Minimap Consume muchos recursos

;; (minimap-mode)
;; (setq minimap-window-location 'right)
;; (setq minimap-update-delay 10)


;; ;; ;;;;;;;;;;;;;;;;; Neotree ;;;;;;;;;;;;;;;;; ;;
;; ;(require 'neotree)
;; ;(global-set-key (kbd "<f8> <left>") 'neotree-toggle)
;; ;(setq-default neo-show-hidden-files t)
;; ;(setq neo-smart-open t)
;; ; (neotree-show)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Undo-fu
;; (use-package undo-fu
;;   :config
;;   (global-unset-key (kbd "C-z"))
;;   (global-set-key (kbd "C-z")   'undo-fu-only-undo)
;;   (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

;; ;; Math-preview
;; (use-package math-preview
;;   :custom (math-preview-command "/path/to/math-preview"))

;; ;; ;; Git
;; (global-git-gutter-mode +1)
;; ;; (setq git-gutter-mode t)

;; (add-hook 'c-mode-hook 'git-gutter-mode)
;; (add-hook 'c++-mode-hook 'git-gutter-mode)
;; (add-hook 'cmake-mode-hook 'git-gutter-mode)

;; ;; If you would like to use git-gutter.el and linum-mode
;; (git-gutter:linum-setup)

;; ;; (global-set-key (kbd "C-x C-g") 'git-gutter)
;; ;; (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; ;; ;; Jump to next/previous hunk
;; ;; (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
;; ;; (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; ;; ;; Stage current hunk
;; ;; (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; ;; ;; Revert current hunk
;; ;; (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; ;; ;; Mark current hunk
;; ;; (global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)

;; (custom-set-variables
;;  '(git-gutter:update-interval 2))

;; (custom-set-variables
;;  '(git-gutter:modified-sign "  ") ;; two space
;;  '(git-gutter:added-sign "++")    ;; multiple character is OK
;;  '(git-gutter:deleted-sign "--"))

;; (set-face-background 'git-gutter:modified "purple") ;; background color
;; (set-face-foreground 'git-gutter:added "green")
;; (set-face-foreground 'git-gutter:deleted "red")

;; (add-to-list 'git-gutter:update-commands 'other-window)

;; (custom-set-variables
;;  '(git-gutter:visual-line t))

;; (custom-set-variables
;;  '(git-gutter:unchanged-sign "|"))
;; (set-face-background 'git-gutter:unchanged "yellow")

;; (custom-set-variables
;;  '(git-gutter:hide-gutter t))

;; ;; Don't ask me!!
;; (custom-set-variables
;;  '(git-gutter:ask-p nil))

;; ;; ;;;;;;;;;;;;;;;;; Powerline ;;;;;;;;;;;;;;;;; ;;
;; ;; ;;;;;;;;;;;;;;;;; Powerline ;;;;;;;;;;;;;;;;; ;;
;; ;; https://github.com/milkypostman/powerline
;; (require 'powerline)
;; (powerline-center-theme)
;; ;; (powerline-default-theme)
;; ;; (powerline-vim-theme)
;; ;; (powerline-nano-theme)
;; ;; (powerline-revert)

;; (setq powerline-default-separator 'wave)
;; (powerline-raw mode-line-mule-info nil 'l)

;; ;;(setq powerline-arrow-shape 'arrow)   ;; the default
;; (setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
;; ;;(setq powerline-arrow-shape 'arrow14) ;; best for small fonts


;;
;; ;; Origami

;; (require 'origami)
;; (setq global-origami-mode t)
;; (setq origami-mode t)

;; (add-hook 'c-mode-common-hook (lambda () (origami-mode t)))
;; (add-hook 'json-mode-hook (lambda () (origami-mode t)))
;; (add-hook 'js-mode-hook (lambda () (origami-mode t)))
;; (add-hook 'markdown-mode-hook (lambda () (origami-mode t)))

;; (eval-after-load 'origami
;;  '(progn
;; 	(global-set-key (kbd "C-+") 'origami-toggle-node)
;; 	;; (global-set-key (kbd "C-+") 'hs-show-block)
;; 	))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details

;; ;; ;; helm from https://github.com/emacs-helm/helm
;; (require 'helm)
;; (helm-mode)

;; ;; ;; By default, the provider uses treemacs, so make sure that you have that in your load path. If you wish to use all-the-icons icons instead, set helm-icons-provider to =’all-the-icons=.

;; (helm-icons-enable)

;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)

;; ;; ;; This Solves the error with Flycheck
;; (setq helm-always-two-windows t
;;       helm-split-window-inside-p t)

;; (setq helm-autoresize-max-height 0)
;; (setq helm-autoresize-min-height 30)
;; (helm-autoresize-mode 1)

;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; ;; ;; prefix is C-x c by default, or C-c h if set
;; (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; (global-set-key (kbd "C-c h a") 'helm-ag)
;; (global-set-key (kbd "C-c h o") 'helm-occur)
;; (global-set-key (kbd "C-c h r") 'helm-regexp)
;; (global-set-key (kbd "C-c h s") 'helm-surfraw)
;; (global-set-key (kbd "C-c h c") 'helm-colors)
;; ;;(global-set-key (kbd "C-c h g") 'helm-google-suggest)

;; (require 'helm-ls-git)
;; (global-set-key (kbd "C-c h g") 'helm-projects-history)

;; (require 'helm-projectile)
;; (helm-projectile-on)
;; (global-set-key (kbd "C-c h p") 'helm-projectile)

;; ;; ;; Xref
;; (require 'helm-xref)

;; ;; Locate the helm-swoop folder to your path
;; ;;(add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")
;; (require 'helm-swoop)

;; ;; Change the keybinds to whatever you like :)
;; (global-set-key (kbd "M-i") 'helm-swoop)
;; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
;; (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
;; (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; ;; When doing isearch, hand the word over to helm-swoop
;; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; ;; From helm-swoop to helm-multi-swoop-all
;; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; ;; When doing evil-search, hand the word over to helm-swoop
;; ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
;; (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

;; ;; Move up and down like isearch
;; (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;; (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;; (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
;; (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; ;; Save buffer when helm-multi-swoop-edit complete
;; (setq helm-multi-swoop-edit-save t)

;; ;; If this value is t, split window inside the current window
;; (setq helm-swoop-split-with-multiple-windows nil)

;; ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
;; (setq helm-swoop-split-direction 'split-window-vertically)

;; ;; If nil, you can slightly boost invoke speed in exchange for text color
;; (setq helm-swoop-speed-or-color nil)

;; ;; ;; Go to the opposite side of line from the end or beginning of line
;; (setq helm-swoop-move-to-line-cycle t)

;; ;; Optional face for line numbers
;; ;; Face name is `helm-swoop-line-number-face`
;; (setq helm-swoop-use-line-number-face t)

;; ;; If you prefer fuzzy matching
;; (setq helm-swoop-use-fuzzy-match t)

;; ;; If you would like to use migemo, enable helm's migemo feature
;; ;;(helm-migemo-mode 1)


(provide 'Emacs_Packages)
;;; Emacs_Packages.el ends here
