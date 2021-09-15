
;;
;; Konsole-terminal

(defun test-00 ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; ls -al ; echo ; echo --- ; pwd ; echo ; echo " (projectile-project-root) "  ; echo ; echo "(projectile-project-name) " ; echo -------------- ; echo ; read  -n 1 ; exit ; exec bash \" ' " ))
  nil 0)

(defun cpp-Simple-compile ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo ; echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Compile ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ;echo ;  g++ -o a.out -Wall -g *.cpp ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \" ' " ))
  nil 0)


(defun cpp-Simple-compile-and-run ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo ; echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Compile ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ;echo ;  g++ -o a.out -Wall -g *.cpp ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ; echo ; ./a.out ; read  -n 1 ; exit ; exec bash \" ' " ))
  nil 0)


(defun cpp-Simple-gdb ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo ; echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- DEBUG ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ;echo ;  pwd ; echo ; gdb a.out ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ; echo ; read  -n 1 ; exit ; exec bash \" ' " ))
  nil 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;; CMake-SH ;;;;;;;;;;;;;;;;;;;;; ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun CMake_Clean_Gen ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (projectile-project-root)
		   "; ./SH_files/CMake_clean_gen ; echo ; echo ; read -n 1 ; exit; exec bash \" ' " ))
  nil 0)

(defun CMake_Compile ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (projectile-project-root)
		   "; ./SH_files/CMake_Compile ; echo ; echo ; read -n 1 ; exit; exec bash \" ' " ))
  nil 0)

(defun CMake_Compile_Run ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (projectile-project-root)
		   "; ./SH_files/CMake_compile_run "(projectile-project-name)" ; echo ; echo ; read -n 1 ; exit; exec bash \" ' " ))
  nil 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;; Cpp-cmake ;;;;;;;;;;;;;;;;;;;;; ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun cpp-cmake-build ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Build ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; mkdir build ; cd build ; cmake .. ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash  \" ' " ))
  nil 0)


(defun cpp-cmake-test-compile ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Build ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; cd build ; cmake --build . --config Debug --target all -- -j 2 ; ctest -j2 -C Debug -T test --output-on-failure echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash  \" ' " ))
  nil 0)


(defun cpp-cmake-compile ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo; cd build ; cmake --build . --config Debug --target all -- -j 2 ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash  \" ' " ))
  nil 0)


(defun cpp-cmake-compile-run ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo ; cd build ; cmake --build . --config Debug --target all -- -j 2 ; echo ; ./*.out ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash  \" ' " ))
  nil 0)


(defun cpp-cmake-gdb ()
  (interactive)
  (call-process-shell-command
   (concat "konsole -e ' /bin/bash -c \" cd "
		   (file-name-directory (buffer-file-name))
		   " ; echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Debug  ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ; pwd ; echo ; cd build ; gdb *.out ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash  \" ' " ))
  nil 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Gnome-terminal ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun cpp-test ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \" echo ; echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Compile ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ;echo ;  ls -al ; pwd ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )


;; (defun cpp-compile ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \" echo ; echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Compile ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ;echo ;  g++ -o a.out -Wall -g *.cpp ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )

;; (defun cpp-cmake-build ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \" echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Build ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; mkdir build ; cd build ; cmake .. ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )


;; (defun cpp-cmake-test-compile ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \" echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Build ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; cd build ; cmake --build . --config Debug --target all -- -j 2 ; ctest -j2 -C Debug -T test --output-on-failure echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )


;; (defun cpp-cmake-compile ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \" echo; cd build ; cmake --build . --config Debug --target all -- -j 2 ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )

;; (defun cpp-cmake-compile-run ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \" echo ; cd build ; cmake --build . --config Debug --target all -- -j 2 ; echo ; ./*.out ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )

;; (defun cpp-compile-and-run ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \"echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Compile ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ;echo ; g++ -o a.out -Wall -g *.cpp ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; ./a.out ; read  -n 1 ; exit ; exec bash \"")
;;   )


;; (defun cpp-gdb ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \"echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Debug  ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ; pwd ; echo ; gdb a.out ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )

;; (defun cpp-cmake-gdb ()
;;   (interactive)
;;   (shell-command "gnome-terminal -- bash -c \"echo ; echo ------- ------- ------- ------- ------- ------- ------- ; echo ------- ------- ------- Debug  ------- ------- ------- ; echo ------- ------- ------- ------- ------- ------- ------- ;echo ; pwd ; echo ; cd build ; gdb *.out ; echo ; echo ; echo ------ ------ ------ ------ ------ ------ ------ ; echo ------ ------ ------ Finish ------ ------ ------ ; echo ------ ------ ------ ------ ------ ------ ------ ; read  -n 1 ; exit ; exec bash \"")
;;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; GNU CPP

;;
;; Change M-x compile for:
(add-hook 'c-mode-common-hook
	  (lambda () (define-key c-mode-base-map (kbd "<f6> <left>") 'CMake_Clean_Gen ) ))

;;
;; Change M-x compile for:
(add-hook 'c-mode-common-hook
	  (lambda () (define-key c-mode-base-map (kbd "<f6> <right>") 'CMake_Compile) ))


;;
;; Change M-x compile for:
(add-hook 'c-mode-common-hook
	  (lambda () (define-key c-mode-base-map (kbd "<f6> <down>") 'CMake_Compile_Run) ))

;;
;; CMAKE
(require 'cmake-mode)

;; ;;
;; ;; Change M-x compile for:
;; (define-key global-map (kbd "<f6> <up>") 'cpp-cmake-build)

;; ;;
;; ;; Change M-x compile for:
;; (define-key global-map (kbd "<f6> <left>") 'cpp-cmake-compile) 

;; ;;
;; ;; Change M-x compile for:
;; (define-key global-map (kbd "<f6> <right>") 'cpp-cmake-compile-run)


;; ;;
;; ;; Change M-x compile for:
;; (define-key global-map (kbd "<f6> <down>") 'cpp-cmake-gdb) 


;; ;;
;; ;; Change M-x compile for:
;; (add-hook 'c-mode-common-hook
;; 	  (lambda () (define-key c-mode-base-map (kbd "<f5> <left>") 'compile) ))

;; 
;; Defautl GDB many windows
(setq gdb-many-windows t)

;; Change M-x gdb for:
(add-hook 'c-mode-common-hook
	  (lambda () (define-key c-mode-base-map (kbd "<f5> <up>") 'gdb) ))

