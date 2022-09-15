(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(use-package elpy rainbow-delimiters lsp-mode go-mode magit yaml-mode company sly)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)

(add-to-list 'package-archives
	     '("MELPA" . "http://melpa.org/packages/"))
(package-initialize)

(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq inferior-lisp-program "/usr/local/bin/sbcl")

(global-company-mode)
(global-display-line-numbers-mode)
(column-number-mode 1)
(load-theme 'tango-dark t)
(tool-bar-mode -1)

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)

(global-set-key (kbd "M-H") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-J") (lambda () (interactive) (enlarge-window  1)))
(global-set-key (kbd "M-K") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-L") (lambda () (interactive) (enlarge-window  1 t)))

(setq lsp-keymap-prefix "C-c l")

(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(when (equal system-type 'darwin)
 (setq mac-command-modifier 'meta)
 (setq mac-option-modifier 'super))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
