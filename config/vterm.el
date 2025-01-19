;; Definitely the best terminal emulator I've used in emacs
(use-package vterm
  :straight t
  :config
  (setq vterm-shell "nu"))

;; Allow for multiple vterm instances
(use-package multi-vterm
  :straight t
  :after vterm)
