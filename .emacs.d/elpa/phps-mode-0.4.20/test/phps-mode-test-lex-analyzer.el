;;; phps-mode-test-lex-analyzer.el --- Tests for lex-analyzer -*- lexical-binding: t -*-

;; Copyright (C) 2018-2022  Free Software Foundation, Inc.


;;; Commentary:


;; Run from terminal make test-lex-analyzer


;;; Code:


(require 'ert)
(require 'phps-mode)
(require 'phps-mode-test)

(defun phps-mode-test-lex-analyzer--process-changes ()
  "Test `phps-mode-lex-analyzer--process-changes'."

  (phps-mode-test--with-buffer
   "\n<html>\n<?php\n/**\n * Bla\n */"
   "Process changes before current tokens"
   (goto-char (point-min))
   (insert "<?php echo 'test';\n?>")
   (should (equal
            (phps-mode-lex-analyzer--process-changes)
            '((RUN-FULL-LEXER) (FOUND-NO-HEAD-TOKENS 1)))))

  (phps-mode-test--with-buffer
   "\n<html>\n<?php\n/**\n * Bla\n */"
   "Process changes without changes"
   (should (equal
            (phps-mode-lex-analyzer--process-changes)
            '((RUN-FULL-LEXER) (FOUND-NO-CHANGE-POINT-MINIMUM)))))

  (phps-mode-test--with-buffer
   "\n<html>\n<?php\n/**\n * Bla\n */"
   "Process changes after existing tokens"
   (goto-char (point-max))
   (insert "\necho 'I was here';\n")
   (should (equal
            (phps-mode-lex-analyzer--process-changes)
            '((INCREMENTAL-LEX 15)))))

  )

(defun phps-mode-test-lex-analyzer--get-moved-imenu () 
  "Test for moving imenu index."

  ;; (message "Moved imenu %s" (phps-mode-lex-analyzer--get-moved-imenu '(("myNamespace" ("myClass" ("myFunctionA" . 108) ("myFunctionB" . 161)))) 0 2))

  (should (equal
           '(("myNamespace" ("myClass" ("myFunctionA" . 110) ("myFunctionB" . 163))))
           (phps-mode-lex-analyzer--get-moved-imenu '(("myNamespace" ("myClass" ("myFunctionA" . 108) ("myFunctionB" . 161)))) 0 2)))

  (should (equal
           '(("myNamespace" ("myClass" ("myFunctionA" . 106) ("myFunctionB" . 159))))
           (phps-mode-lex-analyzer--get-moved-imenu '(("myNamespace" ("myClass" ("myFunctionA" . 108) ("myFunctionB" . 161)))) 0 -2)))

  (should (equal
           '(("myNamespace" ("myClass" ("myFunctionA" . 108) ("myFunctionB" . 171))))
           (phps-mode-lex-analyzer--get-moved-imenu '(("myNamespace" ("myClass" ("myFunctionA" . 108) ("myFunctionB" . 161)))) 110 10)))

  (should (equal
           '(("myNamespace" ("myClass" ("myFunctionA" . 108) ("myFunctionB" . 161))))
           (phps-mode-lex-analyzer--get-moved-imenu '(("myNamespace" ("myClass" ("myFunctionA" . 108) ("myFunctionB" . 161)))) 180 10)))

  )

(defun phps-mode-test-lex-analyzer--comment-uncomment-region ()
  "Test (comment-region) and (uncomment-region)."

  (phps-mode-test--with-buffer
   "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract implements myInterface {\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}\n"
   "Comment object-oriented file with bracket-less namespace, class that extends and implements and functions with optional arguments"
   (comment-region (point-min) (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\n/* namespace myNamespace;\nclass myClass extends myAbstract implements myInterface {\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n} */\n"))))

  (phps-mode-test--with-buffer
   "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract implements myInterface {\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}\n"
   "Comment part of object-oriented file with bracket-less namespace, class that extends and implements and functions with optional arguments"
   (comment-region 62 86)
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract /* implements myInterface */ {\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}\n"))))

  (phps-mode-test--with-buffer
   "// <?php\n// namespace myNamespace;\n// class myClass extends myAbstract implements myInterface {\n//    public function myFunctionA($myArg = null) {}\n//    protected function myFunctionB($myArg = 'abc') {}\n//}\n"
   "Uncomment object-oriented file with bracket-less namespace, class that extends and implements and functions with optional arguments"
   (uncomment-region (point-min) (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "// <?php\n namespace myNamespace;\n class myClass extends myAbstract implements myInterface {\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}\n"))))

  (phps-mode-test--with-buffer
   "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract/*  implements myInterface  */{\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}\n"
   "Uncomment part of object-oriented file with bracket-less namespace, class that extends and implements and functions with optional arguments"
   (uncomment-region 62 92)
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract implements myInterface {\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}\n"))))

  (phps-mode-test--with-buffer
   "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract/*  implements myInterface  */{\n    // public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}"
   "Comment region were some of the region is already commented-out"
   ;; (message "Tokens %s" phps-mode-lexer-tokens)
   (comment-region (point-min) (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\n/* namespace myNamespace;\nclass myClass extends myAbstract *//*  implements myInterface  *//* { */\n    // public function myFunctionA($myArg = null) {}\n    /* protected function myFunctionB($myArg = 'abc') {}\n} */"))))

  (phps-mode-test--with-buffer
   "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract/*  implements myInterface  */{\n    public function myFunctionA($myArg = null) {}\n    /* protected function myFunctionB($myArg = 'abc') {} */\n}"
   "Un-comment region were some of the region is already un-commented 1"
   ;; (message "Tokens %s" phps-mode-lexer-tokens)
   (uncomment-region (point-min) (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\nnamespace myNamespace;\nclass myClass extends myAbstract implements myInterface {\n    public function myFunctionA($myArg = null) {}\n    protected function myFunctionB($myArg = 'abc') {}\n}"))))

  (phps-mode-test--with-buffer
   "<?php\n/**\n * My doc comment\n */\n$var = 'abc';\n"
   "Comment region were some of the region is in doc comment"
   ;; (message "Tokens %s" phps-mode-lexer-tokens)
   (comment-region (point-min) (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\n/**\n * My doc comment\n */\n/* $var = 'abc'; */\n"))))

  (phps-mode-test--with-buffer
   "<?php\n/** $var = '123'; */\n$var = 'abc';\n"
   "Un-comment region were some of the region is already un-commented 2"
   ;; (message "Tokens %s" phps-mode-lexer-tokens)
   (uncomment-region (point-min) (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\n$var = '123';\n$var = 'abc';\n"))))

  (phps-mode-test--with-buffer
   "<?php\n$var1 = '123';"
   "Comment region after changes has been made to buffer"
   (goto-char 19)
   (insert " def")
   (comment-region 7 (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\n/* $var1 = '123 def'; */"))))

  (phps-mode-test--with-buffer
   "<?php\n/* $var1 = '123'; */"
   "Un-comment region after changes has been made to buffer"
   (goto-char 22)
   (insert " def")
   (uncomment-region 7 (point-max))
   (let ((buffer-contents (buffer-substring-no-properties (point-min) (point-max))))
     (should (equal buffer-contents "<?php\n$var1 = '123 def';"))))

  )

(defun phps-mode-test-lex-analyzer ()
  "Run test for functions."
  ;; (setq debug-on-error t)
  (phps-mode-test-lex-analyzer--process-changes)
  (phps-mode-test-lex-analyzer--get-moved-imenu)
  (phps-mode-test-lex-analyzer--comment-uncomment-region))

(phps-mode-test-lex-analyzer)

(provide 'phps-mode-test-lex-analyzer)

;;; phps-mode-test-lex-analyzer.el ends here
