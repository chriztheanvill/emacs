
; Based on `upward-find-file' at http://emacswiki.org/emacs/CompileCommand
(defun cmake-project--upward-find-last-file (filename &optional startdir)
  "Move up directories until we stop finding a certain
filename. When we stop finding it, return the last directory in
which we found it. If the starting directory doesn't include it,
return nil. Start at startdir or . if startdir not given"

  (let ((dirname (expand-file-name
                  (if startdir startdir ".")))
        (found-tip nil) ; set if we stop finding it so we know when to exit loop
        (top nil))  ; top is set when we get
                    ; to / so that we only check it once

    (if (not (file-exists-p (expand-file-name filename dirname)))
        nil ; not even in initial dir!

      ;; While we've still got the file keep looking to find where we lose it
      (while (not (or found-tip top))
        ;; If we're at / set top flag.
        (if (string-match "^\\([a-zA-Z]:\\)?/$" (expand-file-name dirname))
            (setq top t)

          ;; Check for the file in the directory above
          (let ((parent (expand-file-name ".." dirname)))
            (if (not (file-exists-p (expand-file-name filename parent)))
                (setq found-tip t)
              ;; If we found it, keep going till we don't
              (setq dirname parent)))))

      (if (and found-tip (not top)) dirname nil))))


(defun cmake-project-find-root-directory ()
  (interactive)
  "Find the top-level CMake directory."
  ;; (message "++++++++++++++++++Testing my func")
  (file-name-as-directory
   (cmake-project--upward-find-last-file "CMakeLists.txt")))

(defun cmake-project-find-build-directory ()
  "Return an already-configured CMake build directory based on
current directory."
  (concat (file-name-as-directory (cmake-project-find-root-directory))
          cmake-project-default-build-dir-name))

