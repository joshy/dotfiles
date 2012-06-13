;; emacs config file for Emacs24

;;;; common settings
(menu-bar-mode 1)
(tool-bar-mode 0)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; syntax highlighting
(global-font-lock-mode 1)

;; no splash screen
(setq inhibit-splash-screen t) 

;; js2-mode autoload
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$\\'" . js2-mode))

;; org mode autoload
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; check os
(defvar mswindows (string-match "windows" (symbol-name system-type)))
(defvar linux (string-match "linux" (symbol-name system-type)))

;; cua mode
(cua-mode)

;;;; package related stuff


;; package stuff, adding more repos
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" . "http://vagrant-centos-62.vagrantup.com/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; startup load
(find-file "~/org/mylife.org")
(find-file "C:/Users/jcyriac/workspace/playground/js/nine/nine.js")
(find-file "~/org/todo.org")


;; Set font only on windows
(if mswindows
    (progn
      ;; global font
      (set-default-font "-*-Consolas-normal-r-*-*-20-*-*-*-c-*-iso8859-1")))



;; quick notes app
(require 'deft)
(setq deft-directory "C:/Users/jcyriac/Dropbox/Notes")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)

(global-set-key [f12] 'deft)
(global-set-key "\C-cn" 'deft)


(setenv "PRINTER" "PDFCreator")
    (cond ((eq system-type 'windows-nt)
       (setq ps-printer-name "PDFCreator")
       (setq ps-printer-name-option "-d")
       (setq ps-lpr-command "c:/data/cygwin/bin/lpr")))


(setq org-directory "~/org/")
(setq org-mobile-directoy "/scpc:j.cyriac@webdav.mydrive.ch:/org")

(load-theme 'solarized-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
