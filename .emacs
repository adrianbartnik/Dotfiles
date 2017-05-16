(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-drill)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (org-plus-contrib evil-nerd-commenter smooth-scrolling use-package sublime-themes nlinum memento melpa-upstream-visit markdown-mode helm-org-rifle helm-git evil-surround evil-org evil-magit evil-indent-textobject evil-escape auctex-latexmk))))

; Emacs General Config
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq sentence-end-double-space nil)
(setq ansi-color-faces-vector [default default default italic underline success warning error])
(setq blink-cursor-mode nil)
(setq custom-safe-themes t)
(setq inhibit-startup-screen 1)
(setq-default tab-width 4 indent-tabs-mode nil)
(setq initial-frame-alist '((fullscreen . maximized)))
(load-theme 'brin t)
(set-face-attribute 'default nil :family "Inconsolata" :height 120)
(global-visual-line-mode t) ;; Automatically wrap lines by word

; nlinum
(global-nlinum-mode)

; Set current file name as title
(setq frame-title-format
      '(buffer-file-name "%b - %f" ; File buffer
        (dired-directory dired-directory ; Dired buffer
         (revert-buffer-function "%b" ; Buffer Menu
          ("%b - Dir: " default-directory))))) ; Plain buffer

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(define-key global-map (kbd "RET") 'newline-and-indent)

(setq multi-term-program "/bin/zsh")

; Save positions in files
(save-place-mode 1)

(show-paren-mode 1)
(setq show-paren-delay 0)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

; Org Mode
(require 'cl)
(require 'org-drill)
(setq org-directory "~/Dropbox/OrgMode/")
(setq org-fast-tag-selection-single-key t)
(setq org-default-notes-file (concat org-directory "Inbox.org"))
(setq org-log-into-drawer t)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-targets '((org-agenda-files :level . 1)))
(setq org-refile-use-outline-path 'file)
(setq org-agenda-text-search-extra-files '(agenda-archives))

;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb) ; Show all current opened org files
(global-set-key (kbd "<f6>") 'org-capture)

(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file "~/Dropbox/OrgMode/Inbox.org")))

(setq org-todo-keywords
    '((sequence "TODO(t)" "IN-PROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

(setq org-tag-alist '(("home" . ?h) ("work" . ?w) ("Gütersloh" . ?g) ("Various" . ?v) ("shopping" . ?s)))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "Inbox.org" "Inbox")
            (file "capture/todo.org"))
        ("j" "Journal" entry (file+datetree "Journal.org")
            (file "capture/journal.org"))))

(setq org-agenda-text-search-extra-files '(agenda-archives))

; RecentF
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-exclude '(".*recentf"))
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 5 60) 'recentf-save-list)

(require 'powerline)
(powerline-center-evil-theme)
(setq display-time-day-and-date t)
(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil)
(setq powerline-default-separator 'wave)
(display-time-mode t)

(use-package evil
  :ensure t
 :init
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (setq evil-leader/in-all-states 1)
    (evil-leader/set-leader ",")
    (global-evil-leader-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t))

(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                    (interactive)
                    (evil-scroll-up nil)))

(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                        (interactive)
                        (evil-scroll-down nil)))

;;Exit insert mode by pressing j and then k quickly
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(setq evil-move-cursor-back nil)

(dolist (mode '(ag-mode
                  flycheck-error-list-mode
                  git-rebase-mode))
    (add-to-list 'evil-emacs-state-modes mode))

(add-hook 'occur-mode-hook
          (lambda ()
            (evil-add-hjkl-bindings occur-mode-map 'emacs
              (kbd "/")       'evil-search-forward
              (kbd "n")       'evil-search-next
              (kbd "N")       'evil-search-previous
              (kbd "C-d")     'evil-scroll-down
              (kbd "C-u")     'evil-scroll-up
              (kbd "C-w C-w") 'other-window)))

(helm-mode 1)

;; helm settings (TAB in helm window for actions over selected items, C-SPC to select items)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-M-x-fuzzy-match t)

(global-set-key (kbd "M-x") 'helm-M-x)
(define-key evil-normal-state-map "  " 'helm-mini)

;;; C-c as general purpose escape key sequence.
(defun my-esc (prompt)
    "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
    (cond
    ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as Key Lookup will use it.
    ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
    ;; This is the best way I could infer for now to have C-c work during evil-read-key.
    ;; Note: As long as I return [escape] in normal-state, I don't need this.
    ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
    (t (kbd "C-g"))))
; (define-key key-translation-map (kbd "C-c") 'my-esc)
; ;; Works around the fact that Evil uses read-event directly when in operator state, which doesn't use the key-translation-map.
; (define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
; ;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's documentation of it.
; (set-quit-char "C-c")

(setq scroll-margin 5
    scroll-conservatively 9999
    scroll-step 1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
