;; emacs config file for Emacs24

;; tramp
(cond  ((eq window-system 'w32)
      (setq tramp-default-method "scpx"))
      (t
      (setq tramp-default-method "scpc")))


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

;; backup settings
(setq backup-directory-alist '(("." . "~/.emacs.d/autosaves")))
(make-directory "~/.emacs.d/autosaves/" t)


;; font size
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)


;; better undo 
(require 'undo-tree)
(global-undo-tree-mode)

;; ace-jump
(require 'ace-jump-mode)
(define-key global-map (kbd "C-SPC") 'ace-jump-mode)

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


;; mulit web for html with inline js
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags 
;;   '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;     (js2-mode  "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;     (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)

;; another web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; emacs understands cygwin paths
(require 'cygwin-mount)
(cygwin-mount-activate)

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
(defvar mswindows (or 
   (string-match "cygwin" (symbol-name system-type)
   (string-match "windows" (symbol-name system-type)))))


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


;; Set font only on windows
(if mswindows
    (progn
      ;; global font
      (set-default-font "-*-Consolas-normal-r-*-*-12-*-*-*-c-*-iso8859-1")))



;; quick notes app
(require 'deft)
(setq deft-directory "/cygdrive/c/data/org")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key [f12] 'deft)
(global-set-key "\C-cn" 'deft)


(setenv "PRINTER" "PDFCreator")
    (cond ((eq system-type 'windows-nt)
       (setq ps-printer-name "PDFCreator")
       (setq ps-printer-name-option "-d")
       (setq ps-lpr-command "/cygdrive/c/data/cygwin/bin/lpr")))


(setq org-directory "~/org/")
(setq org-mobile-directoy "/scpc:j.cyriac@webdav.mydrive.ch:/org")



(custom-set-variables
 ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(js3-curly-indent-offset 2)
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


(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)] 'move-line-up)
(global-set-key [(control shift down)] 'move-line-down)


;;;; --- ui stuff ---- ;;;
(blink-cursor-mode -1)


;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)


;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)


;; linum mode and formatting of the left column
(global-linum-mode 1)
(setq linum-format " %d")


(global-hl-line-mode +1)


;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
					    (abbreviate-file-name (buffer-file-name))
					  "%b"))))

