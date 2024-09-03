;; My LaTex/AUCTeX config for emacs

(require 'auctex)
;;(load "auctex.el" nil t t)

(defvar TeX-lbrak "[" "The opening bracket.")
 (make-variable-buffer-local 'TeX-lbrak)

(defvar TeX-rbrak "]" "The closing bracket.")
 (make-variable-buffer-local 'TeX-rbrak)


(defun TeX-insert-brackets (arg)
  "Make a pair of braces around next ARG sexps and leave point inside.
No argument is equivalent to zero: just insert braces and leave point
between.

If there is an active region, ARG will be ignored, braces will be
inserted around the region, and point will be left after the
closing brace."
  (interactive "P")
  (if (TeX-active-mark)
      (progn
        (if (< (point) (mark))
            (exchange-point-and-mark))
        (insert TeX-rbrak) ;;grcl)
        (save-excursion
          (goto-char (mark))
          (insert TeX-lbrak))) ;;grop)))
    (insert TeX-lbrak) ;;grop)
    (save-excursion
      (if arg (forward-sexp (prefix-numeric-value arg)))
      (insert TeX-rbrak)))) ;;grcl))))



;;;;; AUCtex / LaTeX
;; Starts some  minor modes in LaTeX
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;; line numbers on the side
(add-hook 'LaTeX-mode-hook 'linum-mode)
;; column numbers on mode line
(add-hook 'LaTeX-mode-hook 'column-number-mode)
;; Inserting left and right {} with C-å
(add-hook 'LaTeX-mode-hook
	  (lambda () (define-key LaTeX-mode-map (kbd "C-å")
		       'TeX-insert-braces)))
;; Inserting left and right [] with M-å
(add-hook 'LaTeX-mode-hook
	  (lambda () (define-key LaTeX-mode-map (kbd "M-å")
		       'TeX-insert-brackets)))
;; Remapping ¤ (S-4) to $
(add-hook 'LaTeX-mode-hook
	  (lambda () (define-key LaTeX-mode-map (kbd "¤")
		       'TeX-insert-dollar)))

(add-hook 'LaTeX-mode-hook
	  (lambda () (define-key LaTeX-mode-map (kbd "½")
		       "~")))

;; ;; Fix the qutation marks in swedish
;; (add-hook 'TeX-language-sv-hook
;;           (lambda ()
;;             (font-latex-add-quotes '("''" "''"))))
;; (add-hook 'TeX-language-sv-hook
;;       (lambda ()
;;         (setq TeX-quote-language `("swedish" "''" "''" ,TeX-quote-after-quote))))


;; aucTeX query for master file if several files are used in a single document
(setq-default TeX-master nil)
;; aucTeX variable for indentation in \begin \end environment
(setq LaTeX-indent-level 0) ; I want no indentation
;; ;; Changes the strange behavior of the swedish hyphen character
;; (setq LaTeX-babel-hyphen-language-alist '(("swedish" "" nil)))
;; ;; 
;; (add-hook 'TeX-language-sv-hook
;; 	  (lambda () (ispell-change-dictionary "sv")))


(customize-set-variable
 'LaTeX-indent-environment-list
   '(("verbatim" current-indentation)
     ("verbatim*" current-indentation)
     ("filecontents" current-indentation)
     ("filecontents*" current-indentation)
     ("tabular" LaTeX-indent-tabular)
     ("tabular*" LaTeX-indent-tabular)
     ("array" LaTeX-indent-tabular)
     ("eqnarray" LaTeX-indent-tabular)
     ("eqnarray*" LaTeX-indent-tabular)
     ("alignat" LaTeX-indent-tabular)
     ("alignat*" LaTeX-indent-tabular)
     ("alignedat" LaTeX-indent-tabular)
     ("xalignat" LaTeX-indent-tabular)
     ("xalignat*" LaTeX-indent-tabular)
     ("xxalignat" LaTeX-indent-tabular)
     ("flalign" LaTeX-indent-tabular)
     ("flalign*" LaTeX-indent-tabular)
     ("split" LaTeX-indent-tabular)
     ("matrix" LaTeX-indent-tabular)
     ("pmatrix" LaTeX-indent-tabular)
     ("bmatrix" LaTeX-indent-tabular)
     ("Bmatrix" LaTeX-indent-tabular)
     ("vmatrix" LaTeX-indent-tabular)
     ("Vmatrix" LaTeX-indent-tabular)
     ("smallmatrix" LaTeX-indent-tabular)
     ("cases" LaTeX-indent-tabular)
     ("matrix*" LaTeX-indent-tabular)
     ("pmatrix*" LaTeX-indent-tabular)
     ("bmatrix*" LaTeX-indent-tabular)
     ("Bmatrix*" LaTeX-indent-tabular)
     ("vmatrix*" LaTeX-indent-tabular)
     ("Vmatrix*" LaTeX-indent-tabular)
     ("smallmatrix*" LaTeX-indent-tabular)
     ("psmallmatrix" LaTeX-indent-tabular)
     ("psmallmatrix*" LaTeX-indent-tabular)
     ("bsmallmatrix" LaTeX-indent-tabular)
     ("bsmallmatrix*" LaTeX-indent-tabular)
     ("vsmallmatrix" LaTeX-indent-tabular)
     ("vsmallmatrix*" LaTeX-indent-tabular)
     ("Vsmallmatrix" LaTeX-indent-tabular)
     ("Vsmallmatrix*" LaTeX-indent-tabular)
     ("dcases" LaTeX-indent-tabular)
     ("dcases*" LaTeX-indent-tabular)
     ("rcases" LaTeX-indent-tabular)
     ("rcases*" LaTeX-indent-tabular)
     ("drcases" LaTeX-indent-tabular)
     ("drcases*" LaTeX-indent-tabular)
     ("cases*" LaTeX-indent-tabular)
     ("displaymath")
     ("equation")
     ("picture")
     ("tabbing")
     ("gather")
     ("gather*")
     ("gathered")
     ("equation*")
     ("multline")
     ("multline*")))
