(use-package org
  :straight t
  :hook
  (org-mode . (lambda ()
		(visual-line-mode)
		(display-line-numbers-mode)
		(org-superstar-mode)
		(org-indent-mode)
		(yas-minor-mode)))
  :config
  (setq org-todo-keywords
        '((sequence "TODO(t)" "PROG(p)" "PROJ(j)" "SENT(s)" "|" "DONE(d)" "CANC(c)" "PASS(a)")))
  (setq org-todo-keyword-faces
        '(("TODO" . "#ff5555") ("PROG" . "#ffb86c") ("PROJ" . "#8be9fd") ("SENT" . "#ff79c6")
          ("DONE" . "#50fa7b") ("CANC" . "#a4fcba") ("PASS" . "#44475a")))
  ;; Add these files to the agenda
  (setq org-clock-sound (expand-file-name "timer.wav" user-emacs-directory)
	org-agenda-files '("~/Notes/day-book.org")
	org-src-fontify-natively t)
  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers))

(use-package org-superstar
  :straight t
  :after org
  :config
  (setq org-hide-leading-stars nil)
  ;; This line is necessary.
  (setq org-superstar-leading-bullet ?\s)
  ;; If you use Org Indent you also need to add this, otherwise the
  ;; above has no effect while Indent is enabled.
  (setq org-indent-mode-turns-on-hiding-stars nil))
