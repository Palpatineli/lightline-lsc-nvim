# lightline-lsc-nvim

This plugin provides [LanguageClient-neovim](https://github.com/autozimu/LanguageClient-neovim) status indicator for [lightline](https://github.com/itchyny/lightline.vim).

In many ways, this is a conversion of [lightline-ale](https://github.com/maximbaz/lightline-ale) to work with [LanguageClient-neovim](https://github.com/autozimu/LanguageClient-neovim).

## Missing functions

This plugin does not tell the difference between warning and errors, as LanguageClient-neovim doesn't seem to have that query function...

## Installation

```viml
call dein#add('palpatineli/lightline-lsc-nvim')
```

### Dependency

```viml
autozimu/LanguageClient-neovim
```

and

```viml
itchyny/lightline.vim
```

obviously.

## Configuration

### Create lightline components

```viml
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#lsc#checking',
      \  'linter_warnings': 'lightline#lsc#warnings',
      \  'linter_errors': 'lightline#lsc#errors',
      \  'linter_ok': 'lightline#lsc#ok',
      \ }
```

### Set component colors

```viml
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
```

### Add the created components to lightline

```viml
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
```

## Icons for indicators

##### `g:lightline#ale#indicator_checking`

The indicator to use when ALE is in progress. Default is `Linting...`.

##### `g:lightline#ale#indicator_notstarted`

The indicator to use when the server is not started. Default is `Starting...`.

##### `g:lightline#ale#indicator_errors`

The indicator to use when there are errors. Default is `E:`.

##### `g:lightline#ale#indicator_ok`

The indicator to use when there are no warnings or errors. Default is `OK`.

### Using icons as indicators

The recommended icons (if you are using a nerd font)

```viml
let g:lightline#lsc#indicator_checking = "\uf110"
let g:lightline#lsc#indicator_notstarted = "\ufbab"
let g:lightline#lsc#indicator_errors = "\uf05e"
let g:lightline#lsc#indicator_ok = "\uf00c"
```
