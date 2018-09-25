; ~/.emacs: executed by emacs(1) on startup.

; Set the load path.
(setq load-path (append '("~/.emacs.d/lisp") load-path))

; Set the custom file.
(setq custom-file "~/.emacs.d/init/custom.el")

; Load the init directory.
(require 'load-directory)
(load-directory "~/.emacs.d/init")
