;;; package --- Org mode
;;; Commentary:

;; ;; Org Roam
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t) ;; Previene erroroes o alertas
  :custom
  (org-roam-directory (file-truename "/media/cris/Panzer/Cris/Documents/OrgR"))
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle) ;; Muestra las referencias
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
		 ("C-c n o" . org-id-get-create)
         ("C-c n t" . org-roam-tag-add)
         ("C-c n a" . org-roam-alias-add)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)
		 :map org-mode-map
		 ("C-M-i" . completion-at-point)
		 )
  :config
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  ;; (require 'org-roam-protocol)
  )


;; ;; Simple Org
(use-package org
    :mode (("\\.org$" . org-mode))
    :ensure t
    :config
        ; use unicode bullets
        (require 'org-bullets)
        (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
		;;(setq org-bullets-bullet-list '("◉" "⁑" "⁂" "❖" "✮" "✱" "✸"))

		;; show images
		(org-display-inline-images )

		;; For timestamps
		(setq org-log-done 'time)
		
		;; set custom color for TODO keywords
        ;; (setq org-todo-keyword-faces
        ;;     '(
        ;; ("TODO" . "orange")
        ;; ("NEXT" . "red")
        ;; ("AXED" . "blue")
        ;; ("BACK" . "pink")
		;; ("BACK" . "pink")
        ;; ))
)


;; ;; For prevew Latex at start
;; (defun krofna-hack ()
;;   (when (looking-back (rx "$ "))
;;     (save-excursion
;;       (backward-char 1)
;;       (org-toggle-latex-fragment))))

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (org-mode)
;;             ;; (org-cdlatex-mode)
;;             (add-hook 'post-self-insert-hook #'krofna-hack 'append 'local)))


;; ;; Preview languages
(org-babel-do-load-languages
 'org-babel-load-languages
 (quote (
		 (emacs-lisp . t)
		 (C . t)
		 (dot . t)
		 )))

;; ;; Latex in org, increase the size
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(provide 'org-mode)
;;; org-mode.el ends here
