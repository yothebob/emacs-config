# PHPs - Emacs major mode for PHP with code intelligence

[![License GPL 3](https://img.shields.io/badge/license-GPL_3-green.svg)](https://www.gnu.org/licenses/gpl-3.0.txt)
[![Build Status](https://api.travis-ci.com/cjohansson/emacs-phps-mode.svg?branch=master)](https://app.travis-ci.com/github/cjohansson/emacs-phps-mode)

**Goal**: An Emacs major mode for PHP scripting language which aims at making a full syntax and semantic integration. Currently at *usable* stage.

This mode does not require PHP installed on your computer because it has a built-in elisp based lexer and parser. It supports Emacs >= 26.

## Features

* GPLv3 license
* Flycheck support with `(phps-mode-flycheck-setup)`
* Lexer based on official PHP 8.1 re2c generated lexer
* Syntax coloring based on lexer tokens, makes it easier to spot invalid code
* PSR-1, PSR-2 and PSR-12 indentation
* PSR-1, PSR-2 and PSR-12 supported white-space
* Support for indentation of HTML and XML
* Integration with `(electric-pair)`
* Incremental lexer and syntax coloring after buffer changes
* Incremental parser, imenu and bookkeeping generation after buffer changes
* Supports `(comment-region)` and `(uncomment-region)`
* Support indentation for inline-html areas
* Imenu support
* Minimal mode map
* Tested using unit tests and integration tests
* Continuous integration tests using Travis
* Included in GNU ELPA package archive
* Support for asynchronous lexer via processes (`async.el`) or threads
* Mode-line asynchronous status
* Bookkeeping in lexical-analysis, showing defined and undefined variables via syntax coloring (requires a theme that has distinct colors for 'font-lock-warning-face and 'font-lock-variable-name-face)
* Canonical LR(1) Parser automatically generated from official PHP 8.1 LALR(1) YACC grammar

## Issues and roadmap

See [TODO.md](TODO.md)

## Keymap

* `C-c C-r` Rescan buffer
* `C-c C-f` Format buffer

## Installation

### Install manually

If you have downloaded manually i.e. to `~/.emacs.d/phps-mode/` you need to add this first to your init file:

``` emacs-lisp
(add-to-list 'load-path (expand-file-name "~/.emacs.d/phps-mode/"))
```

### Install via package manager

You can install via ELPA (`M-x package-install` + `RET` + `phps-mode` + `RET`), package will now be loaded automatically when Emacs starts.

## Configuration

### Enable flycheck support

For flycheck support run `(phps-mode-flycheck-setup)`.

### Asynchronous lexer

Enable with `(setq phps-mode-async-process t)`
Disable with `(setq phps-mode-async-process nil)`

### Asynchronous lexer via async.el processes

Enable with:

``` emacs-lisp
(setq phps-mode-async-process-using-async-el t)
```

### Asynchronous lexer via threads

Enable with:

``` emacs-lisp
(setq phps-mode-async-process-using-async-el nil)
```

## Installation and Configuration examples

### Install, load and configure via use-package with flycheck support, asynchronous support via async.el

``` emacs-lisp
(use-package phps-mode
    :after flycheck
    :ensure t
    :mode ("\\.php\\'" "\\.phtml\\'")
    :config
    (phps-mode-flycheck-setup)
    (setq phps-mode-async-process t)
    (setq phps-mode-async-process-using-async-el t))
```

### Load and configure using use-package with flycheck support, asynchronous support via threads

``` emacs-lisp
(use-package phps-mode
    :after flycheck
    :mode ("\\.php\\'" "\\.phtml\\'")
    :config
    (phps-mode-flycheck-setup)
    (setq phps-mode-async-process t)
    (setq phps-mode-async-process-using-async-el nil))
```

### Load and configure using regular emacs-lisp with flycheck support, no asynchronous support
``` emacs-lisp
(require 'phps-mode)
(add-to-list 'auto-mode-alist '("\\.\\(php\\|phtml\\)\\'" . phps-mode))
(phps-mode-flycheck-setup)
(setq phps-mode-async-process nil)
```
