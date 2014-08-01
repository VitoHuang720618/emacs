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


;; font
;; (set-face-attribute 'default nil :font "Edlo")
(set-face-attribute 'default nil :font "Oxygen Mono")
;; (set-face-attribute 'default nil :height 120)
;; (set-default-coding-systems 'utf-8)
;;(set-fontset-font (frame-parameter nil 'font) 'han (font-spec :family "細明體"))

;; 行號
(global-linum-mode 1)
(global-hl-line-mode 1)
(setq visible-bell t)

;; flymake-php
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; no bakup files
(setq-default make-backup-files nil)

;; close welcome message
(setq inhibit-startup-message t)

;; y/n to answer
(fset 'yes-or-no-p 'y-or-n-p)

;; mac change alt command
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; poweline
(require 'powerline)

(global-anzu-mode +1)

(require 'swoop)
(global-set-key (kbd "C-o")   'swoop)
(global-set-key (kbd "C-M-o") 'swoop-multi)
(global-set-key (kbd "M-o")   'swoop-pcre-regexp)
(global-set-key (kbd "C-S-o") 'swoop-back-to-last-position)

(global-set-key (kbd "C-x o") 'switch-window)

;; 存檔時移除行尾多餘空白
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;disable backup
(setq backup-inhibited t)

;disable auto save
(setq auto-save-default nil)

;; scroll bar 平滑
(global-yascroll-bar-mode 1)

;; undo-tree 復原樹
(global-undo-tree-mode t)

(provide 'init-locales)
