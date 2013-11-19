; Add magit mode.
(require 'magit)

; Add w3m mode.
(require 'w3m-load)

; Add fill-column indicator.
(require 'fill-column-indicator)

; Add clearsilver mode.
(autoload 'cs-mode "cs-mode" "Clearsilver mode." t)

; Add expurgate mode.
(autoload 'expurgate-mode "expurgate-mode" "eXpurgate mode." t)

; Add CMake mode.
(autoload 'cmake-mode "cmake-mode" "CMake mode." t)

; Add Lua mode.
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

; Add MoinMoin mode.
(autoload 'moinmoin-mode "moinmoin-mode" "MoinMoin editing mode." t)

; Tell emacs about some file extensions.
(add-to-list 'auto-mode-alist '("\\.cxx$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.fop\?$" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\?$" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.xhtml$" . html-mode))
(add-to-list 'auto-mode-alist '("CMake" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))
(add-to-list 'auto-mode-alist '("mutt-" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.eml$" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.cs$" . cs-mode))
(add-to-list 'auto-mode-alist '("/patches/" . diff-mode))
(add-to-list 'auto-mode-alist '("expurgate.*\\.conf$" . expurgate-mode))
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.wiki$" . moinmoin-mode))

; Load and configure graphviz dot mode.
(load "graphviz-dot-mode")
