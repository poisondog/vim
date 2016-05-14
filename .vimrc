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

" Snippets
Plugin 'snipMate'
let g:snippets_dir = $HOME."/.vim/snipMate/snippets"

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

nmap <leader>e :NERDTreeToggle<CR>
"taglist setting
nmap <leader>t :TlistToggle<CR>
nmap <leader>s :TlistSessionSave tag.list.session<CR>
nmap <leader>l :TlistSessionLoad tag.list.session<CR>
nmap <leader>u :TlistUpdate<CR>
nmap <leader>a :!ctags -R -h ".h .c .hpp .cpp .m .java"<CR>
nmap z] <C-]>
nmap z[ :pop<CR>
nmap zv :vs<CR><C-]>
nmap zl <C-W>l
nmap zh <C-W>l
nnoremap <leader>ff  :FufFile<CR>
nnoremap <leader>fb  :FufBuffer<CR>
nnoremap <leader>fl  :FufLine<CR>
"Line Move
vmap <C-J> <Esc>:call MoveLineDown(SelectedFirstLine(), SelectedLastLine())<CR>
vmap <C-K> <Esc>:call MoveLineUp(SelectedFirstLine(), SelectedLastLine())<CR>
"關聯搜尋
map <F3> :call GrepAuto(expand("<cword>"))<CR>
map <F4> :cn <CR>
map <F2> :cp <CR>
"Java Auto Import
noremap <F5> :JI<CR>
noremap <F6> :call UpdateJavaImport()<CR>
"Gradle Commands
map <F7> :!./gradlew build -i<CR>
map <F8> :!./gradlew test -i<CR>
nmap <leader>grr :!gradle --refresh-dependencies<CR>
"Replace Mapping
nmap <leader>r :call ReplaceVariable()<CR>
nmap <leader>R :call ReplaceStringOnJava()<CR>
"Simple Comment
map <leader><leader> <Esc>:call CommentSwitch(SelectedFirstLine(), SelectedLastLine())<CR>
map <leader>c <Esc>:call Comment(SelectedFirstLine(), SelectedLastLine())<CR>
map <leader>x <Esc>:call UnComment(SelectedFirstLine(), SelectedLastLine())<CR>
"Git Commands
"map <F9> :!git status<CR>
"map <F10> :!git diff<CR>
"nmap <F9> :Gstatus<CR>:call GitCommit()<CR>
"nmap <F10> :call GitPush()<CR>
nmap <leader>ga :Git add 
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :call GitCommit()<CR>
nmap <leader>gh :call GitPush()<CR>
"TODO Java move class function
map <C-N> :tabnew 
map <C-L> :tabnext <CR>
map <C-H> :tabprevious <CR>
nmap <BS> :quit <CR>
"map <C-W><C-W> :tabclose <CR>
"map <C-J> <C-F> <CR>
"map <C-K> <C-B> <CR>
nmap <C-J> <C-D> <CR>
nmap <C-K> <C-U> <CR>
"map zz :quit <CR>
nmap <Space> zz
