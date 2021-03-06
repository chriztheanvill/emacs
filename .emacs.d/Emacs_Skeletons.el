
;;
;; Skeleton C/C++
;; C
(define-skeleton skeleton-CMain
  "Short description: C"
	   "/***\n* "
	   (file-name-nondirectory (buffer-file-name))
	   " -- " str \n
	   "*" \n
	   "* Written on " (format-time-string "%A, %e %B %Y.") \n
	   "***/" > \n \n
	   "#include <stdio.h>" \n
	   "//#include \""
	   (file-name-sans-extension
		(file-name-nondirectory (buffer-file-name)))
	   ".h\"" \n \n
	   "int main()" \n
	   "{" > \n
	   > _ \n
	   > "return 0;" \n
	   "}" > \n
  )

;;
;; C++ Skeleton
(define-skeleton skeleton-C++Main
  "Short description: C++"
	   "//"
	   "// ---> Main File: "
	   (file-name-nondirectory (buffer-file-name))
	   " <---" \n
	   "/*" \n
	   "*" \n
	   "* Description: " str \n
	   "*" \n
	   "* Written on " (format-time-string "%A, %e %B %Y.") \n
	   "*/" > \n \n
	   "//-------------------------------//" \n \n
	   "#include <iostream>" \n
	   > \n
	   "//-------------------------------//" \n \n
	   "//-------------------------------//" \n \n
	   "int main([[maybe_unused]] int argc, [[maybe_unused]] char* argv[]) {" \n
	   "// Code..." > \n
	   > _ \n
	   > "return 0;" \n
	   "}" > \n
	   "//-------------------------------//" \n \n
	   "//-------------------------------//" \n \n
  )


;;
;; CMake Skeleton
(define-skeleton skeleton-CMake-C++
  "Short description: CMake C++"
       "## " \n
	   "## Description: " str \n
	   "## Written on: " (format-time-string "%A, %e %B %Y.") \n
       "## " \n
       > \n
       "## CMake Minimum " \n
       "cmake_minimum_required(VERSION 3.18) " \n
	   > \n
	   "## Project Name." \n
	   "project("str")" \n
       > \n
	   "## Options to be used " \n
       "add_compile_options(-Wall) " \n
	   > \n
       "## Will make a -g" \n
       "set(CMAKE_BUILD_TYPE Debug)" \n
       "set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -std=c++14\")" \n
       > \n
       "## Where the project are going to saved" \n
       "set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)" \n
       "set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)" \n
       > \n
       "## Where the headers will going to be saved" \n
       "include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)" \n
       > \n
       "##" \n
       "add_executable(" \n
       > _ \n
       "sameNameProject" \n
       "src/.cpp" \n
       ")" \n
       > \n
       "## Libraries" \n
       "add_library(" \n
       "XXX src/.cpp" \n
       ")" \n
       > \n
       "## Links" \n
       "target_link_libraries(" \n
       "sameNameProject" \n
       "XXX " \n
       ")" \n
       > \n
  )


;; ;; C++ Class
(eval-after-load 'autoinsert
   '(define-auto-insert '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ Class skeleton")
 	 '(
 	   "Short description: C++ Class"
 	   "/***\n* " \n
 	   "* Class Name: "
 	   (file-name-nondirectory (buffer-file-name))
 	   " -- " str \n
 	   "*" \n
 	   "* Written on " (format-time-string "%A, %e %B %Y.") \n
 	   "***/" > \n \n
 	   "//-------------------------------//" \n \n
 	   "#include <iostream>" \n \n
 	   "//-------------------------------//" \n \n
 	   "#include \""
 	   (file-name-sans-extension
 		(file-name-nondirectory (buffer-file-name)))
 	   ".h\"" \n \n
 	   > \n
 	   > \n
 	   "//-------------------------------//" \n
	   > \n
 	   "//Constructor:"\n
 	   (file-name-sans-extension
 		(file-name-nondirectory (buffer-file-name)))
 	   "::"
 	   (file-name-sans-extension
 		(file-name-nondirectory (buffer-file-name)))
 	   "(){" \n \n
 	   >"// Code..."\n
 	   >"}"\n
 	   "//-------------------------------//" \n \n 
 	   "//Destructor:"\n
 	   "//"
 	   (file-name-sans-extension
 		(file-name-nondirectory (buffer-file-name)))
 	   "::~"
 	   (file-name-sans-extension
 		(file-name-nondirectory (buffer-file-name)))
 	   "(){" \n
 	   > \n
 	   >"// Code..."\n
 	   >"//}"\n
 	   "//-------------------------------//" \n \n
 	   "//Getters:" \n \n \n
 	   "//-------------------------------//" \n \n
 	   "//Setters:" \n \n
 	   "//-------------------------------//" \n \n
	   > \n
	   > _
 	   )))


;; C++ Header.
(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.\\(h?\\|hpp\\)\\'" . "C Header skeleton")
	 '(
	   "Short description: Header C++"
	   "/***\n* "
	   (file-name-nondirectory (buffer-file-name))
	   " -- " str \n
	   "*" \n
	   "* Written on " (format-time-string "%A, %e %B %Y.") \n
	   "***/" > \n \n
	   "#ifndef _"
	   (file-name-sans-extension
		        (file-name-nondirectory (buffer-file-name)))
	   "_H" \n
	   "#define _"
	   (file-name-sans-extension
		        (file-name-nondirectory (buffer-file-name)))
	   "_H" \n \n
	   "//-------------------------------//" \n
	   "// #include <>"\n
  	   "// #include \"\""\n
	   "//-------------------------------//" \n \n
	   "class "
	   (file-name-sans-extension
		        (file-name-nondirectory (buffer-file-name)))
	   "{" \n
	   >"public:" \n
	   > (file-name-sans-extension
		        (file-name-nondirectory (buffer-file-name)))
	   "();" \n
	   > "//~"(file-name-sans-extension
		        (file-name-nondirectory (buffer-file-name)))
	   "();" \n
	   > _ \n \n
	   > "// Getters:" \n \n \n
	   > "// Setters:" \n \n \n
	   >"protected:" \n
	   > \n \n
	   >"private:"\n
	   > \n \n
	   >"};" \n \n
	   >"//-------------------------------//" \n \n
	   >"#endif "
	   > "//  _"
	   > (file-name-sans-extension
		        (file-name-nondirectory (buffer-file-name)))
	   "_H" \n )))

