(use-package consult
  :straight t)

(use-package consult-denote
  :straight t
  :after denote
  :defer 10)

(use-package consult-lsp
  :straight t
  :after lsp-mode
  :defer 5)

(use-package consult-todo
  :straight t
  :after hl-todo
  :defer 5)
