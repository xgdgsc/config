(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(eclim-eclipse-dirs (quote ("/opt/eclipse")))
 '(eclim-executable "/opt/eclipse/eclim")
 '(semantic-c-dependency-system-include-path (quote ("/usr/include" "/usr/include/c++/4.7.2/" "/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include/")))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(add-to-list 'load-path "/usr/share/auto-complete/")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/ac-dict")
(ac-config-default)

;; show menu immediately...
(setq ac-auto-show-menu t)
;; (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)    
;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)    
;; (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)    
;; (add-hook 'css-mode-hook 'ac-css-mode-setup)    
;; (add-hook 'auto-complete-mode-hook 'ac-common-setup)   




(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

					;(add-to-list 'load-path "/home/gsc/.emacs.d/elpa/yasnippet-0.8.0/")
					;(require 'yasnippet)
					;(yas-global-mode 1)
					;(yas/minor-mode-on)


(global-unset-key (kbd "C-SPC"))  
(global-set-key (kbd "S-SPC") 'set-mark-command)  

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(desktop-save-mode 1)

(show-paren-mode 1)
(setq show-paren-delay 0)



(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet/common/")
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")

(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)
(global-set-key [f8] 'semantic-ia-fast-jump)

(add-hook 'c-mode-common-hook
	  (lambda() 
	    (local-set-key  (kbd "<f4>") 'ff-find-other-file)))


(global-linum-mode t)
(global-auto-revert-mode 1)

;; Semantic with ghost display (allows M-n and M-p to browse 
;; completion).
(require 'semantic-ia)


(defalias 'yes-or-no-p 'y-or-n-p)

(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)


;; auto-complete-clang config stuff
(defun my-ac-config ()    
  (setq ac-clang-flags    
        (mapcar(lambda (item)(concat "-I" item))    
               (split-string    
                "  
/usr/include/c++/4.7.2
/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/x86_64-unknown-linux-gnu
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/backward
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include
 /usr/local/include
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include-fixed
 /usr/include
"  
		))))

(defun my-ac-cc-mode-setup ()    
  (setq ac-sources (append '(ac-source-clang) ac-sources)))    
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)    

(add-hook 'c-mode-common-hook '(lambda ()
				 (add-to-list 'ac-omni-completion-sources
					      (cons "\\." '(ac-source-clang)))
				 (add-to-list 'ac-omni-completion-sources
					      (cons "->" '(ac-source-clang)))
				 (setq ac-sources (append '(ac-source-clang) ac-sources))))
;; (setq ac-sources (append '(ac-source-filename  ac-source-functions ac-source-variables ac-source-symbols ac-source-features ac-source-abbrev ac-source-words-in-same-mode-buffers ac-source-dictionary)))


;;(setq ac-clang-auto-save t)  
(my-ac-config)  
(ac-config-default)

;; (require 'pos-tip)
;; (setq ac-quick-help-prefer-pos-tip t)   ;default is t
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))



(global-set-key [f11] 'my-fullscreen) ;; 启动全屏的快捷键
					;全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )
(defun my-maximized ()
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(server-start)				;启动服务器
					;启动时最大化
					;(my-fullscreen)
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)                          
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))                          
			      auto-mode-alist))     

(add-to-list 'load-path "/usr/share/emacs/site-lisp/autopair.el")
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers 

(iswitchb-mode 1)

(defalias 'list-buffers 'ibuffer)

(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-emacs-buffer ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))


;; sample easy keys

;; (global-set-key (kbd "<C-o>") 'find-file) ; Open file or dir
;; (global-set-key (kbd "<C-w>") 'kill-this-buffer) ; Close file

(global-set-key (kbd "<C-prior>") 'previous-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "<C-next>") 'next-user-buffer) ; Ctrl+PageDown
(global-set-key (kbd "<C-S-prior>") 'previous-emacs-buffer) ; Ctrl+Shift+PageUp
(global-set-key (kbd "<C-S-next>") 'next-emacs-buffer) ; Ctrl+Shift+PageDown



(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\?php\|<\? \|<\?=" "\?>")
		  (js-mode "<script +\(type=\"text/javascript\"\|language=\"javascript\"\)[^>]*>" "</script>")
		  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)


(defun flymake-clang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory (buffer-file-name)))))
    `("clang" ,(append ac-clang-flags
                       `("-fsyntax-only"
                         "-fno-color-diagnostics"
                         ,local-file)))))
(defun flymake-clang-load ()
  (interactive)
  (when (buffer-file-name)
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'"
                   flymake-clang-init))
    (flymake-mode-on)))
(add-hook 'c-mode-hook
          (lambda ()
            (add-hook 'hack-local-variables-hook
                      'flymake-clang-load
                      nil t)))
(add-hook 'c++-mode-hook
          (lambda ()
            (add-hook 'hack-local-variables-hook
                      'flymake-clang-load
                      nil t)))

(global-set-key (kbd "C-x k") 
		'(lambda () (interactive) 
		   (let (kill-buffer-query-functions) (kill-buffer))))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/multiple-cursors/")
(require 'multiple-cursors)
(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "/home/gsc/.emacs.d/elpa/emacs-eclim-20130310.1237/")
(require 'eclim)
(global-eclim-mode)



(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(add-hook 'eclim-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-emacs-eclim)
            (add-to-list 'ac-sources 'ac-source-emacs-eclim-c-dot)))
