;; This is my personal init file. Add the following lines to the `.emacs` file
;; 
;; (add-to-list 'load-path "/home/andsunds/.emacs.d/own_addons")
;; (load "init-AS.el" nil t t)



;; Removes the backup "tilde" files
(setq make-backup-files nil)
;; Default with show-paren-mode
(show-paren-mode 1)
;; Disable indent with tabs
(setq-default indent-tabs-mode nil)

;; Add MELPA repositories 
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Add the paragraph movement (C-up/down) to the "natural" navigation
;; command (M-p/n)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n")  'forward-paragraph)
;; Adapt the auto-complete for Swedish keyboard (similar to undo: C-_)
(global-set-key (kbd "M-_") 'dabbrev-expand)
(global-set-key (kbd "M-ö") 'comment-dwim)

;; Swedish keyboard
(global-set-key (kbd "s-[") (lambda () (interactive) (insert "å")))
(global-set-key (kbd "s-{") (lambda ()(interactive) (insert "Å")))
(global-set-key (kbd "s-;") (lambda () (interactive) (insert "ö")))
(global-set-key (kbd "s-:") (lambda () (interactive) (insert "Ö")))
(global-set-key (kbd "s-'") (lambda () (interactive) (insert "ä")))
(global-set-key (kbd "s-\"") (lambda () (interactive) (insert "Ä")))

(global-set-key (kbd "s-SPC [") (lambda () (interactive) (insert "å")))
(global-set-key (kbd "s-SPC {") (lambda ()(interactive) (insert "Å")))
(global-set-key (kbd "s-SPC ;") (lambda () (interactive) (insert "ö")))
(global-set-key (kbd "s-SPC :") (lambda () (interactive) (insert "Ö")))
(global-set-key (kbd "s-SPC '") (lambda () (interactive) (insert "ä")))
(global-set-key (kbd "s-SPC \"") (lambda () (interactive) (insert "Ä")))

;; loading other settings
(load "andsundstex.el" nil t t)
(load "python-AS.el" nil t t)
(load "symbol-overlay-AS.el" nil t t)
(load "show-paren-off-screen.el" nil t t)
