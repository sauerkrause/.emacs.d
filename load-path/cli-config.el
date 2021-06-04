;; funcall to set cli theme once required
(defun cli-config-load ()
  "load my cli configuration"
  (unless (display-graphic-p)
    (require 'all-the-icons)
    (require 'doom-modeline)
    (require 'doom-themes)
    (setq doom-themes-enable-bold t
	  doom-themes-enable-italic t)
    (load-theme 'doom-opera-light t)))

(provide 'cli-config)
