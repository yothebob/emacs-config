
(tool-bar-mode 0)
(cua-mode 1)
(global-display-line-numbers-mode t)

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


(defun stringify-word()
  (interactive)
  (backward-word)
  (insert "'")
  (forward-word)
 (insert "' "))

(global-set-key (kbd "C-c w w") 'stringify-word)



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


;; load in MELPA package support
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; better i-search
(global-set-key (kbd "C-c s") 'xah-search-current-word)

;; zoom in/out
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-increase)

;; upcase-region (ALL CAP REGION)
(global-set-key (kbd "C-c C-u") 'upcase-region)

;; find & replace (only replace in visual block)
(global-set-key [(control shift f)] 'replace-string)

(use-package avy
  :ensure t)

;; avy go to any char C-: b == a hotkey for any letter b
(global-set-key (kbd "C-;") 'avy-goto-char)

;; avy go to any char C-: b == a hotkey for any letter bc
(global-set-key (kbd "C-:") 'avy-goto-char-2)

;;grep-find
(global-set-key [(control shift s)] 'grep-find)

;; Beacon cursor flash on
(use-package beacon
  :ensure t)
(beacon-mode 1)


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
;;(use-package company-mode
;;  :ensure t)
;;(global-company-mode)

;; launch Term
(global-set-key (kbd "S-<return>")
(lambda ()
  (interactive)
  (term "/bin/bash")))
  
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

;; toggle menubar
(global-set-key [f9] 'menu-bar-mode)
(menu-bar-mode 0);; default off

;; better paste (using cuda keys)
(use-package popup-kill-ring
  :ensure t)
(global-set-key [(control shift v)]  'popup-kill-ring)

;; display time, notify of appointments
(display-time)
;; (add-hook 'diary-hook 'appt-make-list)
;; (diary 0)
;; (appt-activate)

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


;; all hotkey
(global-set-key (kbd "C-x a l") 'all)

(put 'upcase-region 'disabled nil)


