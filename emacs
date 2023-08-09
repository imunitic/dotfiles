;; -*- mode: elisp -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-formatter 'black)
 '(elpy-test-runner 'elpy-test-pytest-runner)
 '(org-agenda-files '("~/Development/documents/org/daily-plan.org"))
 '(package-selected-packages
   '(flycheck-ocaml merlin merlin-company utop tuareg jedi vterm importmagic annotate lsp-grammarly persp-projectile treemacs-magit treemacs-projectile treemacs perspective ag rg fzf pyenv-mode realgud docker transient docker-compose-mode dockerfile-mode dotenv-mode ace-window cider clojure-mode projectile alert persist request use-package elpy rainbow-delimiters lsp-mode go-mode magit yaml-mode company sly)))
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
;(setq inferior-lisp-program "ros -Q run")

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
(global-set-key (kbd "<f8>") 'treemacs)
(global-set-key (kbd "s-l") 'goto-line)

(global-set-key (kbd "M-H") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-J") (lambda () (interactive) (enlarge-window  1)))
(global-set-key (kbd "M-K") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-L") (lambda () (interactive) (enlarge-window  1 t)))

(global-set-key (kbd "C-x C-b") 'ibuffer)


(setq smerge-command-prefix "\C-cv")
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
         ("C-c @ C-m" . elpy-folding-toggle-comments)
	 ("C-c C-r c" . elpy-format-code)))

(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode 'hs-minor-mode)

(when (equal system-type 'darwin)
 (setq mac-command-modifier 'meta)
 (setq mac-option-modifier 'super))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :init
  (setq exec-path-from-shell-variables
	'("PATH" "MANPATH" "FZF_DEFAULT_COMMAND" "FZF_DEFAULT_OPTS"))
  :config
  (exec-path-from-shell-initialize))

(use-package all-the-icons
  :if (display-graphic-p))

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
	      ("C-c p" . projectile-command-map)
	      ("s-s" . projectile-persp-switch-project)))

(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-char)
	 ("C-'" . avy-goto-char-2)
	 ("M-g f" . avy-goto-line)
	 ("M-g w" . avy-goto-word-1)
	 ("M-g e" . avy-goto-word-0)))

(use-package magit
    :bind (:map magit-file-section-map
           ("RET" . magit-diff-visit-file-other-window)
           :map magit-hunk-section-map
           ("RET" . magit-diff-visit-file-other-window))
    )
  
(use-package fzf
  :bind (("C-s-f e" . fzf)
	 ("C-s-f b" . fzf-switch-buffer)
	 ("C-s-f f" . fzf-find-file)
	 ("C-s-f p" . fzf-projectile)
	 ("C-s-f g" . fzf-grep)
	 ("C-s-f d" . fzf-directory)
	 ("C-s-f s" . fzf-git))
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        fzf/grep-command "rg --no-heading -nH"
        ;; fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)
  :custom
  (persp-mode-prefix-key (kbd "C-s-p"))
  :init
  (persp-mode))

(use-package importmagic
    :ensure t
    :config
    (add-hook 'python-mode-hook 'importmagic-mode))


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun load-dotenv (filename)
  "Load environment variables from FILENAME."
  (interactive "fLoad .env file: ")
  (with-temp-buffer
    (insert-file-contents filename)
    (while (re-search-forward "^\\([^#= \t\n]+\\)=\\([^#\n]*\\)" nil t)
      (setenv (match-string 1) (match-string 2))))
  (message "Loaded environment variables from %s" filename))

(global-set-key (kbd "C-s-a e") 'load-dotenv)
(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode 0)))

