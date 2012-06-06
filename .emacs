;; emacs config file for Emacs24

(menu-bar-mode 1)
(tool-bar-mode 0)

;; package stuff, adding more repos
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" . "http://vagrant-centos-62.vagrantup.com/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; startup load
(find-file "~/org/mylife.org")


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Check if we are running on windows
(defvar mswindows (string-match "windows" (symbol-name system-type)))

;; global font
(set-default-font "-*-Consolas-normal-r-*-*-20-*-*-*-c-*-iso8859-1")


; syntax highlighting
(global-font-lock-mode 1)

; no splash screen
(setq inhibit-splash-screen t) 

(add-to-list 'auto-mode-alist '("\\.js$\\'" . js2-mode))
(autoload 'js2-mode "js2" nil t)

;; org mode autoload
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "*b")
  (save-excursion
    (goto-char (point-min))
    (while (search-forward (string ?\C-m) nil t)
      (replace-match (string ?\C-j) nil t))))


(setenv "PRINTER" "PDFCreator")
    (cond ((eq system-type 'windows-nt)
       (setq ps-printer-name "PDFCreator")
       (setq ps-printer-name-option "-d")
       (setq ps-lpr-command "c:/data/cygwin/bin/lpr")))

;; cua mode
(cua-mode)

;; load regex-tool if it's available
(load "regex-tool" t)    

(setq org-directory "~/org/")
(setq org-mobile-directoy "/scpc:j.cyriac@webdav.mydrive.ch:/org")

(load-theme 'solarized-light)
