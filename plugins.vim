"Vundle plugin file.  Divided into many ambiguous categoris
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Package management
Bundle 'vundle'

"" Unite --------------------------------------------------------------{{{
"Bundle 'Shougo/unite.vim'
"" Unite
"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files buffer file_mru bookmark file_rec/async<CR>
"" }}}



"Text/buffer/file movements & actions ----------------------------------- {{{
"Jumping long distances - ;w/e/b - also mapped to s/S
Bundle 'Lokaltog/vim-easymotion'
Bundle 'goldfeld/vim-seek'
let g:SeekKey = 'f'
let g:SeekBackKey = 'F'

Bundle 'terryma/vim-multiple-cursors'
" Mac specific mapping - equivalent to <C-a>
let g:multi_cursor_next_key='å'

"w/b/e pay attention to word capitalization
"Bundle 'camelcasemotion'
"map w <Plug>CamelCaseMotion_w 
"map b <Plug>CamelCaseMotion_b 
"map e <Plug>CamelCaseMotion_e 
"sunmap w 
"sunmap b 
"sunmap e 

"Show marks in gutter, various good mappings
Bundle 'kshenoy/vim-signature'

"Allow jumping to to buffers easily - ,lj
Bundle 'sjbach/lusty'
"File explorer   - ,n
Bundle 'scrooloose/nerdtree'
"Like command-T but uses only vimscript
Bundle 'kien/ctrlp.vim'
let g:ctrlp_use_caching = 1
""Keep caches between sessions - f5 to refresh
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

"Clipboard manager
Bundle 'YankRing.vim'

"Undo tree visualizer - f4
Bundle 'sjl/gundo.vim'
"
"Operate on surrounding symbols (like change parens to brackets)
Bundle 'tpope/vim-surround'
"Lets . repeat more types of commands
Bundle 'tpope/vim-repeat'
"Random functions. [e ]e switch lines (stuff like that)
Bundle 'tpope/vim-unimpaired'

"Break out region into its own buffer. Changes transfer back - f3
Bundle 'chrisbra/NrrwRgn'
"<c-w>o to toggle "zooming into" a window
Bundle 'ZoomWin'
"Kill buffers without closing splits/windows (capitalize normal commands)
Bundle 'bufkill.vim'

" Save and load sessions
Bundle 'xolox/vim-session'
nmap <leader>ss :SaveSession 
nmap <leader>so :OpenSession 
nmap <leader>sr :RestartVim<CR>
let g:session_autoload=0

" }}}

"Code utils (debug/compile/checker/comment/search/tags)------------------------{{{
"Build a single file. Very easy to use without make. Awesome plugin! - f9, f10
Bundle 'xuhdev/SingleCompile'

"Automatic syntax/code checker - checks on write
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1

"Ack integration   -  ,a
Bundle 'mileszs/ack.vim'

",c* comments stuff in/out   ,c...
Bundle 'scrooloose/nerdcommenter'

"Aligning code
Bundle 'godlygeek/tabular'

"Tags - f11
Bundle 'majutsushi/tagbar'

"Check to make sure this is working properly and not updating too often
"Bundle 'xolox/vim-easytags'
let g:easytags_file = "~/.vim/tags/easyTags"
let g:easytags_dynamic_files = 1
let g:easytags_updatetime_autodisable=1

" Autodetect indent levels
Bundle 'tpope/vim-sleuth'

Bundle 'nathanaelkane/vim-indent-guides'
"}}}

" Completion ---------------------------------------------{{{
" Autocompletion - requires manual compilation
if has("gui_running")
  Bundle 'Valloric/YouCompleteMe'
  let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
  let g:ycm_confirm_extra_conf = 0
  let g:ycm_key_invoke_completion = '<C-w>'
  let g:ycm_key_list_previous_completion=['<Up>']
  " Go to where something is defined locally (imported etc.)
  nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
  " Go to where something is defined/created
  nnoremap <leader>jl :YcmCompleter GoToDeclaration<CR>

  "Like snipmate but better
  "Bundle 'SirVer/ultisnips'
  "let g:UltiSnipsExpandTrigger="<C-J>"


end

" }}}

" VCS ---------------------------------------------{{{
"HG integration
Bundle 'phleet/vim-mercenary'

"Git integration
Bundle 'tpope/vim-fugitive'
" Extends fugitive
Bundle 'int3/vim-extradite'

" VCS gutter
Bundle 'mhinz/vim-signify'
" }}}

" Appearance --------------------------------------{{{
"Cool status bar
Bundle 'Lokaltog/vim-powerline'

Bundle 'noahfrederick/Hemisu'
" }}}

" Filetype specific -------------------------------------{{{
"Latex plugin
Bundle 'jcf/vim-latex'
"Bundle 'AutomaticLaTexPlugin'
"Prevents latex plugin from rebinding C-j
imap <m-J> <Plug>IMAP_JumpForward
nmap <m-J> <Plug>IMAP_JumpForward

" Interface to emacs org-mode - .org
Bundle 'hsitz/VimOrganizer'

" Simple wiki systems - Configured for markdown
Bundle 'vimwiki'

" Preview markdown files in browser
Bundle 'suan/vim-instant-markdown'
" .md settings
Bundle 'tpope/vim-markdown'

Bundle 'ap/vim-css-color'

" Python {{{
" Python style checking integrated into syntastic
let g:syntastic_python_checkers = ['pyflakes']

" Better python indentation style
Bundle 'indentpython.vim'

Bundle 'johndgiese/vipy'
" }}}


" Web {{{
Bundle 'kchmck/vim-coffee-script'

Bundle 'tpope/vim-haml'
" }}}

" }}}

" Misc ---------------------------------------------{{{

",d will pull up all lines with TODO
Bundle 'TaskList.vim'
"Plugin to create links
Bundle 'utl.vim'
",<tab> opens scratch buffer
Bundle 'scratch.vim'

" Xolox util functions
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'
" }}} 
" }}}
