(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(tsdh-dark))
 '(custom-safe-themes
   '("c0f4b66aa26aa3fded1cbefe50184a08f5132756523b640f68f3e54fd5f584bd" default))
 '(font-use-system-font t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(avy zerodark-theme))
 '(save-place-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 115 :width normal)))))


(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))
(global-set-key (kbd "C-d") 'duplicate-line)


(global-set-key (kbd "C-'") 'comment-or-uncomment-region)


(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(global-set-key [(control shift up)]  'move-line-up)



(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key [(control shift down)]  'move-line-down)


;; set up MELPA packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; jump to a letter with hotkeys
(global-set-key (kbd "C-;") 'avy-goto-char)


;; jump to 2 chars with hotkeys
(global-set-key (kbd "C-:") 'avy-goto-char-2)




