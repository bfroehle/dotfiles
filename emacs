(setq inhibit-startup-message t)
(line-number-mode t)
(column-number-mode t)
(setq-default indent-tabs-mode nil)

;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

(add-to-list 'load-path "~/.emacs.d/vendor")

;; Add Cython mode
(load "cython-mode")

;; Add xclip support
(load "xclip")

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

;; mo-git-blame
;; https://github.com/mbunkus/mo-git-blame
(add-to-list 'load-path "~/.emacs.d/vendor/mo-git-blame")
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(global-set-key (kbd "C-c g c") 'mo-git-blame-current)
(global-set-key (kbd "C-c g f") 'mo-git-blame-file)
