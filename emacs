(setq inhibit-startup-message t)
(line-number-mode t)
(column-number-mode t)
(setq-default indent-tabs-mode nil)

;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; Vendor extensions:
(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'cython-mode)
;(require 'xclip)
(require 'diff-mode-)
;(require 'julia-mode)
;(setq auto-mode-alist
;      (append '(("\\.jl$" . julia-mode)) auto-mode-alist))
(require 'hg-tools)
(add-to-list 'load-path "~/.emacs.d/vendor/git-tools.el")
(require 'git-tools)

(add-to-list 'load-path "~/.emacs.d/vendor/autopair")
(require 'autopair)
(autopair-global-mode)

;; Lambda mode
(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))

;; Color theme: solarized (Emacs 23)
;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")
;(require 'color-theme)
;(require 'color-theme-solarized)
;(setq solarized-termcolors 256)
;(setq solarized-contrast "high")
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-initialize)
;     (color-theme-solarized-dark)))

;; Color theme: solarized (Emacs 24)
;(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")
;(load-theme 'solarized-dark t)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;; LaTeX
(setq latex-run-command "pdflatex")
(setq tex-output-extension ".pdf")

;; MATLAB mode
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
(setq matlab-indent-level 2)
(put 'upcase-region 'disabled nil)


;(defvar server-buffer-clients)
;(when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
;  (server-start)
;  (defun fp-kill-server-with-buffer-routine ()
;    (and server-buffer-clients (server-done)))
;  (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

(require 'ipython)
(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
; (setq ansi-color-for-comint-mode t)

;; Diff current buffer with file contents
(defun diff-current-buffer-with-file ()
  "View the differences between the current buffer and its associated file."
  (interactive)
  (diff-buffer-with-file (current-buffer)))
(global-set-key (kbd "C-c =") 'diff-current-buffer-with-file)

;; Use unified diffs
(setq diff-switches "-u")

;; mo-git-blame
;; https://github.com/mbunkus/mo-git-blame
(add-to-list 'load-path "~/.emacs.d/vendor/mo-git-blame")
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(global-set-key (kbd "C-c g c") 'mo-git-blame-current)
(global-set-key (kbd "C-c g f") 'mo-git-blame-file)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Use the system wide default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "xdg-open")

;; CPython 3.x Style
;; http://mail.python.org/pipermail/python-dev/2008-May/079582.html
(c-add-style
 "python-new"
 '((indent-tabs-mode . nil)
   (fill-column      . 78)
   (c-basic-offset   . 4)
   (c-offsets-alist  . ((substatement-open . 0)
                        (inextern-lang . 0)
                        (arglist-intro . +)
                        (knr-argdecl-intro . +)))
   (c-hanging-braces-alist . ((brace-list-open)
                              (brace-list-intro)
                              (brace-list-close)
                              (brace-entry-open)
                              (substatement-open after)
                              (block-close . c-snug-do-while)))
   (c-block-comment-prefix . "* ")
  )
)

; Markdown Mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; https://github.com/antonj/Highlight-Indentation-for-Emacs
(add-to-list 'load-path "~/.emacs.d/vendor/Highlight-Indentation-for-Emacs")
(require 'highlight-indentation)
; (add-hook 'python-mode-hook 'highlight-indentation)
