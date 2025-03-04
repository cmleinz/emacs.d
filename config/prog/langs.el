(use-package make-mode
  :straight nil)

(use-package dockerfile-mode
  :straight t
  :hook
  (dockerfile-mode . (lambda () (setq-local devdocs-current-docs '("docker")))))

(use-package groovy-mode
  :straight t
  :config
  (setq groovy-indent-offset 2))

(use-package odin-mode
  :straight (:type git :repo "https://git.sr.ht/~mgmarlow/odin-mode")
  :defer 2)

(use-package java-ts-mode
  :ensure nil
  :mode ("\\.java\\'")
  :hook
  (java-ts-mode . (lambda () (setq-local devdocs-current-docs '("openjdk~21")))))

(use-package json-ts-mode
  :ensure nil
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

(use-package toml-ts-mode
  :ensure nil
  :mode ("\\.toml\\'" . toml-ts-mode))

(use-package yaml-ts-mode
  :ensure nil
  :mode ("\\.yml\\'" "\\.yaml\\'"))

(use-package zig-mode
  :straight t
  :hook
  (zig-mode . (lambda () (setq-local devdocs-current-docs '("zig")))))
