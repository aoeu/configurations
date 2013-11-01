;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Make the mouse scroll wheel slightly less insane.
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)

;; Remap some keys to issue more commands comfortably on OS X
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'meta)

(global-linum-mode)

(setq scheme-program-name "petite")
(setq pretty-lambda-mode t)
(setq rainbow-delimeters-mode t)
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)
; hs-show-all
; hs-hide-all
(add-hook 'go-mode-hook (lambda () (hs-minor-mode)))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(setq ring-bell-function #'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq line-number-mode t)
(setq column-tumber-mode t)

(setq lexical-binding t)

(require 'package)
;; Add marmalade to package repos
;; default value for package-archives
;; (("gnu" . "http://elpa.gnu.org/packages/"))
(let
    ((marmalade '("marmalade" . "http://marmalade-repo.org/packages/"))
     (melpa '("melpa" . "http://melpa.milkbox.net/packages/"))
     (org '("org" . "http://orgmode.org/elpa/")))
  (add-to-list 'package-archives marmalade t)
  (add-to-list 'package-archives melpa t)
  (add-to-list 'package-archives org t))

(package-initialize)

(unless (and (file-exists-p "~/.emacs.d/elpa/archives/marmalade")
             (file-exists-p "~/.emacs.d/elpa/archives/gnu")
             (file-exists-p "~/.emacs.d/elpa/archives/melpa"))
  (package-refresh-contents))

(defun packages-install (&rest packages)
  (mapc (lambda (package)
          (let ((name (car package))
                (repo (cdr package)))
            (when (not (package-installed-p name))
              (let ((package-archives (list repo)))
                (package-initialize)
                (package-install name)))))
        packages)
  (package-initialize)
  (delete-other-windows))

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(ido-mode t)
(ido-everywhere t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("c377a5f3548df908d58364ec7a0ee401ee7235e5e475c86952dc8ed7c4345d8e" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Superfluous transparent background.
;;(set-frame-parameter (selected-frame) 'alpha '(90 50))

;; Lots of purple.
;;(require 'purple-haze-theme)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)

;;(color-theme-molokai)
(load-theme 'wombat t)

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
