(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :no-error-if-file-is-missing)

(setq backup-directory-alist
      '((".*" . "~/.emacs.d/backups/")))

(use-package savehist
  :config
  (savehist-mode))

(recentf-mode 1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default inhibit-splash-screen t)
(setq-default cursor-type 'bar)

(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
               (display-buffer-no-window)
               (allow-no-window . t)))

(set-face-attribute 'default nil :font "ComicShannsMono Nerd Font Mono" :height 120)

(pixel-scroll-precision-mode 1)
(setq scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq display-line-numbers-type 'relative)

(use-package doom-modeline
  :straight t
  :after nerd-icons
  :init
  (doom-modeline-mode 1)
  (display-time-mode t)
  :config
  (setq doom-modeline-project-detection 'auto
	       doom-modeline-icon t
	       doom-modeline-analogue-clock nil
	       doom-modeline-lsp-icon t
	       doom-modeline-modal t
	       doom-modeline-modal-modern-icon t))

(use-package ef-themes
  :straight t
  :config
  (setq ef-themes-to-toggle '(ef-autumn ef-melissa-light))
  (ef-themes-select 'ef-autumn))

(use-package catppuccin-theme
  :straight t
  :defer t)

(use-package cyberpunk-theme
  :straight t
  :defer t)

(use-package doom-themes
  :straight t
  :defer t)

(use-package gruber-darker-theme
  :straight t
  :defer t)

(use-package nerd-icons
  :straight t
  :config
  (setq nerd-icons-scale-factor 1.1
	nerd-icons-font-family "ComicShannsMono Nerd Font Mono"))

(use-package nerd-icons-completion
  :straight t
  :after (nerd-icons marginalia)
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-dired
  :straight t
  :after nerd-icons
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package dired
  :hook
  (dired-mode . openwith-mode)
  :config
  (setq dired-auto-revert-buffer #'dired-directory-changed-p
	dired-free-space nil
	dired-listing-switches "-AGFhlv --group-directories-first --time-style=long-iso"
	openwith-associations '(
				("\\.pdf\\'" "zathura" (file)))))

(use-package openwith
  :straight t
  :after dired)

(use-package evil
  :straight t
  :init
  (setq evil-want-keybinding nil)
  :config
  (setq evil-want-integration t
	evil-vsplit-window-right t
	evil-auto-indent t
	evil-split-window-below t)
  (evil-mode)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (evil-set-undo-system 'undo-redo))

(use-package evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :straight t
  :after evil)

(use-package evil-mc
  :straight t
  :after evil
  :config
  (setq evil-mc-mode-line-text-cursor-color t)
  (global-evil-mc-mode 1))

(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode 1)
  (setq-default evil-surround-pairs-alist
		'(
		  (?\( . ("(" . ")"))
		  (?\< . ("<" . ">"))
		  (?\[ . ("[" . "]"))
		  (?\{ . ("{" . "}"))
		  (?\) . ("( " . " )"))
		  (?\> . ("< " . " >"))
		  (?\] . ("[ " . " ]"))
		  (?\} . ("{ " . " }"))
		  (?\` . ("`" . "`"))
		  ))
  )

(use-package avy
  :straight t
  :config
  (setq avy-all-windows t))

(use-package vertico
  :straight t
  :hook (after-init . vertico-mode)
  :config
  (setq vertico-cycle t
	vertico-count 10))

(use-package orderless
  :straight t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	read-buffer-completion-ignore-case t))

(use-package marginalia
  :straight t
  :hook
  (after-init . marginalia-mode))

(use-package company
  :straight t
  :config
  (setq company-idle-delay 0.2 
	company-minimum-prefix-length 2
	company-tooltip-align-annotations t
	company-tooltip-limit 5
	company-tooltip-minimum 5
	company-tooltip-offset-display 'lines
	company-format-margin-function 'company-vscode-dark-icons-margin)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection)
	("C-n" . company-select-next)
	("C-p" . company-select-previous)
	("M-<" . company-select-first)
	("M->" . company-select-last))
  :hook (after-init . global-company-mode)
  )

(use-package cape
  :straight t
  :bind ("C-c f" . cape-file)
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-emoji)
  :config
  ;; Silence then pcomplete capf, no errors or messages!
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
  ;; Ensure that pcomplete does not write to the buffer
  ;; and behaves as a pure `completion-at-point-function'.
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify))

(use-package consult
  :straight t)

(use-package consult-denote
  :straight t
  :after denote)

(use-package consult-denote
  :straight t
  :after denote)

(use-package consult-todo
  :straight t
  :after hl-todo)

(use-package hl-todo
  :straight t
  :hook (after-init . global-hl-todo-mode))

(use-package prog-mode
  :config (setq truncate-lines nil)
  :hook
  (prog-mode . (lambda ()
		 (flyspell-prog-mode)
		 (display-line-numbers-mode)
		 (display-fill-column-indicator-mode)
		 (electric-indent-mode)
		 (electric-pair-mode))))

(use-package lsp-mode
  :straight t
  :commands lsp
  :config
  (setq lsp-diagnostics-flycheck-enable t
	lsp-keymap-prefix "C-l"
	lsp-headerline-breadcrumb-enable nil
	lsp-idle-delay 0.5))

(use-package tree-sitter
  :straight t
  :config (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :straight t)

(use-package colorful-mode
  :straight t 
  :hook (prog-mode text-mode))

(use-package direnv
  :straight t
  :config
  (direnv-mode))

(use-package devdocs
  :straight t)

(use-package apheleia
  :straight t
  :config
  (add-to-list 'apheleia-formatters '(rustfmt . ("rustfmt" "--quiet" "--emit" "stdout" "--edition" "2024")))
  :hook (prog-mode . apheleia-mode))

(use-package rainbow-delimiters
  :straight t
  :defer t)

(use-package compile
  :config
  (setq compilation-scroll-output t))

(use-package fancy-compilation
  :straight t
  :after compile
  :commands (fancy-compilation-mode)
  :config
  (setq fancy-compilation-override-colors nil)
  :init
  (with-eval-after-load 'compile
    (fancy-compilation-mode)))

(use-package vterm
  :straight t
  :config
  (setq vterm-shell "nu"))

(use-package multi-vterm
  :straight t
  :after vterm)

(use-package magit
  :straight t
  :after seq
  :config
  (with-eval-after-load 'magit-mode
    (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
  (setopt magit-format-file-function #'magit-format-file-nerd-icons)
  (setq magit-show-long-lines-warning nil))

(use-package magit-todos
  :straight t
  :after magit
  :config
  (magit-todos-mode 1))

(use-package git-modes
  :straight t)

(use-package ediff
  :config
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package diff-hl
  :straight t
  :config
  (diff-hl-dired-mode t)
  :hook
  (prog-mode . diff-hl-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package blamer
  :straight t
  :defer t
  :config
  (setq blamer-idle-time 0.3
	blamer-view 'overlay-right)
  :custom-face
  (blamer-face ((t :foreground "#484741"
                   :background unspecified
                   :height 120
                   :italic t))))

(use-package dockerfile-mode
  :straight t
  :mode ("\\.Dockerfile\\'" "Dockerfile")
  :hook
  (dockerfile-mode . (lambda () (setq-local devdocs-current-docs '("docker")))))

(use-package groovy-mode
  :straight t
  :config
  (setq groovy-indent-offset 2))

(use-package odin-mode
  :straight (:type git :repo "https://git.sr.ht/~mgmarlow/odin-mode"))

(use-package java-ts-mode
  :mode ("\\.java\\'")
  :hook
  (java-ts-mode . (lambda () (setq-local devdocs-current-docs '("openjdk~21")))))

(use-package json-ts-mode
  :mode ("\\.json\\'" . json-ts-mode))

(use-package just-mode
  :straight t)

(use-package makefile-mode
  :hook
  (makefile-mode . (lambda () (setq-local devdocs-current-docs '("gnu_make")))))

(use-package markdown-mode
  :config
  (setq indent-tabs-mode nil)
  :hook
  (markdown-mode . (lambda () (setq-local devdocs-current-docs '("markdown")))))

(use-package nix-mode
  :straight t
  :mode "\\.nix\\'"
  :hook
  (nix-mode . (lambda () (setq-local devdocs-current-docs '("nix")))))

(use-package nushell-mode
  :straight t
  :hook
  (nushell-mode . (lambda () (setq-local devdocs-current-docs '("nushell")))))

(use-package python-mode
  :straight t
  :hook
  (python-mode . (lambda () (setq-local devdocs-current-docs '("python~3.13")))))

(use-package rst
  :hook ((rst-mode . eglot-ensure)
	 (rst-mode . display-line-numbers-mode)
	 (rst-mode . display-fill-column-indicator-mode)
	 (rst-mode . (lambda () (set-fill-column 80)))
	 (rst-mode . flymake-mode))
  :config
  (setq-local compilation-ask-about-save nil)
  (setq compile-command "make -k")
  (with-eval-after-load
      'eglot (add-to-list
	      'eglot-server-programs
	      '(rst-mode . ("esbonio")))
      )
  )

(use-package rust-ts-mode
  :mode ("\\.rs\\'" . rust-ts-mode)
  :hook ((rust-ts-mode . lsp-deferred)
	 (rust-ts-mode . (lambda () (set-fill-column 100)))
	 (rust-ts-mode . (lambda () (setq-local devdocs-current-docs '("rust")))))
  :config
  (setq compile-command "cargo b --all-features")
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (setq lsp-rust-features "all"))

(use-package cargo
  :straight t)

(use-package toml-ts-mode
  :mode ("\\.toml\\'" "Cargo\\.lock\\'"))

(use-package yaml-ts-mode
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package zig-mode
  :straight t
  :hook
  (zig-mode . (lambda () (setq-local devdocs-current-docs '("zig")))))

(use-package org
  :straight t
  :hook
  (org-mode . (lambda ()
		(visual-line-mode)
		(flyspell-mode)
		(display-line-numbers-mode)
		(org-superstar-mode)
		(org-indent-mode)
		(yas-minor-mode)))
  :config
  (setq org-todo-keywords
        '((sequence "TODO(t)" "PROG(p)" "PROJ(j)" "SENT(s)" "|" "DONE(d)" "CANC(c)" "PASS(a)")))
  (setq org-todo-keyword-faces
        '(("TODO" . "#ff5555") ("PROG" . "#ffb86c") ("PROJ" . "#8be9fd") ("SENT" . "#ff79c6")
          ("DONE" . "#50fa7b") ("CANC" . "#a4fcba") ("PASS" . "#44475a")))
  ;; Add these files to the agenda
  (setq org-clock-sound (expand-file-name "timer.wav" user-emacs-directory)
	org-agenda-files '("~/Notes/day-book.org")
	org-src-fontify-natively t)
  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers))

(use-package org-superstar
  :straight t
  :after org
  :config
  (setq org-hide-leading-stars nil)
  ;; This line is necessary.
  (setq org-superstar-leading-bullet ?\s)
  ;; If you use Org Indent you also need to add this, otherwise the
  ;; above has no effect while Indent is enabled.
  (setq org-indent-mode-turns-on-hiding-stars nil))

(use-package which-key
  :straight t
  :defer t
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode))

(use-package general
  :straight t
  :after evil
  :config
  (general-evil-setup t)
  (general-override-mode)

  ;; EViL bindings
  (general-define-key
   :states '(normal visual emacs)
   :keymaps 'override
   "U"  'evil-redo
   "C"  'evil-mc-make-cursor-move-next-line
   "%"  'mark-whole-buffer
   "_"  'expreg-expand
   "-"  'expreg-contract
   )

  (general-define-key
   :states '(normal visual emacs)
   :keymaps '(normal prog-mode-map)
   "s" 'avy-goto-char-2
   )

  (general-define-key
   :states '(normal visual emacs)
   :keymaps 'override
   :prefix "g"
   "a" 'evil-switch-to-windows-last-buffer
   "h" 'evil-beginning-of-line
   "l" 'evil-end-of-line
   "g" 'beginning-of-buffer
   "e" 'end-of-buffer
   "d" 'xref-find-definitions
   "r" 'lsp-find-references
   "s" 'avy-goto-char-2
   )

  (general-define-key
   :states '(normal)
   :keymaps '(dired-mode-map)
   "h" 'dired-up-directory
   "l" 'dired-find-file
   )

  (general-define-key
   :states 'visual
   :keymaps 'override
   :prefix "m"
   "s" 'evil-surround-region
   "r" 'evil-surround-change
   "d" 'evil-surround-delete
   )

  (general-define-key
   :states '(normal visual insert emacs)
   :keymaps 'override
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "y" 'consult-yank-from-kill-ring
   "j" 'evil-collection-consult-jump-list
   "e"  'vterm
   "/"  'evilnc-comment-or-uncomment-lines
   "x"  'execute-extended-command

   "d"  '(:ignore t :which-key "Diagnostics")
   "dd" 'flymake-show-buffer-diagnostics
   "dD" 'flymake-show-project-diagnostics
   "D"  'consult-flymake
   "s" 'consult-lsp-file-symbols
   "S" 'consult-lsp-symbols
   "l"  'consult-line
   "L"  'consult-line-multi

   "b"  '(:ignore t :which-key "Buffers")
   "br" 'rename-buffer
   "bi" 'ibuffer
   "bR" 'revert-buffer
   "bw" 'toggle-truncate-lines
   "bb" 'consult-buffer
   "bn" 'evil-next-buffer
   "bp" 'evil-prev-buffer
   "bk" 'kill-buffer

   "f"  '(:ignore t :which-key "Files")
   "fn" 'consult-notes
   "fd" 'dired-jump
   "fs" 'save-buffer
   "ff" 'find-file
   "fr" 'consult-recent-file
   "fD" '((lambda () (interactive) (find-file "~/Notes/day-book.org")) :which-key "Open daybook")

   "w"  '(:ignore t :which-key "Window")
   "ws" 'evil-window-split
   "wv" 'evil-window-vsplit
   "wq" 'evil-window-delete
   "wo" 'delete-other-windows
   "wj" 'evil-window-down
   "wk" 'evil-window-up
   "wh" 'evil-window-left
   "wl" 'evil-window-right
   "wJ" 'evil-window-move-very-bottom
   "wK" 'evil-window-move-very-top
   "wH" 'evil-window-move-far-left
   "wL" 'evil-window-move-far-right

   ;; LSP Mode bindings
   "c"  '(:ignore t :which-key "Code")
   "cg" '(:ignore t :which-key "goto")
   "cC" 'recompile
   "cc" 'compile
   "ce" 'flycheck-list-errors
   "ck" 'lsp-describe-thing-at-point
   "cK" 'lsp-rust-analyzer-open-external-docs
   "ca" 'lsp-execute-code-action
   "cr" 'lsp-rename
   "cs" 'consult-imenu
   "cS" 'consult-imenu-multi
   "cd" 'consult-lsp-diagnostics
   "ct" 'consult-todo-dir

   "p"  '(:ignore t :which-key "Project")
   "pe" 'multi-vterm-project
   "pc" 'project-compile
   "pi" 'consult-imenu-multi
   "pf" 'project-find-file
   "pd" 'project-find-dir
   "pp" 'project-switch-project
   "pb" 'consult-project-buffer
   "pg" 'consult-ripgrep
   "pt" 'consult-todo-project
   "p!" 'project-shell-command

   "h"  '(:ignore t :which-key "Helper")
   "he" 'emoji-search
   "hd" 'devdocs-lookup
   "ht" 'consult-theme
   "hk" 'describe-key
   "hv" 'describe-variable
   "hf" 'describe-function

   "g"  '(:ignore t :which-key "Magit")
   "gg" 'magit-status
   "gi" 'blamer-show-posframe-commit-info
   "gb" 'global-blamer-mode
   "gf" 'magit-fetch
   "gF" 'magit-fetch-all
   "gp" 'magit-push-to-remote
   "gs" 'magit-stage-modified
   "gc" 'magit-commit

   "t"  '(:ignore t :which-key "Text Manipulation")
   "tf" 'fill-region

   "r"  '(:ignore t :which-key "Configuration changes")
   "rr" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :which-key "Reload init.el")
   "re" 'eval-buffer

   "!"  'shell-command

   "o"  '(:ignore t :which-key "Org")
   "oa" 'org-agenda
   "oc" 'org-clock-in
   "oC" 'org-clock-out
   "os" 'org-schedule
   "od" 'org-deadline
   "oy" 'org-store-link
   )

  ;; Org-mode specific bindings
  (general-define-key
   :states '(normal visual emacs)
   :keymaps '(org-mode-map)
   :prefix "SPC"
   "of" 'org-open-at-point
   "ot" 'org-todo
   "oi" 'org-insert-link
   )
  )

(use-package which-key
  :straight t
  :defer 5
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode))
