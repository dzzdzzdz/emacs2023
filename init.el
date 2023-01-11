;; interface tweaks
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; disable visible scrollbar
(tool-bar-mode -1)          ; disable the toolbar
(tooltip-mode -1)           ; disable tooltips
(set-fringe-mode 10)        ; give some breathing room

(menu-bar-mode -1)            ; disable the menu bar

(load-theme 'tango-dark) ; theme

;; set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "Monaco:bold" :height 175)

;; packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; swiper
(use-package swiper)

;; ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))