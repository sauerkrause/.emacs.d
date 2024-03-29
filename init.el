(add-to-list 'load-path "~/.emacs.d/load-path/")

(when (>= emacs-major-version 24)
  (require 'package)
  ;; add melpa stable
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))

(require 'android-common)
(require 'android-compile)
(require 'android-host)
(require 'google-c-style)

;; could probably clean this up a bit but this will set theme depending on environment
(require 'gui-config)
(gui-config-load)
(require 'cli-config)
(cli-config-load)

;; set up the required hooks.
(add-hook 'c-mode-hook
	  (lambda ()
	    "Set 8 space tabs for kernel dev work"
	    (setq c-basic-offset 2)
            (setq-default indent-tabs-mode nil)))

(add-hook 'c++-mode-hook 'android-compile)
(add-hook 'c++-mode-hook
          (lambda ()
            (setq-default indent-tabs-mode nil)
            (setq c-basic-offset 2)))
(add-hook 'java-mode-hook 'android-compile)
(add-hook 'java-mode-hook
	  (lambda ()
	    "Treat Java 1.5 @-style annotations as comments."
	    (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
	    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))
(add-hook 'java-mode-hook
	  (lambda ()
	    (setq-default indent-tabs-mode nil)
	    (setq c-basic-offset 4)
        (setq-default tab-width 4)))

(put 'downcase-region 'disabled nil)

;; Display time and date.
(setq display-time-day-and-date t)
(display-time)

;; rainbow parens
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)

;; Highlight matching parentheses
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; Keep back ups to their own folder.
;; From StackOverflow (http://stackoverflow.com/questions/2680389/how-to-remove-all-files-ending-with-made-by-emacs).
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
      backup-by-copying t   ; Don't delink hardlinks
      version-control t     ; Use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 20  ; how many of the newest versions to keep
      kept-old-versions 5   ; and how many of the old
)

;; Bind for moving between windows
(global-set-key (kbd "M-[ d") 'windmove-left)
(global-set-key (kbd "M-[ c") 'windmove-right)
(global-set-key (kbd "M-[ a") 'windmove-up)

(global-set-key (kbd "M-[ b") 'windmove-down)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(kotlin-mode magit doom-themes doom-modeline all-the-icons oauth el-get use-package slack helm rainbow-delimiters paredit))
 '(safe-local-variable-values '((Base . 10) (Syntax . ANSI-Common-Lisp)))
 '(warning-suppress-types '(((package reinitialization)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#970098")))))

