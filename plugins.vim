"Vundle plugin file.  Divided into many ambiguous categoris
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Package management
Bundle 'vundle'

"Text/buffer/file movements & actions ----------------------------------- {{{
"Jumping long distances - ;w/e/b - also mapped to s/S
Bundle 'Lokaltog/vim-easymotion'

"Essentially a tab view for buffers (not the same as the built in tabs)
"Bundle 'fholgado/minibufexpl.vim'
"Allow jumping to to buffers easily - ,lj
Bundle 'sjbach/lusty'
"File explorer   - ,n
Bundle 'scrooloose/nerdtree'
"Like command-T but uses only vimscript
Bundle 'kien/ctrlp.vim'
let g:ctrlp_use_caching = 1
"Keep caches between sessions - f5 to refresh
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
"Clipboard manager
Bundle 'YankRing.vim'
"
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
" }}}

"Code utils (debug/compile/checker/comment/search/tags)------------------------{{{
"Build a single file. Very easy to use without make. Awesome plugin! - f9, f10
Bundle 'xuhdev/SingleCompile'

"Automatic syntax/code checker - checks on write
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1
"Bundle 'xieyu/pyclewn'

"Ack integration   -  ,a
Bundle 'mileszs/ack.vim'

",c* comments stuff in/out   ,c...
Bundle 'scrooloose/nerdcommenter'

"Aligning code
Bundle 'godlygeek/tabular'

"Tags - f11
Bundle 'majutsushi/tagbar'

"Check to make this is working properly and not updating too often
Bundle 'xolox/vim-easytags'
let g:easytags_file = "~/.vim/tags/easyTags"
let g:easytags_dynamic_files = 1
let g:easytags_updatetime_autodisable=1

"}}}

" Completion ---------------------------------------------{{{
" Autocompletion - requires manual compilation
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"""" Cpp completion
"""Bundle 'Rip-Rip/clang_complete'
"""
"""" Python completion
"""Bundle 'davidhalter/jedi-vim'
"""let g:jedi#related_names_command = "<leader>jn"
"""let g:jedi#rename_command = "<leader>jr"
"""let g:jedi#get_definition_command = "<leader>jd"
"""let g:jedi#goto_command = "<leader>jg"
"""
""""Completion from other words in buffer - trigger autocompletion
"""Bundle 'ervandew/supertab'
"""let g:SuperTabDefaultCompletionType='context'

"Like snipmate but better
"Bundle 'SirVer/ultisnips'
" }}}

" Git ---------------------------------------------{{{
"Git integration
Bundle 'tpope/vim-fugitive'
" Extends fugitive
Bundle 'int3/vim-extradite'
"Show git changes
Bundle 'airblade/vim-gitgutter'
" }}}

" Appearance --------------------------------------{{{
"Color matching parens various colors
"Limited usability, may get rid of  - ,R
Bundle 'kien/rainbow_parentheses.vim'
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

"Interface to emacs org-mode - .org
Bundle 'hsitz/VimOrganizer'

"Simple wiki systems - Configured for markdown
Bundle 'vimwiki'

" }}}

" Misc ---------------------------------------------{{{

",d will pull up all lines with TODO
Bundle 'TaskList.vim'
"Plugin to create links
Bundle 'utl.vim'
",<tab> opens scratch buffer
Bundle 'scratch.vim'
" }}} 
" }}}
