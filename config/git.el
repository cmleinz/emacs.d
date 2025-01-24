(use-package ediff
  :config
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

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

(use-package hl-todo
  :straight t
  :hook (after-init . global-hl-todo-mode))

(use-package diff-hl
  :straight t
  :config
  (diff-hl-dired-mode t)
  :hook
  (prog-mode . diff-hl-mode)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))

(use-package blamer
  :straight t
  :defer 10
  :config
  (setq blamer-idle-time 0.3
	blamer-view 'overlay-right)
  :custom-face
  (blamer-face ((t :foreground "#484741"
                   :background unspecified
                   :height 120
                   :italic t))))
