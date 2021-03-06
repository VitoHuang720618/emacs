(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

(when (eval-when-compile (>= emacs-major-version 24))
  (require 'ido-ubiquitous)
  (ido-ubiquitous-mode t))

;; Use smex to handle M-x
(when (eval-when-compile (>= emacs-major-version 24))
  (require 'smex)
  ;; Change path for ~/.smex-items
  (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))

(require 'idomenu)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

(when (eval-when-compile (< emacs-major-version 24))
  (defun sanityinc/ido-choose-from-recentf ()
    "Use ido to select a recently opened file from the `recentf-list'"
    (interactive)
    (if (and ido-use-virtual-buffers (fboundp 'ido-toggle-virtual-buffers))
	(ido-switch-buffer)
      (find-file (ido-completing-read "Open file: "
				      (mapcar 'abbreviate-file-name recentf-list)
				      nil t)))))


;; http://www.reddit.com/r/emacs/comments/21a4p9/use_recentf_and_ido_together/cgbprem
(add-hook 'ido-setup-hook (lambda () (define-key ido-completion-map [up] 'previous-history-element)))


;; 開啟 ido-vertical
(ido-vertical-mode 1)

(provide 'init-ido)
