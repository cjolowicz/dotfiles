(fset 'swap-windows
   "\C-xb\C-m\C-xo\C-xb\C-m\C-xo\C-xb\C-m")

(fset 'python-backtrace-goto-file-line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\" \"wbf ,wbxgoto line" 0 "%d")) arg)))
