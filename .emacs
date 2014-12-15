;; emacs config file for Emacs24 ;;
;; settings without dependencies to any extensions/plugins ;;

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
(global-hl-line-mode 1)

;; Show line numbers, dynamically with space on either side
(global-linum-mode 1)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

;; mode line settings ;;
(line-number-mode t)
(column-number-mode t)
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
 '(auto-complete dired+ magit undo-tree smex  deft spacegray-theme flatui-theme powerline))

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
(load-theme 'flatui t)

;; setup powerline
;; taken from https://github.com/Corsair/dotfiles-mac/blob/master/.emacs.el
(require 'powerline)
;; (defpowerline status "%*%Z")
;; (defpowerline global global-mode-string)

(defun set-powerline-scheme ()
  "Setup the mode-line."
  (interactive)

  (setq-default
   mode-line-format
   '("%e"
     (:eval
      (let* ((active (powerline-selected-window-active))
             (mode-line (if active 'mode-line 'mode-line-inactive))
             (face1 (if active 'powerline-active1 'powerline-inactive1))
             (face2 (if active 'powerline-active2 'powerline-inactive2))
             (separator-left
              (intern (format "powerline-%s-%s"
                              powerline-default-separator
                              (car powerline-default-separator-dir))))
             (separator-right
              (intern (format "powerline-%s-%s"
                              powerline-default-separator
                              (cdr powerline-default-separator-dir))))
             (lhs (list (powerline-raw "%*%z" nil 'l)
                        ;; (powerline-buffer-size nil 'l)
                        ;; (powerline-raw mode-line-mule-info nil 'l)
                        (powerline-buffer-id nil 'l)
                        (when (and (boundp 'which-func-mode) which-func-mode)
                          (powerline-raw which-func-format nil 'l))
                        (powerline-raw " ")
                        (funcall separator-left mode-line face1)
                        (powerline-major-mode face1 'l)
                        (powerline-process face1)
                        (powerline-minor-modes face1 'l)
                        (powerline-narrow face1 'l)
                        (powerline-raw " " face1)
                        (funcall separator-left face1 face2)
                        (powerline-vc face2 'r)
                        (when (boundp 'erc-modified-channels-object)
                          (powerline-raw erc-modified-channels-object
                                         face2 'l))))
             (rhs (list (powerline-raw global-mode-string face2 'r)
                        (funcall separator-right face2 face1)
                        (powerline-raw "%l" face1 'l)
                        (powerline-raw ":" face1 'l)
                        (powerline-raw "%c" face1 'r)
                        (funcall separator-right face1 mode-line)
                        (powerline-raw " ")
                        (powerline-raw "%4p" nil 'r)
                        ;; (powerline-hud face2 face1))))
                        )))
        (concat (powerline-render lhs)
                (powerline-fill face2 (powerline-width rhs))
                (powerline-render rhs)))))))

(set-powerline-scheme)


;; global font
(set-face-attribute 'default nil
		    :family "Consolas" :height 120)

;; quick notes app
(require 'deft)
(setq deft-directory "c:/data/org")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key [f12] 'deft)
(global-set-key "\C-cn" 'deft)

(fringe-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
