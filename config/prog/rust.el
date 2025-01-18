(use-package rust-ts-mode
  :mode ("\\.rs\\'" . rust-ts-mode)
  :hook ((rust-ts-mode . eglot-ensure)
	 (rust-ts-mode . (lambda () (set-fill-column 100))))
  :config
  ;; Disable inlay hints for rust. A bit too noisy
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider))
  ;; Set the default compile command
  (setq compile-command "cargo b")
  ;; Tell eglot to prefer rust-analyzer, normally prompts for rust-analyzer of rls
					; Also configure rust analyzer
  (with-eval-after-load
      'eglot (add-to-list
	      'eglot-server-programs
	      '(
		rust-ts-mode .
		("rust-analyzer" :initializationOptions (
							 :check (:command "clippy")
							 :cargo (:features "all")))))
      )
  )
