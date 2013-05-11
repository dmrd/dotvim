"dmrd vimrc
"Frankensteined from the internet.  Large parts from Steve Losh

"Init -----------------------------------------------{{{
set nocompatible "It's not vi!

"Load vundle plugins
source ~/.vim/plugins.vim

" Basic options & behaviors -----------------------------------------------{{{
filetype plugin indent on

set encoding=utf-8
set modelines=0

set updatetime=1000

"Misc settings for usability

syntax on
"Allow hidden buffers
set hidden

"Number of spaces a tab ('\t') is shown as
set tabstop=4
"Number spaces to use per step of autoindent (<< >> cindent)
set shiftwidth=4
"Number of spaces pressing tab inserts
set softtabstop=4
"Presing tab inserts spaces
set expandtab

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
set pumheight=10
set completeopt=menu,longest,preview  "longest,menu,menuone,preview

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
hi ColorColumn ctermbg=lightgrey guibg=DarkSlateGray
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
"au FocusLost * :silent! wall

"Close preview window when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Resize splits when the window is resized
au VimResized * :wincmd =


" Change cdir to current file location
"   Mainly for ctrlp
set autochdir

" }}}

" Tags ----------------------------------------------- {{{
"Check these directories for tag files
set tags+=~/.vim/tags/;
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
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault "Global substitute by default - put /g to change to first in line
set incsearch
set showmatch
set hlsearch
set wrapscan
nnoremap <leader><space> :noh<cr>
" }}}

"backup stuff -----------------------------------------------{{{

set undofile
set undoreload=100000
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap file location
set noswapfile
set backup                       " enable backups
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

"Default fold method --- marker is use the three braces ({{{  }}})
" indent is use same indent level as fold group
set foldmethod=syntax

" }}}

" Leader stuff & nonplugin leader mappings --------------------------------{{{
"My fingers are lazy
let mapleader = ','
"nnoremap ; : " Easymotion has ; now
"vnoremap ; :

"Command sanity
set notimeout
set ttimeout
set ttimeoutlen=10
set showcmd

"These do not work in terminal Vim
"save file
map <C-s> :w<CR>
"Quit
map <C-q> :q<CR>

"Clear whitespace in file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Reselect pasted text
nnoremap <leader>p V`]

"Open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Exit normal mode with jk or kj
inoremap jk <ESC>
inoremap kj <ESC>

"Open a new vertical split
nnoremap <leader>v <C-w>v<C-w>l

"Horizontal split
nnoremap <leader>h <C-w>s<C-w>j

"Paste from X into terminal
"nnoremap <c-v> :r!xclip -o<cr>
"Nevermind!  Do:
"to paste: "+p or "*p
"to copy:  "+yy or "*yy

"Toggle line numbers - relative good for jumping
nnoremap <leader>lr :setlocal relativenumber!<cr>
nnoremap <leader>la :setlocal number!<cr>

" }}}

"Appearances -----------------------------------------------{{{
"Get some color in here
syntax on

set guifont=Inconsolata\ Medium\ 12
" Remove toolbar
set guioptions-=T
" Remove menu
set guioptions-=m
" Remove right scrollbar
set guioptions-=r
set guioptions-=R
" Remove left scrollbar
set guioptions-=l
set guioptions-=L

if has("gui_running")
    try
        "colorscheme solarized
        "colorscheme zenburn
        "colorscheme wombat
        "colorscheme peaksea
        "colorscheme moria
        colorscheme molokai
    endtry
else
    "Terminal colorscheme
    try
        colorscheme zenburn
    endtry
end
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

" Misc & mappings ---------------------------- {{{

" Close the quickfix window that often opens on startup
autocmd VimEnter * cw

" Write as sudo
cmap w!! w !sudo tee % >/dev/null

"Yank ring
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"Narrow region on selected lines
xmap <F3> <Plug>NrrwrgnDo

"Gundo
nnoremap <F4> :GundoToggle<CR>

"command-t entirely in vim script
"Search files - [F]ind
nnoremap <leader>f :CtrlPMixed<cr>
"Switch [b]uffers
nnoremap <Leader>b :CtrlPBuffer<cr>
"Goto [t]ag
nnoremap <Leader>t :CtrlPBufTagAll<cr>

"my [to]do list in each file
map <Leader>d <Plug>TaskList

" alignment plugin
nmap <leader>a= :Tab assignment<cr>
vmap <leader>a= :Tab assignment<cr>

" when to enable large file plugin in MB
let g:LargeFile=10

"Yankring location
let g:yankring_history_dir="~/.vim/tmp"

" Used for singlecompile
nmap <F9> :SingleCompile<CR>
nmap <F10> :SingleCompileRun<CR>

"Tagbar for tag navigation
map <F11> :TagbarToggle<cr>

map <F12> :make -j8 | copen

"Ack is awesome with quickfix window
nnoremap <leader>a :Ack 

"Scratch buffer
nnoremap <leader><tab> :Scratch<cr>

"Open NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

"Toggle rainbow parens - Should make more vibrant
nnoremap <leader>R :RainbowParenthesesToggle<cr>

" Use ; instead of ,, for easymotion
let g:EasyMotion_leader_key = ';'
" I never use s/S, so remap to easymotion forward/backward
nmap s ;w
nmap S ;b

" Fugitive {{{
let g:extradite_width = 60
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gg :Ggrep 
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <silent> <C-\> :Ggrep <cword><CR>:copen<CR>
" }}}

" VimWiki {{{
    let g:vimwiki_list = [{'path': '~/dropbox/wiki',
                            \ 'syntax': 'markdown',
                            \ 'ext': '.md'}]
    autocmd BufNewFile,BufRead *.md set syntax=markdown
" }}}

" }}}

"Language bindings --------------------------------------- {{{

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

" OCaml {{{
augroup ft_ocaml
    call SingleCompile#SetCompilerTemplate('ocaml', 'ocamlc', 'OCaml Bytecode Compiler',
                \'ocamlc', '-o $(FILE_TITLE)$', '')
augroup END

" }}}

" }}}
