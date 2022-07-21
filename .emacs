(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(bongo-enabled-backends '(vlc mpv))
 '(centaur-tabs-background-color "black")
 '(centaur-tabs-mode nil nil (centaur-tabs))
 '(centaur-tabs-plain-icons t)
 '(centaur-tabs-set-icons t)
 '(centaur-tabs-style "box")
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(zerodark))
 '(custom-safe-themes
   '("171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "f24121b2dbfbe78bd722a767d6a020561ac1ca4a21b8f7ff6b198e074d2b214b" "0ac7d13bc30eac2f92bbc3008294dafb5ba5167f2bf25c0a013f29f62763b996" "3a78cae35163bb71df460ebcfdebf811fd7bc74eaa15428c7e0bccfd4f858d30" "94a94c957cf4a3f8db5f12a7b7e8f3e68f686d76ae8ed6b82bd09f6e6430a32c" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "fd23280005748f3d1e15d2ce612dbe7003d7d551b5debd4287b6eeafd8994413" "c0f4b66aa26aa3fded1cbefe50184a08f5132756523b640f68f3e54fd5f584bd" "69b30fcd01e0bce8accefc2fd2f241b84ecbec13ec49719cdda5df550073886e" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" default))
 '(display-time-mode t)
 '(fci-rule-color "#14151E")
 '(font-use-system-font t)
 '(fringe-mode 6 nil (fringe))
 '(global-company-mode t)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-echo-area-message nil)
 '(initial-buffer-choice "~/Open-projects")
 '(linum-format 'dynamic)
 '(org-babel-load-languages '((emacs-lisp . t) (python . t) (shell . t)))
 '(org-support-shift-select 'always)
 '(package-selected-packages
   '(vterm smex god-mode atom-one-dark-theme go-mode sweet-theme the-matrix-theme all-the-icons dashboard counsel-tramp frontside-javascript dark-krystal-theme cherry-blossom-theme evil emmet-mode vlf what-the-commit web-server company-web all ac-emoji phps-mode cyberpunk-2019-theme cyberpunk-theme company-php company-anaconda popup-kill-ring edit-color-stamp markdown-mode use-package alert anaconda-mode centaur-tabs beacon yaml-mode csv-mode alarm-clock auto-correct auto-complete blamer zerodark-theme horizon-theme emamux avy afternoon-theme ample-theme multiple-cursors skewer-mode web-mode python))
 '(pdf-view-midnight-colors '("#dddddd" . "#000000"))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal))))
 '(centaur-tabs-active-bar-face ((t (:background "pale green"))))
 '(centaur-tabs-close-selected ((t (:inherit centaur-tabs-selected :foreground "OliveDrab3"))))
 '(centaur-tabs-close-unselected ((t (:inherit centaur-tabs-unselected :weight semi-bold))))
 '(centaur-tabs-default ((t (:background "lime green" :foreground "black"))))
 '(centaur-tabs-modified-marker-selected ((t (:inherit centaur-tabs-selected :weight semi-bold))))
 '(centaur-tabs-selected ((t (:background "black" :foreground "white" :overline "pale green" :underline nil))))
 '(centaur-tabs-selected-modified ((t (:background "black" :foreground "white" :overline "pale green" :underline nil))))
 '(centaur-tabs-unselected ((t (:background "gray25" :foreground "medium orchid"))))
 '(centaur-tabs-unselected-modified ((t (:background "gray23" :foreground "steel blue" :overline nil :underline nil)))))


(defun move-region-down ()
    (interactive)
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)end))))
  (next-line)
  (kill-line)
  (region-beginning)
  (previous-line)
  (yank)
  )


;; (defun move-text-down (arg)
;;   "Move region (transient-mark-mode active) or current line
;;   arg lines down."
;;   (interactive)
;;   (move-text-internal arg))
;; (global-set-key [(control shift down)]  'move-text-up)

;; (defun move-text-up (arg)
;;   "Move region (transient-mark-mode active) or current line
;;   arg lines up."
;;   (interactive)
;;   (move-text-internal (- arg)))
;; (global-set-key [(control shift down)]  'move-text-down)



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


(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun duplicate-start-of-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (duplicate-line)))

(defun duplicate-region ()
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))

(global-set-key [(control shift d)]  'duplicate-start-of-line-or-region)


(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-'") 'comment-or-uncomment-region-or-line)



(defun xah-search-current-word ()
  "Call `isearch' on current word or text selection.
“word” here is A to Z, a to z, and hyphen 「-」 and underline 「_」, independent of syntax table.
URL `http://xahlee.info/emacs/emacs/modernization_isearch.html'
Version 2015-04-09"
  (interactive)
  (let ( $p1 $p2 )
    (if (use-region-p)
        (progn
          (setq $p1 (region-beginning))
          (setq $p2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq $p1 (point))
        (right-char)
        (skip-chars-forward "-_A-Za-z0-9")
        (setq $p2 (point))))
    (setq mark-active nil)
    (when (< $p1 (point))
      (goto-char $p1))
    (isearch-mode t)
    (isearch-yank-string (buffer-substring-no-properties $p1 $p2))))



(defun better-kill-line()
  " allways kill the whole line "
  (interactive)
  (move-beginning-of-line 1)
  (kill-line))
(global-set-key (kbd "C-k") 'better-kill-line)


(defun better-kill-word()
  " allways kill the whole word "
  (interactive)
  (forward-word)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "M-d") 'better-kill-word)


(defun stringify-word()
  (interactive)
  (backward-word)
  (insert "'")
  (forward-word)
 (insert "' "))

(global-set-key (kbd "C-c w w") 'stringify-word)



;; load in MELPA package support
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; anaconda find function hothey
(global-set-key (kbd "C-`") 'anaconda-mode-find-definitions)

;; better i-search
(global-set-key (kbd "C-c s") 'xah-search-current-word)
(global-set-key (kbd "C-s") 'isearch-forward)

;; zoom in/out
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-increase)

;; multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
;; (global-set-key (kbd "C->")         'mc/mark-next-word-like-this)
;; (global-set-key (kbd "C-<")         'mc/mark-previous-word-like-this)
;; (global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)

;; upcase-region (ALL CAP REGION)
(global-set-key (kbd "C-c C-u") 'upcase-region)

;; find & replace (only replace in visual block)
(global-set-key [(control shift f)] 'replace-string)

;; avy go to any char C-: b == a hotkey for any letter b
(global-set-key (kbd "C-;") 'avy-goto-char)

;; avy go to any char C-: b == a hotkey for any letter bc
(global-set-key (kbd "C-:") 'avy-goto-char-2)

;;grep-find
(global-set-key [(control shift s)] 'grep-find)

;; neotree toggle
(global-set-key [f8] 'neotree-toggle)

;; Beacon cursor flash on
(beacon-mode 1)

;; anaconda mode enabled 
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; centaur
(use-package centaur-tabs
  :demand
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))


(global-set-key [f7] 'centaur-tabs-mode)
(centaur-tabs-headline-match)
;; (setq centaur-tabs-style "box")
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-gray-out-icons 'buffer)
(global-set-key (kbd "C-<prior>") 'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)

;; search for word on cursor
(global-set-key (kbd "C-*")
  (lambda ()
    (interactive)
    (re-search-forward (format "\\b%s\\b" (thing-at-point 'word)))))

;; search for .. (dired mode)
(global-set-key (kbd "C-.")
  (lambda ()
    (interactive)
    (search-backward "..")))

;; global autocomplete mode (company-mode)
(global-company-mode)

(use-package vterm
  :ensure t)

;; launch vTerm
(global-set-key (kbd "s-<return>")
(lambda ()
  (interactive)
  (vterm)))

(define-key vterm-mode-map (kbd "C-c C-c") 'vterm--self-insert)

;; launch ansi term
(global-set-key (kbd "s-S-<return>")
(lambda ()

  (interactive)
  (ansi-term "/bin/bash")))

;; eshell
(global-set-key (kbd "C-c e s") 'eshell)

;; launch eww in brave search 
(global-set-key (kbd "C-c e w ")
(lambda ()
  (interactive)
  (eww "https://duckduckgo.com/")))


;; launch eshell
(global-set-key (kbd "C-c e s")
(lambda ()

  (interactive)
  (eshell "/bin/bash"))) 

;; launch ansi-term
(global-set-key (kbd "s-S-<return>")
(lambda ()
  (interactive)
  (ansi-term "/bin/bash"))) 

;; launch eww search
(global-set-key (kbd "C-c e w")
(lambda ()
  (interactive)
  (eww "https://duckduckgo.com"))) 

;; toggle menubar
(global-set-key [f9] 'menu-bar-mode)
;; default off
(menu-bar-mode 0)

;; better paste (using cuda keys)
(global-set-key [(control shift v)]  'popup-kill-ring)

;; display time, notify of appointments
(display-time)
(add-hook 'diary-hook 'appt-make-list)
(diary 0)
(appt-activate)


(defun print-joke ()
  "gets a programming dad joke and displays it"
  ;; (interactive)
  (shell-command
   ;; beginning and end of buffer
   ;; command and parameters
   "bash ~/.tell_joke.sh"
   (split-window-horizontally)))

;;custom dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)

(add-to-list 'dashboard-items '(agenda) t)
;; to show weekly schedule
(setq dashboard-week-agenda t)

;; on startup tell joke
;; (print-joke)

;; HOT KEYS TO NOT FORGET!!!!
;; C-<space> = mark line (highlight, move up/down to highlight those)
;; M-gg = goto line
;; (edit in read-only mode) C-x C-q
;; M-% = replace-query
;; C-x ( == start marco
;; C-x ) == end macro
;; C-x e == run marco
;; C-u == repeat function (ex: C-u 20 marco = run macro 20 times)
;; C-h f == see docs for a function
;; M-& == async-shell-command
;; M-! == shell-command
;; menu-bar-mode (turn off/on menubar)
;; C-x g == magit 


;; Emoji!
(add-hook 'markdown-mode-hook 'ac-emoji-setup)
(add-hook 'git-commit-mode-hook 'ac-emoji-setup)

;; all hotkey
(global-set-key (kbd "C-x a l") 'all)


;; on start

(global-set-key (kbd "C-c b l") 'bongo-library)
(global-set-key (kbd "C-x p p") 'bongo-pause/resume)

(put 'upcase-region 'disabled nil)

(global-set-key (kbd "C-x a s") 'dired-hide-subdir)
(put 'downcase-region 'disabled nil)
