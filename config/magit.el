(use-package magit
  :straight t
  :after seq
  :config
  (with-eval-after-load 'magit-mode
    (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
  (setq magit-show-long-lines-warning nil))

(use-package magit-todos
  :straight t
  :after magit
  :config
  (magit-todos-mode 1))
