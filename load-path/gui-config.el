;; funcall to set gui once required
(defun gui-config-load ()
  "load my gui configuration"
  (when (display-graphic-p)
    (require 'all-the-icons)
    (require 'doom-modeline)
    (require 'doom-themes)
    (setq doom-themes-enable-bold t
	  doom-themes-enable-italic t)
    (load-theme 'doom-opera-light t)

    ;; enable flashing-mode-line on errors
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)
    (doom-modeline-mode 1)))

(provide 'gui-config)
