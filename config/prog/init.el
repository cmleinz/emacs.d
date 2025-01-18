(use-package prog-mode
  :config (setq truncate-lines nil)
  :hook
  (prog-mode . (lambda ()
		 (apheleia-mode)
		 (company-mode)
		 (eglot-ensure)
		 (display-line-numbers-mode)
		 (display-fill-column-indicator-mode)
		 (diff-hl-mode)
		 (electric-indent-mode)
		 (electric-pair-mode)
		 (direnv-mode))))

;; Built-in Eglot as LSP
(use-package eglot
  :hook ((eglot-managed-mode . eldoc-mode)
	 (eglot-managed-mode . flymake-mode)))

;; Pre-compiled collection of tree sitter languages
(use-package tree-sitter-langs
  :straight t)

(use-package direnv
  :straight t
  :config
  (direnv-mode)) 

(use-package apheleia
  :straight t
  :config
  ;; This removes the need to add rustfmt.toml files into the project root
  (add-to-list 'apheleia-formatters '(rustfmt . ("rustfmt" "--quiet" "--emit" "stdout" "--edition" "2021"))))

(load (expand-file-name "config/prog/rust.el" user-emacs-directory))
