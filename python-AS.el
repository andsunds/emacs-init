;; Additions to python-mode
(defun python-kill-running-process () (interactive)
       (if (get-buffer-process "*Python*")
           (python-shell-send-string "exit()")
         (message "No python process running!")))
       

(defun python-restart-shell-send-buffer () (interactive)
       (setq curr-buff (buffer-name))
       (when (get-buffer-process "*Python*")
         (python-kill-running-process)
         (while (get-buffer-process "*Python*")
         (sit-for 0.1)))
       (run-python)
       (end-of-buffer)
       ;; (while (not python-ready) (sit-for 0.1))
       (sit-for 0.2)
       (switch-to-buffer-other-window curr-buff)
       (python-shell-send-buffer)
       ;; (python-shell-switch-to-shell)
       ;; (switch-to-buffer-other-window curr-buff)
       )

(add-hook 'python-mode-hook
	  (lambda ()
            (define-key python-mode-map (kbd "C-c C-k")
              'python-kill-running-process)
            (define-key python-mode-map (kbd "C-c C-a")
              'python-restart-shell-send-buffer)))

(add-hook 'inferior-python-mode-hook
	  (lambda ()
            (define-key inferior-python-mode-map (kbd "C-c C-k")
              'python-kill-running-process)))
