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

" No more :set paste!
Plugin 'https://github.com/ConradIrwin/vim-bracketed-paste.git'

" Bottom status line
Plugin 'vim-airline/vim-airline'

" CtrlP for search file
Plugin 'ctrlp.vim'

" Gradle Syntax Highlighting
Plugin 'vim-gradle'

" Git Plugin Tool
Plugin 'fugitive.vim'

" snipMate
Plugin 'snipMate'
let g:snippets_dir = $HOME."/.vim/snippets"

" Json syntax highlighting
Plugin 'elzr/vim-json'

" Auto pop complete menu
Plugin 'AutoComplPop'

" Surround Tools
Plugin 'tpope/vim-surround'

" Swift
Plugin 'keith/swift.vim'

" Java Auto Import
Plugin 'https://github.com/vim-scripts/JavaImp.vim--Lee.git'

" Java Auto Complete
Plugin 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_EnableDefaultMappings = 0
let g:JavaComplete_LibsPath = $HOME."/usr/android-sdk-linux/platforms/android-28/android.jar"
let $CLASSPATH= $HOME."/usr/android-sdk-linux/platforms/android-28/android.jar"

" Vim Color
" :XtermColorTable call color method
Plugin 'guns/xterm-color-table.vim'

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
runtime custom/setting.vim
runtime custom/tabColor.vim
runtime custom/plugin.vim
