"dmrd vimrc
"Frankensteined from the internet.  Large parts from Steve Losh

"Init -----------------------------------------------{{{
set nocompatible "It's not vi!
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Github repos

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
Bundle 'bkad/CamelCaseMotion'
Bundle 'chrisbra/NrrwRgn'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'godlygeek/tabular'
Bundle 'hsitz/VimOrganizer'
Bundle 'jcf/vim-latex'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kikijump/tslime.vim'
"Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

" Unite
"Bundle 'h1mesuke/unite-outline'
"Bundle 'Shougo/unite.vim'
"
Bundle 'sjbach/lusty'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'xolox/vim-easytags'
let g:easytags_updatetime_autodisable=1
Bundle 'xolox/vim-session'
Bundle 'xuhdev/SingleCompile'

" Vim-scripts
Bundle 'LargeFile'
Bundle 'OmniCppComplete'
Bundle 'TaskList.vim'
Bundle 'utl.vim'
Bundle 'YankRing.vim'
Bundle 'ZoomWin'
Bundle 'scratch.vim'

" }}}

" Basic options -----------------------------------------------{{{
filetype plugin indent on

set encoding=utf-8
set modelines=0

set updatetime=4000

"Misc settings for usability

syntax on
"Allow hidden buffers
set hidden

"Number of spaces a tab ('\t') is shown as
set tabstop=8
"Number spaces to use per step of autoindent (<< >> cindent)
set shiftwidth=4
"Number of spaces pressing tab inserts
set softtabstop=4
"Presing tab inserts spaces
set expandtab
"set smarttab

"Scroll up or down when # lines away from edge
set scrolloff=3
set autoindent
set showmode
set showcmd
"No flashing.
set novisualbell
"Highlight current screen line
set cursorline
"Increases smoothness - fast terminal
set ttyfast
"Show current line/column in statusbar
set ruler
"Can backspace over autoindents, linebreaks (join lines), and start of insert
"without start means no backspacing except through what was just inserted.
"Must use x/d/some other method in such cases
set backspace=indent,eol,start "Same as set backspace=2
"Every window has a status line
set laststatus=2
"Line numbers - can set relative/absolute style
set number

" Don't try to highlight lines longer than 500 characters.
set synmaxcol=500

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw
" Better Completion
set completeopt=longest,menu,menuone,preview

"Wrap text to fit on screen
set wrap
"Break lines at whitespace after # characters
set textwidth=79
"q: allow formatting comments with gq
"r: auto insert comment leader on newline
"n: detect numbered lists
"1: Don't break line after 1 letter words
set formatoptions=qrn1
"Highlight the column, match with max line length
set colorcolumn=80
"Do not scroll windows together
set noscrollbind

"Enable mouse, hide mouse when typing in gvim
set mouse=a "HERESY!
set mousehide

"Special characters for tab and eol
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
"Check these directories for tag files
set tags+=~/vim/commontags
set tags+=./tags;
" }}}

" Wildmenu ---------------------------------------------{{{

"Command completion - list all matches, match to longest string
set wildmenu
set wildmode=list:longest

"Ignore all of this
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
set gdefault "Global substitute by default - put /g to change to first in line
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

nnoremap <leader>ss :SaveSession 
nnoremap <leader>so :OpenSession 


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

" Outline all buffers
nnoremap <leader>uo :Unite outline<cr>
nnoremap <leader>uu :Unite 

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
    colorscheme zenburn
    "        colorscheme peaksea
    "        colorscheme moria
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

"Useful plugin for fast switching - default ,lj
"nnoremap <Leader>b LustyJuggler<cr>
"Disable default mappings for LustyJuggler/Explorer
"I do not use explorer, so no new mappings for it
"let g:LustyJugglerDefaultMappings=0
let g:LustyExplorerDefaultMappings=0
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
"let g:slime_target = "screen"

" when to enable large file plugin in MB
let g:LargeFile=10

"Yankring location
let g:yankring_history_dir="~/.vim/tmp"

" <F9>
" <F10>
" Used for singlecompile

"Tagbar for tag navigation
map <F11> :TagbarToggle<cr>

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
augroup END
" }}}

" Vim {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
augroup END
" }}}

" Org stuff {{{
augroup ft_org
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
    let g:org_mobile_directory = ["/mnt/data/Dropbox/org/mobile"]
    let g:org_mobile_files = ["/mnt/data/Dropbox/main.org"]
    let g:org_mobile_inbox_for_pull = ["/mnt/data/Dropbox/org/mobile/from-mobile.org"]
augroup END

" }}}


" }}}
