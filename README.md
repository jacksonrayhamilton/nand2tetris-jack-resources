Jack Resources
==============

Contained here are resources for the nand2tetris "Jack" programming language.

Features
--------

- Unit testing framework "UnitTest".
    - Provides assertion functions for primitives and objects.
    - Provides detailed feedback for failing tests.
- String utility library aptly-dubbed "Strings".
    - `equals()`
    - `repeat()`
    - `join()`, `concat()`, `split()`
    - `coerceInt()`, `coerceChar()`, `coerceBoolean()`, `parseChar()`
    - `substring()`, `indexOf()`
    - `count()`
    - `sprintf()`
- Output sugar library named "Out".
    - Java-like `println()`
    - C-like `printf()`
    - `printfln()`
- Text-editor language support.
    - Emacs
        - Syntax highlighting including OS classes.
        - Compile `jack-build-directory` with `<f5>`.
        - Run the VMEmulator with `<f9>`.
