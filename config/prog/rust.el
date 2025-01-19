;; Rust
(use-package rust-ts-mode
  :ensure nil
  :mode ("\\.rs\\'" . rust-ts-mode)
  :hook ((rust-ts-mode . lsp-deferred)
	 (rust-ts-mode . (lambda () (set-fill-column 100))))
  :config
  (setq compile-command "cargo b --all-features")
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (setq lsp-rust-features "all"))

(use-package cargo
  :straight t)
