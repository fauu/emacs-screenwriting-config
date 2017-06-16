(require 'package) 
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(setq
 bg-color "#FEFEFE"
 fg-color "#202226"
 font-family "Courier Prime Emacs"
 font-height 150
 line-width-characters 66)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1) 
(setq-default
 inhibit-splash-screen t
 inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'focus-out-hook #'garbage-collect)
(add-to-list 'default-frame-alist `(background-color . ,bg-color))
(add-to-list 'default-frame-alist `(foreground-color . ,fg-color))
(set-face-attribute 'default nil :family font-family :height font-height)

(use-package evil
  :init (evil-mode 1)
  :config
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-insert-state-map (kbd "C-u") (lambda () (interactive) (evil-delete (point-at-bol) (point))))
  (setq evil-want-fine-undo 'fine))

(use-package olivetti
  :config
  (setq-default
   olivetti-hide-mode-line t
   olivetti-body-width line-width-characters))

(use-package fountain-mode
  :config

  (fountain-set-font-lock-decoration 2)
  (set-face-attribute 'fountain-scene-heading nil :foreground "#202226" :weight 'bold)

  (add-to-list 'auto-mode-alist '("\\.fountain$" . fountain-mode))
  (add-hook 'fountain-mode-hook (lambda () (turn-on-olivetti-mode)))
  (defun export-to-pdf ()
    (shell-command-to-string (format "afterwriting --config afterwriting-config.json --source %s --pdf --overwrite" buffer-file-name)))
  (add-hook 'after-save-hook #'export-to-pdf))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (fountain-mode olivetti evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
