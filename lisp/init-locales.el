(require 'dired)
(require 'dired-x)                   ;這行請記得加，不然無法使用隱藏檔案等功能。
(require 'dired+)

;; 使用單一buff
;; 按 Enter 時 Dired 時不會一直開新的 Dired buffer（按 Enter 時只用同一個 Dired 開目錄）
(defun dired-my-find-alternate-file ()
  (interactive)
  (if (file-regular-p (dired-get-filename))
      (dired-find-file)
    (dired-find-alternate-file)))
(define-key dired-mode-map (kbd "RET") 'dired-my-find-alternate-file) ; 按 Enter 開檔案
(put 'dired-find-alternate-file 'disabled nil) ; 避免 Dired 問你一些囉唆的問題

;; font
;; (set-face-attribute 'default nil :font "Edlo")
;; (set-face-attribute 'default nil :font "Oxygen Mono")
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

(provide 'init-locales)
