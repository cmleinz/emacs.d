(use-package make-mode
  :straight nil)

(use-package dockerfile-mode
  :straight t)

(use-package groovy-mode
  :straight t
  :config
  (setq groovy-indent-offset 2))

(use-package odin-mode
  :straight (:type git :repo "https://git.sr.ht/~mgmarlow/odin-mode")
  :defer 2)

(use-package python-mode
  :straight t)

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

(use-package zig-mode
  :straight t)
