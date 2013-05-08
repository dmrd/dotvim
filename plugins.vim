set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Package management
Bundle 'vundle'


" Github repos ------------------------------------{{{

"w,e,b operate on camelCaseText
Bundle 'bkad/CamelCaseMotion'
"Break out region into its own buffer. Changes transfer back - f3
Bundle 'chrisbra/NrrwRgn'
"Completion from other words in buffer
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType='context'

"Essentially a tab view for buffers (not the same as the built in tabs)
Bundle 'fholgado/minibufexpl.vim'
"Aligning code
Bundle 'godlygeek/tabular'
"Interface to emacs org-mode
Bundle 'hsitz/VimOrganizer'
"Latex plugin
Bundle 'jcf/vim-latex'
"Bundle 'AutomaticLaTexPlugin'
"Prevents latex plugin from rebinding C-j
imap <m-J> <Plug>IMAP_JumpForward
nmap <m-J> <Plug>IMAP_JumpForward
"Vim for arduino code
"Bundle 'kingbin/vim-arduino'

"Like command-T but uses only vimscript
Bundle 'kien/ctrlp.vim'
let g:ctrlp_use_caching = 1
"Keep caches between sessions - f5 to refresh
let g:ctrlp_clear_cache_on_exit = 0

"Color matching parens various colors
"Limited usability, may get rid of  - ,R
Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'kikijump/tslime.vim'
"Bundle 'klen/python-mode'
"Jumping long distances - ,,w/e/b
Bundle 'Lokaltog/vim-easymotion'
"Cool status bar
Bundle 'Lokaltog/vim-powerline'
"Haskell stuff
"Bundle 'lukerandall/haskellmode-vim'
"Tags - f11
Bundle 'majutsushi/tagbar'
"Ack integration   -  ,a
Bundle 'mileszs/ack.vim'
"Like snipmate but better
Bundle 'SirVer/ultisnips'
",c* comments stuff in/out   ,c...
Bundle 'scrooloose/nerdcommenter'
"File explorer   - ,n
Bundle 'scrooloose/nerdtree'
"Automatic syntax/code checker - checks on write
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1

"Allow jumping to to buffers easily - ,lj - ,lj
Bundle 'sjbach/lusty'
"Undo tree visualizer  - f4
Bundle 'sjl/gundo.vim'
" Extends fugitive
Bundle 'int3/vim-extradite'
"Git integration
Bundle 'tpope/vim-fugitive'
"Show git changes
Bundle 'airblade/vim-gitgutter'
"Lets . repeat more types of commands
Bundle 'tpope/vim-repeat'
"Increment/decrement dates - again, limited use cases
"Bundle 'tpope/vim-speeddating'
"Operate on surrounding symbols (like change parens to brackets)
Bundle 'tpope/vim-surround'
"Random functions. [e ]e switch lines (stuff like that)
Bundle 'tpope/vim-unimpaired'
"Check to make this is working properly and not updating too often
Bundle 'xolox/vim-easytags'
let g:easytags_file = "~/.vim/tags/easyTags"
let g:easytags_dynamic_files = 1
"let g:easytags_updatetime_autodisable=1
"Build a single file. Very easy to use without make. Awesome plugin! - f9, f10
Bundle 'xuhdev/SingleCompile'
"Color scheme
Bundle 'noahfrederick/Hemisu'
" }}}

" Vim-scripts------------------------------------ {{{
"Makes Vim work better with large files
"Bundle 'LargeFile'
" Cpp completion
Bundle 'Rip-Rip/clang_complete'
" Python completion
Bundle 'davidhalter/jedi-vim'

let g:jedi#related_names_command = "<leader>jn"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#get_definition_command = "<leader>jd"
let g:jedi#goto_command = "<leader>jg"

",d will pull up all lines with TODO
Bundle 'TaskList.vim'
"Plugin to create links
Bundle 'utl.vim'
"Clipboard manager
Bundle 'YankRing.vim'
"<c-w>o to toggle "zooming into" a window
Bundle 'ZoomWin'
",<tab> opens scratch buffer
Bundle 'scratch.vim'
"Calendar in vim
"Bundle 'calendar.vim'
"Java completion
"Bundle 'javacomplete'
Bundle 'vimwiki'
"Kill buffers without closing splits/windows (capitalize normal commands)
Bundle 'bufkill.vim'
" }}} 
" }}}
