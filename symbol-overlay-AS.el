
;; Setup symbol-overlay
(require 'symbol-overlay)
(global-set-key (kbd "C-M-j") 'symbol-overlay-put)
(global-set-key (kbd "M-]") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-[") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)

;; Highlight all instances of variable under the cursor
(add-hook 'prog-mode-hook #'symbol-overlay-mode)

(add-hook 'symbol-overlay-mode
          (progn
            (defun symbol-overlay-mode-jump-first ()
               "Jump to the first location."
               (interactive)
               (symbol-overlay-adjust-position)
               (let* (;(symbol (symbol-overlay-get-symbol))
                      (before (symbol-overlay-get-list -1)); symbol))
                      (count (length before)))
                 (symbol-overlay-jump-call #'symbol-overlay-basic-jump (- count))))
             (defun symbol-overlay-mode-jump-last ()
               "Jump to the last location."
               (interactive)
               (symbol-overlay-adjust-position)
               (let* (;(symbol (symbol-overlay-get-symbol))
                      (after (symbol-overlay-get-list 1)); symbol))
                      (count (length after)))
                 (symbol-overlay-jump-call #'symbol-overlay-basic-jump (- count 1))))
             (define-key symbol-overlay-mode-map (kbd "C->")
             'symbol-overlay-jump-next)
             (define-key symbol-overlay-mode-map (kbd "C-<")
               'symbol-overlay-jump-prev)
             (define-key symbol-overlay-mode-map (kbd "C-M-<")
             'symbol-overlay-mode-jump-first)
             (define-key symbol-overlay-mode-map (kbd "C-M->")
             'symbol-overlay-mode-jump-last) ))

;; (let ((map (make-sparse-keymap)))
;;   (define-key map  (kbd "C->") 'symbol-overlay-jump-next)    
;;   (define-key map  (kbd "C-<") 'symbol-overlay-jump-prev)    
;;   (define-key map  (kbd "C-M-<") 'symbol-overlay-mode-jump-first) 
;;   (define-key map  (kbd "C-M->") 'symbol-overlay-mode-jump-last)
;;   (setq symbol-overlay-mode-map map))
