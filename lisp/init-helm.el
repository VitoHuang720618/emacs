;; helm
(when (require 'helm-config nil t)
  (global-set-key (kbd "C-l") 'helm-mini)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-x f") 'helm-find-files)
  (helm-mode 1)
  (setq helm-idle-delay 0.3
	helm-input-idle-delay 0.3
	helm-candidate-number-limit 200)
  )

(provide 'init-helm)
