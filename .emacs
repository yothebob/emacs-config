(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(bongo-default-directory "/home/bbrodrick/Music")
 '(bongo-enabled-backends '(vlc mpv))
 '(centaur-tabs-mode t nil (centaur-tabs))
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(cyberpunk))
 '(custom-safe-themes
   '("b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "fd23280005748f3d1e15d2ce612dbe7003d7d551b5debd4287b6eeafd8994413" "c0f4b66aa26aa3fded1cbefe50184a08f5132756523b640f68f3e54fd5f584bd" "69b30fcd01e0bce8accefc2fd2f241b84ecbec13ec49719cdda5df550073886e" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" default))
 '(fci-rule-color "#14151E")
 '(global-company-mode t)
 '(global-display-line-numbers-mode t)
 '(initial-buffer-choice "~/Open-projects")
 '(package-selected-packages
   '(ac-emoji phps-mode cyberpunk-2019-theme cyberpunk-theme company-php company-anaconda sorcery-theme annoying-arrows-mode popup-kill-ring edit-color-stamp markdown-mode dmenu use-package ssh alert multi-term anaconda-mode mines centaur-tabs beacon neotree yaml-mode csv-mode vterm alarm-clock speed-type jupyter metar noaa sunshine auto-correct auto-complete blamer exwm zerodark-theme horizon-theme emamux avy afternoon-theme ample-theme multiple-cursors slack skewer-mode web-mode python))
 '(show-paren-mode t)
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
 '(centaur-tabs-active-bar-face ((t (:background "dark magenta"))))
 '(centaur-tabs-close-selected ((t (:inherit centaur-tabs-selected :foreground "medium blue"))))
 '(centaur-tabs-close-unselected ((t (:inherit centaur-tabs-unselected :weight semi-bold))))
 '(centaur-tabs-default ((t (:background "cornflower blue" :foreground "black"))))
 '(centaur-tabs-modified-marker-selected ((t (:inherit centaur-tabs-selected :weight semi-bold))))
 '(centaur-tabs-unselected ((t (:background "gray25" :foreground "magenta"))))
 '(centaur-tabs-unselected-modified ((t (:background "gray25" :foreground "magenta" :overline nil :underline nil)))))


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
(global-set-key (kbd "C-d") 'duplicate-line)


(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-'") 'comment-or-uncomment-region-or-line)


;; load in MELPA package support
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; run async shell command
(global-set-key (kbd "s-SPC") 'async-shell-command)


;; anaconda find function hothey
(global-set-key (kbd "C-`") 'anaconda-mode-find-definitions)

;; multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

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
(setq centaur-tabs-style "box")
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-gray-out-icons 'buffer)
(global-set-key (kbd "C-<prior>") 'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)

;; search for word on cursor
(global-set-key (kbd "C-*")
  (lambda ()
    (interactive)
    (re-search-forward (format "\\b%s\\b" (thing-at-point 'word)))))

;; global autocomplete mode (company-mode)
(global-company-mode)

;; launch Term
(global-set-key (kbd "s-<return>") 'term)

;; toggle menubar
(global-set-key [f9] 'menu-bar-mode)

;; better paste (using cuda keys)
(global-set-key [(control shift v)]  'popup-kill-ring)

;; display time, notify of appointments
(display-time)
(add-hook 'diary-hook 'appt-make-list)
(diary 0)
(appt-activate)


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
;; menu-bar-mode (turn off/on menubar)

;; Multi-term
;; (setq multi-term-program "/bin/bash")


;; Emoji!
(add-hook 'markdown-mode-hook 'ac-emoji-setup)
(add-hook 'git-commit-mode-hook 'ac-emoji-setup)
