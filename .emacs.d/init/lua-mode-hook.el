; Load Lua mode.
(require 'lua-mode)

(defun my-lua-mode-common-hook ()
  (set-default 'lua-indent-level 4)
  (setq indent-tabs-mode nil))

(add-hook 'lua-mode-common-hook 'my-lua-mode-common-hook)
