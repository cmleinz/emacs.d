;;; early-init.el --- -*- lexical-binding: t -*-
;;  Author: Caleb Leinz
;;; Commentary:
;;; Code:
;; Ensure org-mode is loaded
(require 'org)

;; Define the path to your README.org file
(defvar my-org-file (expand-file-name "README.org" user-emacs-directory))

;; Tangle the README.org file
(when (file-exists-p my-org-file)
  (org-babel-tangle-file my-org-file))

(defvar file-name-handler-alist-original file-name-handler-alist)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      file-name-handler-alist nil
      site-run-file nil
      read-process-output-max (* 10 1024 1024)
      bidi-inhibit-bpa t)

(defvar leinz/gc-cons-threshold (* 100 1024 1024))

(add-hook 'emacs-startup-hook ; hook run after loading init files
          #'(lambda ()
              (setq gc-cons-threshold leinz/gc-cons-threshold
                    gc-cons-percentage 0.1
                    file-name-handler-alist file-name-handler-alist-original)))

(add-hook 'minibuffer-setup-hook #'(lambda ()
                                     (setq gc-cons-threshold most-positive-fixnum)))
(add-hook 'minibuffer-exit-hook #'(lambda ()
                                    (garbage-collect)
                                    (setq gc-cons-threshold leinz/gc-cons-threshold)))

(setq package-enable-at-startup nil)

(provide 'early-init)
;;; early-init.el ends here
