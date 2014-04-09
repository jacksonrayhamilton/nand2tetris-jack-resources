;; Define several class of keywords.
(defvar jack-types '("int" "boolean" "char" "void" "Math" "String" "Array" "Output" "Screen" "Keyboard" "Memory" "Sys"))
(defvar jack-keywords '("class" "constructor" "method" "function" "var" "static" "field" "let" "do" "if" "else" "while" "return"))
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

(define-derived-mode jack-mode c-mode "jack-mode"
  "A major mode to edit Nand2Tetris' .jack files."

  (set (make-local-variable 'font-lock-defaults) '(jack-font-lock-defaults))

  ;; When there's an override, use it.
  ;; Otherwise it gets the default value.
  (when jack-tab-width
    (set (make-local-variable 'tab-width) jack-tab-width)))

(provide 'jack-mode)
