(defun find-emacs-conf ()
  (interactive)
  (find-file "~/.emacs"))

(defun reload-emacs-conf ()
  (interactive)
  (load-file "~/.emacs"))

(defun save-macro (name)
  "save a macro. Take a name as argument and save the last
   defined macro under this name at the end of your .emacs"
  (interactive "SName of the macro :")     ; ask for the name of the macro
  (kmacro-name-last-macro name)            ; use this name for the macro
  (find-file "~/.emacs.d/init/kmacros.el") ; open the kmacros.el file
  (goto-char (point-max))                  ; go to the end of the macros.el
  (newline)                                ; insert a newline
  (insert-kbd-macro name)                  ; copy the macro
  (save-buffer)                            ; save the buffer
  (kill-buffer nil))                       ; kill the current buffer

(defun kill-unmodified-buffers ()
  "Kill all unmodified buffers"
  (interactive)
  (mapcar
   (lambda (buffer)
     (and (not (buffer-modified-p buffer))
          (not (eq buffer (current-buffer)))
          (kill-buffer buffer)))
     (buffer-list)))

(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR.
  The CHAR is replaced and the point is put before CHAR."
  (insert char)
  (forward-char -1))

(defun scroll-up-1 ()
  "Scroll up by 1 line"
  (interactive)
  (scroll-up 1))

(defun scroll-down-1 ()
  "Scroll down by 1 line"
  (interactive)
  (scroll-down 1))

(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun decrement-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (-(string-to-number (match-string 0)) 1))))
