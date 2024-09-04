;; Remove "backup.files~"
(setq make-backup-files nil)

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

;; Line numbers
;; (global-display-line-numbers-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)
(display-fill-column-indicator-mode)
(setq fill-column 80)


;; ==[Emacs extra settings]== ;;
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; ==[Emacs extra settings]== ;;

;; THEME ;;
;; (load-theme 'base16-uwunicorn t)
(load-theme 'base16-xcode-dusk t)
;; THEME ;;

;; Multiple cursors ;;
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Multiple cursors ;;

;; Custom keybinds ;;
(global-set-key (kbd "C-<return>") 'evil-mode)
(global-set-key (kbd "<f7>") 'windresize)
;; Custom keybinds ;;

;; ==[MELPA]== ;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; ==[MELPA]== ;;

;; ==[LSP]== ;;
(setq lsp-keymap-prefix "C-c C-l")

;; Enables lsp in chosen languages ;;
(require 'lsp-mode)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'lua-mode-hook #'lsp)
(add-hook 'nix-mode-hook #'lsp)

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
;; (global-tree-sitter-mode)
;; (tree-sitter-hl-mode)

;; below optional modes
(dap-ui-mode 1)
(dap-tooltip-mode 1) ;; enables mouse hover support
(tooltip-mode 1)
(dap-ui-controls-mode 1)

;; vscode-cpptools
(require 'dap-cpptools)

;; Rust
(dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                                   :gdbpath "rust-gdb"
                                   :target nil
                                   :cwd nil))

;; Go
(require 'dap-dlv-go)
;; dap-mode ;;

;; ==[LSP]== ;;

;; ==[Installed packages]== ;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4e87dc5a6a6bd3ab09b1b86f3a0ab8f6bc86998f5be3b10474528a7834bf1c0b" default))
 '(package-selected-packages
   '(multiple-cursors tree-sitter-langs tree-sitter windresize nix-mode evil lua-mode go-mode dap-mode lsp-ivy helm lsp-treemacs company flycheck lsp-ui lsp-mode base16-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ==[Installed packages]== ;;
