(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-formatter 'black)
 '(elpy-test-runner 'elpy-test-pytest-runner)
 '(org-agenda-files '("~/Development/documents/org/daily-plan.org"))
 '(package-selected-packages
   '(realgud docker transient docker-compose-mode dockerfile-mode importmagic dotenv-mode neotree ace-window cider clojure-mode projectile alert persist request use-package elpy rainbow-delimiters lsp-mode go-mode magit yaml-mode company sly)))
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
(global-tab-line-mode)
(column-number-mode 1)
(load-theme 'tango-dark t)
(tool-bar-mode -1)

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "<f8>") 'neotree-toggle)
(global-set-key (kbd "s-l") 'goto-line)

(global-set-key (kbd "M-H") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-J") (lambda () (interactive) (enlarge-window  1)))
(global-set-key (kbd "M-K") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-L") (lambda () (interactive) (enlarge-window  1 t)))


(setq lsp-keymap-prefix "C-c l")

(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'clojure-mode-hook #'lsp)
(add-hook 'clojurescript-mode-hook #'lsp)
(add-hook 'clojurec-mode-hook #'lsp)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :bind (("C-c @ C-b" . elpy-folding-toggle-docstring)
         ("C-c @ C-m" . elpy-folding-toggle-comments)))

(add-hook 'python-mode-hook 'hs-minor-mode)

(when (equal system-type 'darwin)
 (setq mac-command-modifier 'meta)
 (setq mac-option-modifier 'super))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-fixed-size nil))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package docker-compose-mode)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(ffap-bindings)

(set-frame-font "Hurmit Nerd Font Mono 14" nil t)

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))

(use-package importmagic
    :ensure t
    :config
    (add-hook 'python-mode-hook 'importmagic-mode))
