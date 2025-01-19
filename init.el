;; Specify specific custom-file location to avoid flooding init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Disable auto-showing warnings buffers
(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
               (display-buffer-no-window)
               (allow-no-window . t)))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; Disable menu bar
(menu-bar-mode -1)

;; Disable tool bar
(tool-bar-mode -1)

;; Standardize autosave files to common directory
(setq backup-directory-alist
      '((".*" . "~/.emacs.d/backups/")))

;; Remove the splash screen
(setq-default inhibit-splash-screen t)

;; Disable scroll bar
(setq-default cursor-type 'bar)
(scroll-bar-mode -1)

;; Lock files cause issues on emacs-mac
(setq create-lockfiles nil)

;; Use scroll offset
(pixel-scroll-precision-mode 1)
(setq scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Set recentf mode
(recentf-mode 1)

;; Basic configuration tweaks
;; Set font
(set-face-attribute 'default nil :font "ComicShannsMono Nerd Font Mono" :height 120)

;; Use relative line numbers
(setq display-line-numbers-type 'relative)

(use-package savehist
  :config
  (savehist-mode))

(use-package denote
  :straight t
  )

(use-package doom-modeline
  :straight t
  :after nerd-icons
  :init
  (doom-modeline-mode 1)
  (display-time-mode t)
  :config
  (setq doom-modeline-project-detection 'auto
	doom-modeline-icon t
	doom-modeline-analogue-clock nil
	doom-modeline-lsp-icon t
	doom-modeline-modal t
	doom-modeline-modal-modern-icon t))

(use-package avy
  :straight t
  :config
  (setq avy-all-windows t))

(load (expand-file-name "config/themes.el" user-emacs-directory))
(load (expand-file-name "config/completion.el" user-emacs-directory))
(load (expand-file-name "config/consult.el" user-emacs-directory))
(load (expand-file-name "config/dired.el" user-emacs-directory))
(load (expand-file-name "config/evil.el" user-emacs-directory))
(load (expand-file-name "config/git.el" user-emacs-directory))
(load (expand-file-name "config/org.el" user-emacs-directory))
(load (expand-file-name "config/vterm.el" user-emacs-directory))

(load (expand-file-name "config/prog/init.el" user-emacs-directory))

(load (expand-file-name "config/keys.el" user-emacs-directory))
