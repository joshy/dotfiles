;; emacs config file for Emacs24

(menu-bar-mode 1)
(tool-bar-mode 0)

;; package stuff, adding more repos
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; startup load
(find-file "~/org/mylife.org")

(setq org-directory "~/org")

(setq org-mobile-files '("~/org/todo.org"
                         "~/org/privat.org"
                         "~/org/arbeit.org"))

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/mobile-inbox.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)  

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

(load-theme 'ir_black t)



;; Check if we are running on windows
(defvar mswindows (string-match "windows" (symbol-name system-type)))

;; global font
;;(if (mswindows)
;;    (set-default-font "-*-Consolas-normal-r-*-*-20-*-*-*-c-*-iso8859-1"))
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("6615e5aefae7d222a0c252c81aac52c4efb2218d35dfbb93c023c4b94d3fa0db" "8b49009d04730bc5d904e7bb5c7ff733f3f9615c3d6b3446eca0766e6da2bea1" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
