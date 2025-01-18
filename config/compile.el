(use-package compile
  :config
  (setq compilation-scroll-output t))

;; Packages for programming
(use-package fancy-compilation
  :straight t
  :after compile
  :commands (fancy-compilation-mode)
  :config
  (setq fancy-compilation-override-colors nil)
  :init
  (with-eval-after-load 'compile
    (fancy-compilation-mode)))
