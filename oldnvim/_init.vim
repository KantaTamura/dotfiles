"dein Scripts-----------------------------
if &compatible
	set nocompatible	" Be iMproved
endif

" Required:
set runtimepath+=/home/i0ta/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
"call dein#begin('/home/i0ta/.cache/dein')

" Let dein manage dein
" Required:
"call dein#add('/home/i0ta/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
"call dein#end()

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"	call dein#install()
"endif

"End dein Scripts-------------------------

set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set splitright
set clipboard=unnamed,unnamedplus
set hls

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog  = '/usr/bin/python'

set helplang=ja,en

"mouse
set mouse=a

