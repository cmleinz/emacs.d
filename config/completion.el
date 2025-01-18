;; Vertico for minibuffer magic!
(use-package vertico
  :straight t
  :hook (after-init . vertico-mode)
  :config
  (setq vertico-cycle t
	vertico-count 10))

(use-package orderless
  :straight t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        ;; completion-category-overrides '((file (styles partial-completion)))
	read-buffer-completion-ignore-case t))

;; Add additional information to completions
(use-package marginalia
  :straight t
  :hook
  (after-init . marginalia-mode))

;; Display nerd-icons in margin for buffers
(use-package nerd-icons-completion
  :straight t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-dired
  :straight t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package company
  :straight t
  :config
  (setq company-idle-delay 0.2 
	company-minimum-prefix-length 2
	company-tooltip-align-annotations t
	company-tooltip-limit 5
	company-tooltip-minimum 5
	company-tooltip-offset-display 'lines
	company-format-margin-function 'company-vscode-dark-icons-margin)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection)
	("C-n" . company-select-next)
	("C-p" . company-select-previous)
	("M-<" . company-select-first)
	("M->" . company-select-last))
  )

(use-package cape
  :ensure t
  :bind ("C-c f" . cape-file)
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-emoji)
  :config
  ;; Silence then pcomplete capf, no errors or messages!
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
  ;; Ensure that pcomplete does not write to the buffer
  ;; and behaves as a pure `completion-at-point-function'.
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify))
