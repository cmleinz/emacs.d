;; Vertico for minibuffer magic!
(use-package vertico
  :straight t
  :config
  (setq vertico-cycle t
	vertico-count 10)
  (vertico-mode))

(use-package orderless
  :straight t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))
	read-buffer-completion-ignore-case t))

;; Add additional information to completions
(use-package marginalia
  :straight t
  :hook
  (marginalia-mode . #'nerd-icons-completion-marginalia-setup)
  :config
  (marginalia-mode))

;; Display nerd-icons in margin for buffers
(use-package nerd-icons-completion
  :straight t
  :after marginalia
  :config
  (nerd-icons-completion-mode))

(use-package cape
  :straight t
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

;;;; Code Completion
(use-package corfu
  :straight t
  ;; Optional customizations
  :custom
  (corfu-cycle t)                 ; Allows cycling through candidates
  (corfu-auto t)                  ; Enable auto completion
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1)
  (corfu-popupinfo-delay '(0.5 . 0.2))
  (corfu-preview-current 'insert) ; insert previewed candidate
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)      ; Don't auto expand tempel snippets
  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . nil))

  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)) ; Popup completion info
