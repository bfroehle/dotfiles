(setq inhibit-startup-message t)
(line-number-mode t)
(column-number-mode t)
(setq-default indent-tabs-mode nil)

;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; Add Cython mode
(add-to-list 'load-path "~/.emacs.d/vendor")
(load "cython-mode")

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
