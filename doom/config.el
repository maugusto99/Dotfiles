(setq user-full-name "Augusto Musetti"
      user-mail-address "musettiaugusto@gmail.com")

(setq doom-theme 'doom-gruvbox)

(setq org-directory "~/Documents/org/")
(setq display-line-numbers-type t)

;; Disabled menu bar and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Add bullets in org mode
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Fonts
(setq doom-font (font-spec :family "JetBrains Mono" :size 14 )
      doom-variable-pitch-font (font-spec :family "Inter" :size 14)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24 ))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; Page Scrolling
(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; how many lines at a time
(setq mouse-wheel-progressive-speed t) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Line numbers everywhere
;; (global-display-line-numbers-mode 1)
;; (global-visual-line-mode t)

(setq global-prettify-symbols-mode t)

(use-package octave-mode
  :mode "\\.m\\'")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add personal keymaps
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(map! :leader
      :desc "Find files with fd" "s z" '+vertico/consult-fd
      :desc "Live ripgrep" "s g" 'consult-ripgrep
      )

;; Bookmarks
(map! :leader
      (:prefix ("b". "buffer")
       :desc "List bookmarks" "L" #'list-bookmarks
       :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))

;; zoom in/out like we do everywhere else.
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

(define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-c C-c") 'evil-normal-state)

(add-hook 'f90-mode-hook 'lsp-ensure-server)
