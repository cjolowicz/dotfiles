(add-to-list 'auto-mode-alist '("/patches/" . diff-mode))

(eval-after-load 'diff-mode
  '(progn
     (set-face-attribute 'diff-header nil
                         :foreground "white" :background "brightblack")
     (set-face-attribute 'diff-file-header nil
                         :foreground "white" :background "brightblack")
     (set-face-attribute 'diff-context nil
                         :foreground "brightblack")
     (set-face-attribute 'diff-added nil
                         :foreground "darkgreen")
     (set-face-attribute 'diff-removed nil
                         :foreground "darkred")
     (set-face-attribute 'diff-changed nil
                         :foreground "darkblue")
     (set-face-attribute 'diff-indicator-added nil
                         :foreground "white" :background "darkgreen")
     (set-face-attribute 'diff-indicator-removed nil
                         :foreground "white" :background "darkred")
     (set-face-attribute 'diff-indicator-changed nil
                         :foreground "white" :background "darkblue")
     ))
