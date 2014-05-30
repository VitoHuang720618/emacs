;; 使用單一buff
(defadvice dired-find-file (around dired-find-file-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-file-for-visit)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))
(defadvice dired-up-directory (around dired-up-directory-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer)))
    ad-do-it
    (kill-buffer orig)))

;; 字型
(set-face-attribute 'default nil :family "Oxygen Mono")
(set-default-coding-systems 'utf-8)
(set-fontset-font (frame-parameter nil 'font) 'han (font-spec :family "細明體"))

;; flymake-php
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; no bakup files
(setq-default make-backup-files nil)

(setq inhibit-startup-message t)

;; y/n to answer
(fset 'yes-or-no-p 'y-or-n-p)

;; mac 更換command 取代 alt
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)


(provide 'init-locales)
