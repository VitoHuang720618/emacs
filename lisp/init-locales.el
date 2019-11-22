(require 'dired)
(require 'dired-x)                   ;這行請記得加，不然無法使用隱藏檔案等功能。
(require 'dired+)
(require 'chinese-fonts-setup)
;; 使用單一buff
;; 按 Enter 時 Dired 時不會一直開新的 Dired buffer（按 Enter 時只用同一個 Dired 開目錄）
(defun dired-my-find-alternate-file ()
  (interactive)
  (if (file-regular-p (dired-get-filename))
      (dired-find-file)
    (dired-find-alternate-file)))
(define-key dired-mode-map (kbd "RET") 'dired-my-find-alternate-file) ; 按 Enter 開檔案
(put 'dired-find-alternate-file 'disabled nil) ; 避免 Dired 問你一些囉唆的問題

;; 指定emacs app 使用source command
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

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

;; tab 轉4空格
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; y/n to answer
(fset 'yes-or-no-p 'y-or-n-p)

;; mac change alt command
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; poweline
;;(require 'powerline)

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

;; 背景透明
;;(set-frame-parameter nil 'alpha '(90 70))
;; Enable company globally for all mode

(provide 'init-locales)
