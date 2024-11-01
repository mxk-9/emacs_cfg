;; Remove "backup.files~"
(setq make-backup-files nil)

;; use custom file
(setq custom-file "~/.emacs.custom.el")

;; Smooth scroll
(setq scroll-step 1
      scroll-conservatively 10000)

;; Set Font
(add-to-list 'default-frame-alist '(font . "JetBrains Mono Medium 16"))
(set-face-attribute 'default nil :font "JetBrains Mono Medium 16")

;; HIDE SOME GRAPHICAL ELEMENTS
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message -1)
(setq inhibit-splash-screen -1)

;; DISABLE SOUND
(setq visible-bell 1)

;; Scrolloff
(setq scroll-margin 1)

;; Remove indent in some modes
(add-hook 'text-mode-hook (lambda () (electric-indent-local-mode -1)))
(add-hook 'conf-mode-hook (lambda () (electric-indent-local-mode -1)))
(add-hook 'conf-toml-mode-hook (lambda () (electric-indent-local-mode -1)))

;; Set 4 space indent in emacs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Line numbers and columns
;; (global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)
(setq fill-column 80)

(add-hook 'zig-mode-hook #'display-line-numbers-mode)
(add-hook 'zig-mode-hook #'auto-fill-mode)
(add-hook 'zig-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'zig-mode-hook (lambda() (setq fill-column 80)))

(add-hook 'c-mode-hook #'display-line-numbers-mode)
(add-hook 'c-mode-hook #'auto-fill-mode)
(add-hook 'c-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'c-mode-hook (lambda() (setq fill-column 80)))

(add-hook 'pascal-mode-hook #'display-line-numbers-mode)
(add-hook 'pascal-mode-hook #'auto-fill-mode)
(add-hook 'pascal-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'pascal-mode-hook (lambda() (setq fill-column 80)))

;; resize emacs frame by pixel
(setq frame-resize-pixelwise t)
(set-frame-position (selected-frame) 0 0)
(set-frame-size (selected-frame) 1920 1080 t)

;; prevent autoresizing windows when opening new buffers
(setq even-window-heights nil)
(setq even-window-sizes nil)

;; [(t, c)rying (to make, about) normal tabs] ;;
(setq tab-bar-close-button-show nil)        ;; hide tab close / x button
(setq tab-bar-new-tab-choice "*dashboard*") ;; buffer to show in new tabs
(setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator)) ;; elements to include in bar
;; --=[(t, c)rying (to make, about) normal tabs]=-- ;;


;; ==[Emacs extra settings]== ;;
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; ==[Emacs extra settings]== ;;

;; Autoclose brackets ;;
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)
;; Autoclose brackets ;;

;; THEME ;;
;; (load-theme 'base16-uwunicorn t)
;; (load-theme 'base16-xcode-dusk t)
(load-theme 'base16-catppuccin-mocha t)
;; THEME ;;

;; Multiple cursors ;;
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-lpike-this)
;; Multiple cursors ;;

;; Custom keybinds ;;
(global-set-key (kbd "C-<return>") 'evil-mode)

(global-set-key (kbd "M-<f4>") 'compile)
(global-set-key (kbd "<f4>") (kbd "C-u M-x compile"))

(global-set-key (kbd "<f5>") 'desktop-save-in-desktop-dir)
(global-set-key (kbd "<f6>") 'desktop-change-dir)

(global-set-key (kbd "<f7>") 'windresize)
(global-set-key (kbd "<f8>") 'transpose-frame)

;; Custom keybinds ;;

;; MARKDOWN SETTINGS ;;
;; Native syntax highlighting of code block ;;
(setq markdown-fontify-code-blocks-natively t)
(add-hook 'markdown-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'markdown-mode-hook (lambda () (markdown-toggle-markup-hiding t)))
;; MARKDOWN SETTINGS ;;

;; All the icons ;;
(when (display-graphic-p)
  (require 'all-the-icons))
;; All the icons ;;

;; ==[MELPA]== ;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; ==[MELPA]== ;;


;; ==[LSP]== ;;

;; Enables lsp in chosen languages ;;
(require 'lsp-mode)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'tree-sitter-hl-mode)

(add-hook 'c-mode-hook #'lsp)
(add-hook 'c-mode-hook #'tree-sitter-hl-mode)

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook #'tree-sitter-hl-mode)

(add-hook 'lua-mode-hook #'lsp)
(add-hook 'lua-mode-hook #'tree-sitter-hl-mode)

(add-hook 'nix-mode-hook #'lsp)
(add-hook 'nix-mode-hook #'tree-sitter-hl-mode)

(add-hook 'zig-mode-hook #'lsp)
(add-hook 'zig-mode-hook #'tree-sitter-hl-mode)

(add-hook 'pascal-mode-hook #'tree-sitter-hl-mode)

(add-hook 'sh-mode-hook #'tree-sitter-hl-mode)


;; Lsp UI ;;
(setq lsp-ui-doc-enable 1)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-side 'right)
(setq lsp-ui-doc-show-with-cursor 1)

;; flycheck ;;
(global-flycheck-mode +1) ;; does it usefull ??

;; company-mode ;;
(add-hook 'after-init-hook 'global-company-mode)

;; dap-mode ;;
(dap-mode 1)

;; tree-sitter ;;
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; below optional modes
(dap-ui-mode 1)
(dap-tooltip-mode 1) ;; enables mouse hover support
(tooltip-mode 1)
(dap-ui-controls-mode 1)

;; vscode-cpptools
(require 'dap-cpptools)

(load-file custom-file)
