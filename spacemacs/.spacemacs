;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(auto-completion
     better-defaults
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t
            c-c++-backend 'rtags)
     cmake
     docker
     emacs-lisp
     graphviz
     git
     helm
     html
     (javascript :variables
                 javascript-fmt-tool 'prettier
                 js2-basic-offset 2
                 js-indent-level 2
                 js-switch-indent-offset 2
                 node-add-modules-path t)
     markdown
     multiple-cursors
     nginx
     (org :variables
          org-enable-github-support t
          org-enable-bootstrap-support t
          org-enable-org-journal-support t
          org-enable-hugo-support t
          org-enable-trello-support t)
     osx
     prettier
     python
     react
     rust
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     spell-checking
     sql
     syntax-checking
     themes-megapack
     theming
     treemacs
     version-control
     xclipboard
     yaml
     )
   dotspacemacs-additional-packages '(forge)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives nil
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(ample ample-light)
   dotspacemacs-mode-line-theme '(spacemacs :separator utf-8 :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server nil
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server t
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq exec-path (cons "/Users/cjolowicz/.pyenv/shims" exec-path)))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Use GNU ls.
  ;; https://github.com/syl20bnr/spacemacs/issues/10957
  (let ((gls (executable-find "gls")))
    (when gls
      (setq insert-directory-program gls
            dired-listing-switches "-aBhl --group-directories-first")))

  ;; Always prefer horizontal splits.
  (setq split-height-threshold nil)

  ;; Display TAB as four-characters wide.
  (setq-default tab-width 4)

  ;; Tell magit where we keep our git repositories.
  (setq magit-repository-directories '("~/Code/" . 2))

  ;; Open magit status in same window.
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)

  ;; Enable use of spacemacs as GIT_EDITOR.
  (global-git-commit-mode t)

  ;; Use forge package.
  (use-package forge :after magit))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode counsel-css company-web web-completion-data helm-rtags google-c-style flycheck-rtags disaster company-rtags rtags company-c-headers clang-format sqlup-mode sql-indent helm-ctest cmake-mode cmake-ide levenshtein toml-mode racer flycheck-rust cargo rust-mode nginx-mode dockerfile-mode docker tablist docker-tramp xcscope cython-mode company-anaconda anaconda-mode pythonic json-navigator hierarchy json-mode json-snatcher json-reformat company-tern dash-functional web-beautify tern prettier-js livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl impatient-mode simple-httpd add-node-modules-path yaml-mode insert-shebang helm-gtags ggtags flycheck-bashate fish-mode counsel-gtags company-shell yasnippet-snippets xterm-color unfill smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-brain mwim multi-term mmm-mode markdown-toc markdown-mode magit-svn magit-gitflow magit-popup htmlize helm-org-rifle helm-gitignore helm-git-grep helm-company helm-c-yasnippet gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip evil-org evil-magit magit transient git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company browse-at-remote auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-evil toc-org symon string-inflection spaceline-all-the-icons restart-emacs request rainbow-delimiters popwin persp-mode pcre2el password-generator paradox overseer org-plus-contrib org-bullets open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish define-word counsel-projectile column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
