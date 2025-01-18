(use-package vterm
  :straight t
  :config
  (setq vterm-shell "nu"))

(use-package multi-vterm
  :straight t
  :after vterm)
