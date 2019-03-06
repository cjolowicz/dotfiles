; Hide startup message.
(setq inhibit-startup-message t)

; Change yes/no questions to y/n type.
(fset 'yes-or-no-p 'y-or-n-p)

; Ignore case in searches and matches.
(setq case-fold-search t)

; Do not backup files.
(setq make-backup-files 'nil)

; Do not ask for confirmation when reverting a buffer.
(setq revert-without-query '(".*"))

; Disable truncation.
(setq default-truncate-lines nil)
(setq truncate-partial-width-windows default-truncate-lines)

; Scroll only one line when I move past the bottom of the screen.
(setq scroll-step 1)

; Set coding system.
(set-keyboard-coding-system 'mule-utf-8)
(set-terminal-coding-system 'mule-utf-8)

; See unfinished commands.
(setq echo-keystrokes 0.1)

; Enable upcase and downcase commands.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; Enable narrow-to-* commands.
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

; Enable setting goal column for C-n and C-p.
(put 'set-goal-column 'disabled nil)

; Hide menubar.
(menu-bar-mode -1)

; Enable syntax highlighting.
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

; Highlight regions.
(setq transient-mark-mode t)

; Display column number in mode-line.
(setq column-number-mode t)

; Show current time in mode-line.
(setq display-time-24hr-format t) ;(setq display-time-day-and-date t)
(display-time)

; Be picky about whitespace.
(set-default 'whitespace-silent                  t)
(set-default 'whitespace-check-indent-whitespace nil)
(set-default 'show-trailing-whitespace           t)
(set-default 'require-final-newline              t)
;(whitespace-global-mode 1)

; Avoid bright background colors in smerge-mode.
(eval-after-load 'smerge-mode
  '(progn
     (set-face-attribute 'smerge-markers nil :foreground "white" :background "brightblack")
     (set-face-attribute 'smerge-refined-added nil :background "darkgreen")
     (set-face-attribute 'smerge-refined-removed nil :background "darkred")
     (set-face-attribute 'smerge-other nil :background "darkgreen")
     (set-face-attribute 'smerge-mine nil :background "darkred")
     ))

; Load the srcery theme.
(load-theme 'srcery t)
