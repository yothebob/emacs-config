;;; what-the-commit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "what-the-commit" "what-the-commit.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from what-the-commit.el

(autoload 'what-the-commit-insert "what-the-commit" "\
Insert a random message from whatthecommit.com at point." t nil)

(autoload 'what-the-commit "what-the-commit" "\
Add a random commit message from whatthecommit.com to the kill ring." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "what-the-commit" '("what-the-commit-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; what-the-commit-autoloads.el ends here
