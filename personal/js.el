;;; js --- this is my personal settings for javascript

;;; Commentary:
;;; this should probably be renamed to something more generic

;;; Code:

;; adds line numbers and and some margin to the line
;; number column
;;(global-linum-mode t)
;;(setq linum-format "%4d \u2502 ")

;;(global-relative-line-numbers-mode)


(require 'linum-relative)
(setq linum-relative-format "%3s  ")

(global-linum-mode t)
(projectile-global-mode)

(load-theme 'tsdh-dark t)

(require 'web-mode)
(setq web-mode-content-types-alist '(("jsx" . "/*\\.js\\'")) )

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

(provide 'js)
;;; js.el ends here
