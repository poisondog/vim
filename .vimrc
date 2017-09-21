" Vundle https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ============ My Plugin ============
" Tree File Browser
Plugin 'The-NERD-tree'
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Syntax checking hacks for vim
"Plugin 'scrooloose/syntastic'

" Java Import Tool
Plugin 'https://github.com/vim-scripts/JavaImp.vim--Lee.git'
Plugin 'taglist.vim'

" Java Auto Complete
Plugin 'javacomplete'
autocmd FileType java set omnifunc=javacomplete#Complete

" No more :set paste!
Plugin 'https://github.com/ConradIrwin/vim-bracketed-paste.git'

" shellasync.vim plugin for asynchronously executing shell commands in vim
Plugin 'https://github.com/troydm/shellasync.vim.git'

" Gradle Syntax Highlighting
Plugin 'vim-gradle'

" Auto Complete
"Plugin 'Valloric/YouCompleteMe.git'
" Auto Complete for path
Plugin 'neocomplcache'
Plugin 'AutoComplPop'

" Python pep8 indent
"Plugin 'Vimjas/vim-python-pep8-indent'
"Plugin 'vim-scripts/indentpython.vim'
" Python Auto Complete
"Plugin 'davidhalter/jedi-vim'

" iOS Tool
Plugin 'eraserhd/vim-ios'
Plugin 'https://github.com/keith/swift.vim.git'
Plugin 'msanders/cocoa.vim'
Plugin 'clang-complete'

" Git Plugin Tool
Plugin 'fugitive.vim'

" Generate setter and getter
Plugin 'https://github.com/Dinduks/vim-java-get-set.git'

" snipMate
Plugin 'snipMate'
let g:snippets_dir = $HOME."/.vim/snippets"

" UltiSnips
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=$HOME."/.vim/UltiSnips"

Plugin 'tpope/vim-surround'
Plugin 'elzr/vim-json'
" Bottom Status Bar
"Plugin 'vim-airline/vim-airline'

" Color Schemes
"Plugin 'tomasr/molokai'
"Plugin 'flazz/vim-colorschemes'
" ===================================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ============ End Vundle Setting ============
set runtimepath^=~/.vim/bundle/ctrlp.vim
runtime custom/setting.vim
runtime custom/tabColor.vim
