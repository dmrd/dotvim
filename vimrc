"dmrd vimrc
"Frankensteined from the internet.  Large parts from Steve Losh

"Init -----------------------------------------------{{{ 
filetype off
let g:pathogen_disabled = ['command_t']
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
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

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


" Change cdir to current file location
"   Mainly for ctrlp 
set autochdir

" }}}

" Wildmenu ---------------------------------------------{{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*~
set wildignore+=*/.vim/tmp/*

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
"nnoremap <tab> %
"vnoremap <tab> %


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
set foldlevelstart=100

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

"Refocus folds
nnoremap ,z zMzvzz

"Recursively open current top level fold
nnoremap z0 zCz0

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"Default fold method
setlocal foldmethod=marker 

"let g:FoldMethod=0
"map <leader>f :call ToggleFold()<cr>

"fun! ToggleFold()
"    if g:FoldMethod == 0
"        setlocal foldmethod=indent
"        let g:FoldMethod = 1
"    elseif g:FoldMethod == 1
"        setlocal foldmethod=marker
"        let g:FoldMethod = 2
"    elseif g:FoldMethod == 2
"        setlocal foldmethod=syntax
"        let g:FoldMethod = 0
"    endif
"    redraw!
"endfun
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
nnoremap <leader>A :Ack
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
nnoremap <leader>n :NERDTreeToggle<cr>

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

set t_Co=256
if &t_Co >= 256 || has("gui_running")
"        colorscheme peaksea
colorscheme zenburn
"        colorscheme molokai
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


" Misc mappings and settings ---------------------------- {{{

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"Gundo
nnoremap <F5> :GundoToggle<CR>


"command-t entirely in vim script
nnoremap <leader>t :ctrlp

"my [to]do list in each file
map <Leader>d <Plug>TaskList

" alignment plugin
nmap <leader>a= :Tabularize /=<cr>
vmap <leader>a= :Tabularize /=<cr>
nmap <leader>a: :Tabularize /:\zs<cr>
vmap <leader>a: :tabularize /:\zs<cr>


let g:slime_target = "tmux"

" when to enable large file plugin
let g:largefile=10

"Yankring location
let g:yankring_history_dir="~/.vim/tmp"

map <F9> :TlistToggle<cr>

map <F12> :make -j5 CXX="ccache g++"

"set cpo-=<
"set wcm=<C-Z>
"map <F4> :emenu <C-Z>

"Nerdtree if no arguments given
"autocmd vimenter * if !argc() | NERDTree | endif


" }}}


"Language bindings --------------------------------------- {{{

" C {{{
augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END
" }}}

" Cpp {{{
augroup ft_cpp
    au!
    au FileType cpp setlocal foldmethod=syntax
augroup END
" }}}

" Haskell {{{
augroup ft_haskell
    au!
    au BufEnter *.hs compiler ghc
augroup END
let g:haddock_browser = "chromium"
let g:ghc = "/usr/bin/ghc"

" }}}

" Java {{{
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
        au Filetype python setlocal foldnestmax=2
" }}}

" Vim {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
augroup END
" }}}
" }}}
