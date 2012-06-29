"dmrd vimrc
"Frankensteined from the internet.  Large parts from Steve Losh

"Init -----------------------------------------------{{{ 
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible "It's not vi!
" }}}

" Basic options -----------------------------------------------{{{
filetype plugin on
filetype indent on

set encoding=utf-8
set modelines=0

"Misc settings for usability

syntax on
"Allow hidden buffers
set hidden

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

set scrolloff=3
set autoindent
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

" Don't try to highlight lines longer than 500 characters.
set synmaxcol=500

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw
" Better Completion
set completeopt=longest,menuone,preview

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set noscrollbind "Do not scroll windows together

set mouse=a "HERESY!
set mousehide

set list
set listchars=tab:▸\ ,eol:¬

"Move by screen line
nnoremap j gj
nnoremap k gk

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =


" }}}

" Search -----------------------------------------------{{{

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault "Global substitute by default
set incsearch
set showmatch
set hlsearch
set wrapscan
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


" }}}

"backup stuff -----------------------------------------------{{{

set undofile
set undoreload=100000
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

"}}}

" Folding -----------------------------------------------{{{
set foldenable
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

"Refocus folds
nnoremap ,z zMzvzz

"Recursively open current top level fold
nnoremap z0 zCz0

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

let g:FoldMethod=0
map <leader>f :call ToggleFold()<cr>

fun! ToggleFold()
    if g:FoldMethod == 0
        exe 'setlocal foldmethod=indent'
        let g:FoldMethod = 1
    else if g:FoldMethod == 1
        exe 'setlocal foldmethod=marker'
        let g:FoldMethod = 2
    else if g:FoldMethod == 2
        exe 'setlocal foldmethod=syntax'
        let g:FoldMethod = 0
    endif
    redraw!
endfun
" }}}

" Leader stuff:  -----------------------------------------------{{{
let mapleader = ','
nnoremap ; :
set notimeout
set ttimeout
set ttimeoutlen=10
set showcmd


""Clear whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> 
nnoremap <leader>a :Ack
 "Hardwrap a paragraph
nnoremap <leader>q gqip
  "Reselect pasted text
nnoremap <leader>v V`]
"Open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> 
"Who types jj in normal text anyways?
inoremap jj <ESC> 
"Open a new vertical split
nnoremap <leader>w <C-w>v<C-w>l 

"Scratch buffer
nnoremap <leader><tab> :Scratch<cr>
"
"Open NERDTree
nnoremap <leader>n :NERDTree<cr>

"Toggle rainbow parens
nnoremap <leader>R :RainbowParenthesesToggle<cr>

"Paste from outside into terminal
nnoremap <leader>p :r!xclip -o<cr>

"Toggle line numbers
nnoremap <leader>lr :setlocal relativenumber!<cr>
nnoremap <leader>la :setlocal number!<cr>

" }}} 

"Color -----------------------------------------------{{{
"Get some color in here
syntax on
if &t_Co >= 256 || has("gui_running")
	colorscheme zenburn
endif
" }}}

"Buffer navigation -----------------------------------------------{{{
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <F1> :bprevious<CR>
map <C-p> :bprevious<CR>
map <F2> :bnext<CR>
map <C-n> :bnext<CR>
" }}}

" Misc mappings and settings {{{
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

map <F12> :make -j5 CXX="ccache g++"

set wcm=<C-Z>

map <F4> :emenu <C-Z>

"Nerdtree if no arguments given
"autocmd vimenter * if !argc() | NERDTree | endif
" }}}


"Language bindings {{{

" C/++ {{{
augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END
" }}}

" Haskell {{{
augroup ft_haskell
    au!
    au BufEnter *.hs compiler ghc
augroup END
" }}}

" Java {{{"{{{
augroup ft_java
    au!
    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END
" }}}

" Javascript {{{
augroup ft_javascript
    au!
    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
augroup END

" }}}

" Python {{{
    augroup ft_python
        au!
        au FileType python setlocal foldmethod=indent
        au Filetype python setlocal foldnextmax=2
" }}}

" Vim {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
augroup END
" }}}
" }}}
