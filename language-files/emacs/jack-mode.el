;; Define several classes of keywords.
(defvar jack-types '("int" "boolean" "char" "void" "Math" "String" "Array"
"Output" "Screen" "Keyboard" "Memory" "Sys"))
(defvar jack-keywords '("class" "constructor" "method" "function" "var" "static"
"field" "let" "do" "if" "else" "while" "return"))
(defvar jack-constants '("true" "false" "null" "this"))

;; Create a proper regex string for each keyword group.
(defvar jack-types-regexp (regexp-opt jack-types 'words))
(defvar jack-keywords-regexp (regexp-opt jack-keywords 'words))
(defvar jack-constants-regexp (regexp-opt jack-constants 'words))

;; Create the list for font-lock.
;; Each class of keyword is given a particular face.
(defvar jack-font-lock-defaults
  `((,jack-types-regexp . font-lock-type-face)
    (,jack-constants-regexp . font-lock-constant-face)
    (,jack-keywords-regexp . font-lock-keyword-face)))

(defvar jack-tab-width 2 "Width of a tab for Jack mode.")

(defvar jack-tools-directory
  "/home/jackson/architecture/nand2tetris/tools/"
  "Your nand2tetris tools folder.")

(defvar jack-build-directory
  "/home/jackson/architecture/jack-resources/libraries/"
  "Absolute path to your build directory.")

;; Execution.
(defun jack-execute()
  "Runs the VMEmulator."
  (interactive)
  (call-process-shell-command (concat jack-tools-directory "VMEmulator.sh&") nil 0))

;; Compilation.
(defun jack-build()
  "Builds a jack directory."
  (interactive)
  (shell-command (format "%s %s"
                         (concat jack-tools-directory "JackCompiler.sh")
                         jack-build-directory)))

(defvar jack-mode-map nil "Keymap for jack-mode.")
(when (not jack-mode-map)
  (setq jack-mode-map (make-sparse-keymap))
  (define-key jack-mode-map (kbd "<f5>") 'jack-execute)
  (define-key jack-mode-map (kbd "<f9>") 'jack-build))

(define-derived-mode jack-mode c-mode "Jack"
  "A major mode to edit Nand2Tetris' .jack files."

  (set (make-local-variable 'font-lock-defaults) '(jack-font-lock-defaults))

  ;; When there's an override, use it.
  ;; Otherwise it gets the default value.
  (when jack-tab-width
    (set (make-local-variable 'tab-width) jack-tab-width))

  (use-local-map jack-mode-map)

  (run-hooks 'jack-mode-hook))

(provide 'jack-mode)
