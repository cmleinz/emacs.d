;; Allows the use of external programs to open certain files
(use-package openwith
  :straight t
  :after dired)

(use-package dired
  :hook
  (dired-mode . openwith-mode)
  :config
  (setq dired-auto-revert-buffer #'dired-directory-changed-p
	dired-free-space nil
	dired-listing-switches "-AGFhlv --group-directories-first --time-style=long-iso"
	openwith-associations '(
				("\\.pdf\\'" "zathura" (file)))))
