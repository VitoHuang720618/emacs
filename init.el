(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'cl)
(require 'init-ibuffer)
(require 'init-locales)
;;(require 'init-ido)
(require 'init-eshell)
(require 'init-isearch)
(require 'init-auto-complete)
;;(require 'init-helm)
(require 'init-yasnippets)
;;(require 'init-ac-helm)
;;(require 'init-ace-jump)
;;(require 'init-fiplr-finder)

;; rust

;; rust
(require 'rust-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; rust format
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))


(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "/Users/vito/.rust/src") ;; Rust source code PATH
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(setenv "PATH"
         (shell-command-to-string "source $HOME/.zshrc && printf $PATH"))

;; custom go ide
(require 'go-eldoc)
(require 'go-mode)
(require 'auto-complete-config)
(require 'golint)
(require 'go-autocomplete)

(ac-config-default)
(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  ;;  (setq compile-command "go build -v && go test -v && go vet")
  (setq compile-command "go test -v")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-setup)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "f81a9aabc6a70441e4a742dfd6d10b2bae1088830dc7aba9c9922f4b1bd2ba50" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (popup go-eldoc skype elpy company-jedi python-mode company-math cargo company company-racer flycheck flycheck-rust racer rust-mode go-autocomplete exec-path-from-shell org-edna lua-mode dracula-theme zoom-frm zenburn-theme yascroll wttrin web-mode undo-tree tabbar-ruler swoop switch-window sr-speedbar sql-indent smex php-auto-yasnippets packed nginx-mode neotree monokai-theme idomenu ido-vertical-mode ido-ubiquitous ibuffer-vc go-mode geben fullframe flymake-php dired+ dash color-theme-sanityinc-solarized chinese-fonts-setup anzu ac-helm)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
