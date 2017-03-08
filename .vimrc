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
Plugin 'The-NERD-tree'

" Syntax checking hacks for vim
"Plugin 'scrooloose/syntastic'

" Java Import Tool
Plugin 'https://github.com/vim-scripts/JavaImp.vim--Lee.git'
Plugin 'taglist.vim'

" No more :set paste!
Plugin 'https://github.com/ConradIrwin/vim-bracketed-paste.git'

" shellasync.vim plugin for asynchronously executing shell commands in vim
Plugin 'https://github.com/troydm/shellasync.vim.git'

" Gradle Syntax Highlighting
Plugin 'vim-gradle'

" Auto Complete
"Plugin 'Valloric/YouCompleteMe.git'
Plugin 'javacomplete'
Plugin 'neocomplcache'
Plugin 'AutoComplPop'

" iOS Tool
Plugin 'eraserhd/vim-ios'
Plugin 'https://github.com/keith/swift.vim.git'
Plugin 'msanders/cocoa.vim'
Plugin 'clang-complete'

" Git Plugin Tool
Plugin 'fugitive.vim'

" vim-python-pep8-indent
"Plugin 'Vimjas/vim-python-pep8-indent'

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

"execute pathogen#infect()
" filetype on
" filetype plugin on
" filetype plugin indent on
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java setlocal tags=./tags,tags;$HOME
let g:Tlist_Ctags_Cmd = "/usr/bin/ctags"

set list
set listchars=tab:→-,trail:-
"高亮度反白
set hlsearch
"可隨時用倒退鍵刪除
set backspace=2
"智能對齊
set smartindent
"自動對齊，使用上一行的對齊方式
set autoindent
"設置自動縮進
set ai
set sm
"可顯示最後一行的狀態
set ruler
"左下角那一行的狀態
set showmode
"顯示行號
set nu
"底色色調
set bg=dark
"語法檢驗，顏色顯示
syntax on
"Dictionary Completion
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

