"dmrd vimrc
"Frankensteined from the internet.  Large parts from Steve Losh

"Init -----------------------------------------------{{{
filetype off
let g:pathogen_disabled = ["python-mode"]
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible "It's not vi!
" }}}

" Basic options -----------------------------------------------{{{
filetype plugin indent on

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
set colorcolumn=80
set noscrollbind "Do not scroll windows together

set mouse=a "HERESY!
set mousehide

set list
set listchars=tab:▸\ ,eol:¬

"Move by screen line
nnoremap j gj
nnoremap k gk
"gj/k now move by logical line
nnoremap gj j
nnoremap gk k
" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =


" Change cdir to current file location
"   Mainly for ctrlp
set autochdir

" }}}

" Tags ----------------------------------------------- {{{
set tags+=~/vim/commontags
set tags+=./tags;
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

"Because everyone loves real regex search (Or, as vim puts it, VERY MAGICAL)
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

"Commented out because tab is autocomplete/snipmate/supertab
"nnoremap <tab> %
"vnoremap <tab> %

" }}}

"backup stuff -----------------------------------------------{{{

set undofile
set undoreload=100000
set undodir=~/.vim/tmp/undo//     " undo files - this I DO need
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups - may not be really needed
set noswapfile                    " It's 2012, Vim. I haz version control

"}}}

" Folding -----------------------------------------------{{{
set foldenable
"Start unfolded
set foldlevelstart=100

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

"Refocus folds - close all folds, open current
nnoremap ,z zMzvzz

"Recursively open current top level fold
nnoremap z0 zCz0

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"Default fold method --- use the three braces ({{{  }}})
setlocal foldmethod=marker

"I should actually learn vimscript...
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
"My fingers are lazy
let mapleader = ','
nnoremap ; :
vnoremap ; :

"Command sanity
set notimeout
set ttimeout
set ttimeoutlen=10
set showcmd

"Clear whitespace in file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"Ack is beautiful with quickfix window
nnoremap <leader>a :Ack
"Servers without Ack
nnoremap <leader>g :grep 
"Hardwrap a paragraph
"nnoremap <leader>q gqip
"Reselect pasted text
nnoremap <leader>v V`]
"Open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<CR>
"Who types jk in normal text anyways?
"Also, remember TODO remap capslock to esc
inoremap jk <ESC>
"Open a new vertical split
nnoremap <leader>w <C-w>v<C-w>l
"Horizontal split
nnoremap <leader>q <C-w>s<C-w>j

"Scratch buffer
nnoremap <leader><tab> :Scratch<cr>

"Open NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

"Toggle rainbow parens - Should make more vibrant
nnoremap <leader>R :RainbowParenthesesToggle<cr>

"Paste from X into terminal
"nnoremap <c-v> :r!xclip -o<cr>
"Nevermind!  Do:
"to paste: "+p or "*p
"to copy:  "+yy or "*yy

"Toggle line numbers - relative good for jumping
nnoremap <leader>lr :setlocal relativenumber!<cr>
nnoremap <leader>la :setlocal number!<cr>

" }}}

"Color -----------------------------------------------{{{
"Get some color in here
syntax on

"set t_Co=256
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
"Overidden by yankring
map <C-p> :bprevious<CR>
map <F2> :bnext<CR>
"Ditto on yankring
map <C-n> :bnext<CR>

" }}}

" Misc mappings and settings ---------------------------- {{{


"TODO: Should find out more about these two - basically hacky local refactor
" Limited usage
" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"Gundo
nnoremap <F4> :GundoToggle<CR>


"command-t entirely in vim script
nnoremap <leader>t :CtrlP<cr>
let g:ctrlp_use_caching = 1
"Keep caches between sessions - f5 to refresh
let g:ctrlp_clear_cache_on_exit = 0


"my [to]do list in each file
map <Leader>d <Plug>TaskList

" alignment plugin
nmap <leader>a= :Tab assignment<cr>
vmap <leader>a= :Tab assignment<cr>

"TODO: Learn how to properly use this for Haskell
let g:slime_target = "tmux"

" when to enable large file plugin
let g:largefile=10

"Yankring location
let g:yankring_history_dir="~/.vim/tmp"

"Prefer Taglist for multiple files, Tagbar more useful for single files
map <F8> :TlistToggle<cr>
map <F9> :TagbarToggle<cr>

map <F12> :make -j5 CXX="ccache g++"

"set cpo-=<
"set wcm=<C-Z>
"map <F4> :emenu <C-Z>

"Nerdtree if no arguments given
"autocmd vimenter * if !argc() | NERDTree | endif


" }}}

"Language bindings --------------------------------------- {{{

"Generate ctags when saving c/cpp files
au BufWritePost *.c,*.cpp,*.h,*.hpp silent! !ctags -R &
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
    " set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!
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

    " Org stuff {{{
    au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
    au BufEnter *.org            call org#SetOrgFileType()
    let g:org_command_for_emacsclient = 'emacsclient'
    
    let g:org_capture_file = '/mnt/data/Dropbox/org/captures.org'
    command! OrgCapture :call org#CaptureBuffer()
    command! OrgCaptureFile :call org#OpenCaptureFile()

    let g:org_agenda_select_dirs = ["/mnt/data/Dropbox/org/"]
    let g:org_agenda_files = split(glob("/mnt/data/Dropbox/org/*.org"),"\n")
    let g:org_agenda_window_position = 'right'

    nnoremap <leader>c :OrgCapture<cr>
    nnoremap <leader>o :OrgCaptureFile<cr>
    au BufEnter *.org :1SpeedDatingFormat %Y-%m-%d %a
    "This is rather buggy...
    let g:org_mobile_directory = ["mnt/data/Dropbox/org/mobile"]
    let g:org_mobile_files = ["mnt/data/Dropbox/main.org"]
    let g:org_mobile_inbox_for_pull = ["mnt/data/Dropbox/org/mobile/from-mobile.org"]


    " }}}


    " }}}
