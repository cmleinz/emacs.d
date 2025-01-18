;; evil-mode configuration
(use-package evil
  :straight t
  :init
  (setq evil-want-keybinding nil)
  :config
  (setq evil-want-integration t
	evil-vsplit-window-right t
	evil-auto-indent t
	evil-split-window-below t)
  (evil-mode)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (evil-set-undo-system 'undo-redo))

(use-package evil-nerd-commenter
  :straight t
  :after evil
  :defer 5)

;; Additional evil-mode bindings
(use-package evil-collection
  :straight t
  :after evil
  :config
  (evil-collection-init))

;; Evil mode multi-cursor support
(use-package evil-mc
  :straight t
  :after evil
  :defer 5
  :config
  (setq evil-mc-mode-line-text-cursor-color t)
  (global-evil-mc-mode 1))

;; Evil surround
(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode 1)
  ;; The default behavior is to have a space between the delimiters
  ;; if you use the opening version of the paren, and no-space if
  ;; you use the closing paren. I prefer the opposite behavior
  (setq-default evil-surround-pairs-alist
		'(
		  (?\( . ("(" . ")"))
		  (?\< . ("<" . ">"))
		  (?\[ . ("[" . "]"))
		  (?\{ . ("{" . "}"))
		  (?\) . ("( " . " )"))
		  (?\> . ("< " . " >"))
		  (?\] . ("[ " . " ]"))
		  (?\} . ("{ " . " }"))
		  (?\` . ("`" . "`"))
		  ))
  )
