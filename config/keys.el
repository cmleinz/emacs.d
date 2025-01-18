(use-package general
  :straight t
  :config
  (general-evil-setup t)
  (general-override-mode)

  ;; EViL bindings
  (general-define-key
   :states '(normal visual emacs)
   :keymaps 'override
   "U"  'evil-redo
   "C"  'evil-mc-make-cursor-move-next-line
   "%"  'mark-whole-buffer
   "_"  'expreg-expand
   "-"  'expreg-contract
   )

  (general-define-key
   :states '(normal visual emacs)
   :keymaps '(normal prog-mode-map)
   "s" 'avy-goto-char-2
   )

  (general-define-key
   :states '(normal visual emacs)
   :keymaps 'override
   :prefix "g"
   "a" 'evil-switch-to-windows-last-buffer
   "h" 'evil-beginning-of-line
   "l" 'evil-end-of-line
   "g" 'beginning-of-buffer
   "e" 'end-of-buffer
   "d" 'xref-find-definitions
   "r" 'lsp-find-references
   "s" 'avy-goto-char-2
   )

  (general-define-key
   :states '(normal)
   :keymaps '(dired-mode-map)
   "h" 'dired-up-directory
   "l" 'dired-find-file
   )

  (general-define-key
   :states 'visual
   :keymaps 'override
   :prefix "m"
   "s" 'evil-surround-region
   "r" 'evil-surround-change
   "d" 'evil-surround-delete
   )

  (general-define-key
   :states '(normal visual insert emacs)
   :keymaps 'override
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "e"  'vterm
   "/"  'evilnc-comment-or-uncomment-lines
   "x"  'execute-extended-command

   "d"  '(:ignore t :which-key "Diagnostics")
   "dd" 'flymake-show-buffer-diagnostics
   "dD" 'flymake-show-project-diagnostics
   "D"  'consult-flymake
   "s" 'consult-lsp-file-symbols
   "S" 'consult-lsp-symbols
   "l"  'consult-line
   "L"  'consult-line-multi

   "b"  '(:ignore t :which-key "Buffers")
   "br" 'rename-buffer
   "bi" 'ibuffer
   "bR" 'revert-buffer
   "bw" 'toggle-truncate-lines
   "bb" 'consult-buffer
   "bn" 'evil-next-buffer
   "bp" 'evil-prev-buffer
   "bk" 'kill-buffer

   "f"  '(:ignore t :which-key "Files")
   "fn" 'consult-notes
   "fd" 'dired-jump
   "fs" 'save-buffer
   "ff" 'find-file
   "fr" 'consult-recent-file
   "fD" '((lambda () (interactive) (find-file "~/Notes/day-book.org")) :which-key "Open daybook")

   "w"  '(:ignore t :which-key "Window")
   "ws" 'ow-split
   "wv" 'ow-vsplit
   "wq" 'ow-delete
   "wo" 'her-windows
   "wj" 'ow-down
   "wk" 'ow-up
   "wh" 'ow-left
   "wl" 'ow-right
   "wJ" 'ow-move-very-bottom
   "wK" 'ow-move-very-top
   "wH" 'ow-move-far-left
   "wL" 'evil-window-move-far-right

   ;; LSP Mode bindings
   "c"  '(:ignore t :which-key "Code")
   "cg" '(:ignore t :which-key "goto")
   "cC"  'recompile
   "cc"  'compile
   "ce" 'flycheck-list-errors
   "ck" 'lsp-describe-thing-at-point
   "cK" 'lsp-rust-analyzer-open-external-docs
   "ca" 'lsp-execute-code-action
   "cr" 'lsp-rename
   "cs" 'consult-imenu
   "cS" 'consult-imenu-multi
   "cd" 'consult-lsp-diagnostics

   "p"  '(:ignore t :which-key "Project")
   "pe" 'multi-vterm-project
   "pc" 'project-compile
   "pi" 'consult-imenu-multi
   "pf" 'project-find-file
   "pd" 'project-find-dir
   "pp" 'project-switch-project
   "pb" 'consult-project-buffer
   "pg" 'consult-ripgrep
   "pt" 'consult-todo-project
   "p!" 'project-shell-command

   "h"  '(:ignore t :which-key "Helper")
   "he" 'emoji-search
   "ht" 'consult-theme
   "hk" 'describe-key
   "hv" 'describe-variable
   "hf" 'describe-function

   "g"  '(:ignore t :which-key "Magit")
   "gg" 'magit-status
   "gi" 'blamer-show-posframe-commit-info
   "gb" 'global-blamer-mode
   "gf" 'magit-fetch
   "gF" 'magit-fetch-all
   "gp" 'magit-push-to-remote
   "gs" 'magit-stage-modified
   "gc" 'magit-commit

   "t"  '(:ignore t :which-key "Text Manipulation")
   "tf" 'fill-region

   "r"  '(:ignore t :which-key "Configuration changes")
   "rr" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :which-key "Reload init.el")
   "re" 'eval-buffer

   "!"  'shell-command

   "o"  '(:ignore t :which-key "Org")
   "oa" 'org-agenda
   "oc" 'org-clock-in
   "oC" 'org-clock-out
   "os" 'org-schedule
   "od" 'org-deadline
   "oy" 'org-store-link
   )

  ;; Org-mode specific bindings
  (general-define-key
   :states '(normal visual emacs)
   :keymaps '(org-mode-map)
   :prefix "SPC"
   "of" 'org-open-at-point
   "ot" 'org-todo
   "oi" 'org-insert-link
   "t"  'org-todo
   )
  )

(use-package which-key
  :straight t
  :defer 5
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode))
