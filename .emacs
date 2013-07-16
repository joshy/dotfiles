;; emacs config file for Emacs24 ;;

;;;; settings without dependencies to any extensions/plugins ;;;;

;; no splash screen
(setq inhibit-splash-screen t) 

;; common settings ;;
(menu-bar-mode 1)
(tool-bar-mode 0)

;; global syntax highlighting turned on ;;
(global-font-lock-mode 1)

;; no blinking cursor ;;
(blink-cursor-mode -1)

;; highlight current line ;;
(global-hl-line-mode +1)

;; nice scrolling ;;
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings ;;
(line-number-mode t)
column-number-mode t)
(size-indication-mode t)

;; Changes all yes/no questions to y/n  ;;
(fset 'yes-or-no-p 'y-or-n-p)

;; font size increase/decrease with Ctrl + mouse wheel ;;
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)

;; switch between buffers with ALT+<Arrow keys> ;;
(windmove-default-keybindings 'meta)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
					    (abbreviate-file-name (buffer-file-name))
					  "%b"))))

;; backup settings ;;
(setq backup-directory-alist '(("." . "~/.emacs.d/autosaves")))
(make-directory "~/.emacs.d/autosaves/" t)

;; no more double escaping in regex-builder ;;
(setq reb-re-syntax 'string)

;; cua mode ;;
(cua-mode)

;; load emacs server and start it unless it is already running ;;
(load "server")
(unless (server-running-p)(server-start))


;;;; package stuff, adding more repos ;;;;
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; check if the packages is installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 '(dired+ magit undo-tree smex ac deft))

;; better undo 
(require 'undo-tree)
(global-undo-tree-mode)

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


;; dired like for buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(require 'dired+)
(put 'dired-find-alternate-file 'disabled nil)


;; org mode autoload
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-startup-indented t)

;; check os
(defvar mswindows (or 
   (string-match "cygwin" (symbol-name system-type)
   (string-match "windows" (symbol-name system-type)))))


(defvar linux (string-match "linux" (symbol-name system-type)))

;; theme set
(load-theme 'tangotango t)

;; auto completion
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

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


;;;; custom functions ;;;;

;; move line up ;;
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

;; move line down ;;
(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)] 'move-line-up)
(global-set-key [(control shift down)] 'move-line-down)


;;;; --- ui stuff (with some required packages) ---- ;;;

;; linum mode and formatting of the left column ;;
(global-linum-mode 1)
(setq linum-format " %d")
