;; emacs config file for Emacs24


(if (file-directory-p "c:/cygwin/bin")
    (add-to-list 'exec-path "c:/cygwin/bin"))

;;;; package stuff, adding more repos
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;;;; common settings
(menu-bar-mode 1)
(tool-bar-mode 0)

(line-number-mode 1)
(column-number-mode 1)

;; font size
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)


;; smex - Enchanged M-x mode, convenient interface to recent and most frequently used commands
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; no more double escaping in regex-builder
(setq reb-re-syntax 'string)


;; dired like for buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(require 'dired+)
(put 'dired-find-alternate-file 'disabled nil)

;; switch between buffers with ALT+<Arrow keys>
(windmove-default-keybindings 'meta)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; prevent backup files
(setq make-backup-files nil)

;; syntax highlighting
(global-font-lock-mode 1)

;; no splash screen
(setq inhibit-splash-screen t) 

;; js2-mode autoload
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; org mode autoload
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-startup-indented t)

;; check os
(defvar mswindows (string-match "windows" (symbol-name system-type)))
(defvar linux (string-match "linux" (symbol-name system-type)))

;; cua mode
(cua-mode)

;;
(load "server")
(unless (server-running-p)(server-start))

;; theme set
(load-theme 'tangotango t)

;; auto completion
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;; startup load
;;(find-file "~/org/todo.org")


;; Set consolas font only on windows
(if mswindows
    (progn
      ;; global font
      (set-default-font "-*-Consolas-normal-r-*-*-12-*-*-*-c-*-iso8859-1")))



;; quick notes app
(require 'deft)
(setq deft-directory "c:/data/org")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key [f12] 'deft)
(global-set-key "\C-cn" 'deft)


(setenv "PRINTER" "PDFCreator")
    (cond ((eq system-type 'windows-nt)
       (setq ps-printer-name "PDFCreator")
       (setq ps-printer-name-option "-d")
       (setq ps-lpr-command "c:/data/cygwin/bin/lpr")))


(setq org-directory "~/org/")
(setq org-mobile-directoy "/scpc:j.cyriac@webdav.mydrive.ch:/org")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "7b4a6cbd00303fc53c2d486dfdbe76543e1491118eba6adc349205dbf0f7063a" "fca8ce385e5424064320d2790297f735ecfde494674193b061b9ac371526d059" "e9a1226ffed627ec58294d77c62aa9561ec5f42309a1f7a2423c6227e34e3581" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

