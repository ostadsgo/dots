;; TODO: Clipboard problem
;; TODO: 
;; General config
(menu-bar-mode -1)      ; Disable menu bar
(tool-bar-mode -1)      ; Disable tool bar
(scroll-bar-mode -1)    ; Disable scroll bar
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)

;; Enable package manager
(require 'package)
(setq package-archives '(("gnu"    . "http://elpa.gnu.org/packages/")
                         ("nongnu" . "http://elpa.nongnu.org/nongnu/")
                         ("melpa"  . "http://melpa.org/packages/")))
(package-initialize)

;; Installing use-package to manage packages.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; Install and configure Evil Mode
(use-package evil
  :ensure t           ; Auto-install from MELPA
  :init               ; Run before loading
  (setq evil-want-integration t)  ; Optional: Better compatibility with other packages
  (setq evil-want-keybinding nil) ; Required for evil-collection
  :config             ; Run after loading
  (evil-mode 1))      ; Enable Evil globally

;; evil-collection (Vim bindings for other modes like Magit, Dired, etc.)
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(setq evil-insert-state-cursor 'box)

;; Keybinding
;; evil mode custome keybindings
(define-key evil-insert-state-map (kbd "jk") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "SPC ;") 'evil-visual-line)
(define-key evil-visual-state-map (kbd "SPC ;") 'evil-visual-line)
(define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)
(define-key evil-normal-state-map (kbd "SPC q") (lambda () (interactive) (kill-buffer (current-buffer))))

;; (define-key evil-normal-state-map (kbd "SPC p") 'clipboard-yank)
(define-key evil-normal-state-map (kbd "SPC x") 'eval-buffer)

(global-set-key (kbd "C-,") 'duplicate-dwim)


(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "M-p") 'move-line-up)
(global-set-key (kbd "M-n") 'move-line-down)

;; ido mode
(ido-mode 1)
(ido-everywhere 1)

;; installing theme
(use-package doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme  'doom-vibrant t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-themes evil-collection)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Last line for message
(message "Emacs config loaded succesfully.")
(message "Emacs config loaded succesfully.")
(message "Emacs config loaded succesfully.")
(message "Emacs config loaded succesfully.")
