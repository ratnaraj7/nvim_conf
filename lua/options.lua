vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

let g:clipboard = {
    \   'copy': {
    \       '+': ['wl-copy', '--trim-newline'],
    \       '*': ['wl-copy', '--trim-newline'],
    \   },
    \   'paste': {
    \       '+': ['wl-paste', '--no-newline'],
    \       '*': ['wl-paste', '--no-newline'],
    \   },
    \ }

