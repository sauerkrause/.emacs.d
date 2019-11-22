;; funcall to set cli theme once required
(defun cli-config-load ()
  "load my cli configuration"
  (unless (display-graphic-p)
    (load-theme 'misterioso)))

(provide 'cli-config)
