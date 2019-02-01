(defun add-to-auto-mode-alist (mode patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist
                 (cons pattern mode))))

(require 'js2-mode)

; Use js2-jsx-mode for Javascript files.
(add-to-auto-mode-alist 'js2-jsx-mode
 (list
  "\\.js\\'"
  "\\.jsx\\'"
  "\\.babelrc\\'"
  "\\.json\\'"
  ))

; Use js2-jsx-mode for scripts with a node shebang.
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

; Use flow-minor-mode when there is a //@flow declaration at the first
; line of the file and a .flowconfig file is present in the project.
; This requires https://github.com/an-sh/flow-minor-mode.
(add-hook 'js2-mode-hook 'flow-minor-enable-automatically)
