(use-package consult
  :straight t)

(use-package consult-denote
  :straight t
  :after denote
  :defer 10)

(use-package consult-eglot
  :straight t
  :defer 5)

(use-package consult-todo
  :straight t
  :after hl-todo
  :defer 5)
