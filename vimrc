"dmrd vimrc
"Frankensteined from the internet.  Large parts from Steve Losh

"Init pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
if has("autocmd")
	filetype plugin indent on
endif

set nocompatible "It's not vi!

set modelines=0

let mapleader = ','
nnoremap ; :

"Misc settings for usability
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
syntax on
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
"set undofile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault "Global substitute by default
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set noscrollbind "Do not scroll windows together

set mouse=a "HERESY!

set list
set listchars=tab:▸\ ,eol:¬

"Move by screen line
nnoremap j gj
nnoremap k gk



au FocusLost * :wa "Save on lost focus



"Leader stuff: 
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> "Clear whitespace
nnoremap <leader>a :Ack
nnoremap <leader>q gqip "Hardwrap a paragraph
nnoremap <leader>v V`]  "Reselect pasted text
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> "Open vimrc
nnoremap <leader>sv :so $MYVIMRC<cr> "Open vimrc
inoremap jj <ESC> "Who types jj in normal text anyways?
nnoremap <leader>w <C-w>v<C-w>l "Open a new vertical split



"Get some color in here
if &t_Co >= 256 || has("gui_running")
	colorscheme zenburn
endif

"Buffer navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l


map <F12> :make -j5 CXX="ccache g++"


map <F1> :bprevious<CR>
map <C-p> :bprevious<CR>
map <F2> :bnext<CR>
map <C-n> :bnext<CR>

map <F4> :emenu <C-Z>
