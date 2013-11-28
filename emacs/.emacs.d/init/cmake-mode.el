(autoload 'cmake-mode "cmake-mode" "CMake mode." t)
(add-to-list 'auto-mode-alist '("CMake" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))
