;; Configuration doom emacs

(setq user-full-name "Augusto Musetti"
      user-mail-address "musettiaugusto@gmail.com")

(setq doom-theme 'doom-nord)
;; (setq doom-themes-enable-bold t
;;       doom-themes-enable-italic t)

(setq org-directory "~/Documents/org/")

(setq display-line-numbers-type t)

;; Disabled menu bar and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; add bullets in org mode
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Fonts
(setq doom-font (font-spec :family "JetBrains Mono" :size 15 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Roboto" :size 15)
      doom-unicode-font (font-spec :family "JetBrains Mono" :size 15)
      doom-big-font (font-spec :family "JetBrains Mono" :size 20))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))



;; zoom in/out like we do everywhere else.
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)



;; Set Dashboard to match the theme
(setq fancy-splash-image "/home/augustom/.config/doom/doom-nord.png")
(custom-set-faces!
  '(doom-dashboard-banner :inherit)
  '(doom-dashboard-footer :inherit font-lock-constant-face)
  '(doom-dashboard-footer-icon :inherit all-the-icons-red)
  '(doom-dashboard-loaded :inherit font-lock-warning-face)
  '(doom-dashboard-menu-desc :inherit font-lock-string-face)
  '(doom-dashboard-menu-title :inherit font-lock-function-name-face))

;; Page Scrolling
(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; how many lines at a time
(setq mouse-wheel-progressive-speed t) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Line numbers everywhere
;; (global-display-line-numbers-mode 1)
;; (global-visual-line-mode t)

(setq global-prettify-symbols-mode t)

;; Bookmarks
(map! :leader
      (:prefix ("b". "buffer")
       :desc "List bookmarks" "L" #'list-bookmarks
       :desc "Save current bookmarks to bookmark file" "w" #'bookmark-save))

;; Ibuffer settings
(evil-define-key 'normal ibuffer-mode-map
  (kbd "f c") 'ibuffer-filter-by-content
  (kbd "f d") 'ibuffer-filter-by-directory
  (kbd "f f") 'ibuffer-filter-by-filename
  (kbd "f m") 'ibuffer-filter-by-mode
  (kbd "f n") 'ibuffer-filter-by-name
  (kbd "f x") 'ibuffer-filter-disable
  (kbd "g h") 'ibuffer-do-kill-lines
  (kbd "g H") 'ibuffer-update)

(map! :leader
      :desc "Find files with fzf" "s z" 'counsel-fzf
      )

(add-to-list 'initial-frame-alist '(fullscreen . maximized))


(add-hook 'python-mode-hook 'anaconda-mode)
