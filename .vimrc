" Vundle https://github.com/VundleVim/Vundle.vim
" Quick Start
" install for this command
"$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
"Launch vim and run :PluginInstall to install all plugins

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'The-NERD-tree'
Plugin 'https://github.com/vim-scripts/JavaImp.vim--Lee.git'
Plugin 'taglist.vim'
"Eclim
"Plugin 'https://github.com/dansomething/vim-eclim.git'
"YouCompleteMe
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'javacomplete'
Plugin 'neocomplcache'
Plugin 'AutoComplPop'
Plugin 'https://github.com/eraserhd/vim-ios/'
Plugin 'https://github.com/keith/swift.vim.git'
Plugin 'cocoa.vim'
Plugin 'clang-complete'
Plugin 'fugitive.vim'
Plugin 'snipMate'
let g:snippets_dir = $HOME."/.vim/snipMate/snippets"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

set hlsearch            "高亮度反白
set backspace=2         "可隨時用倒退鍵刪除

"智能對齊
set smartindent
"自動對齊，使用上一行的對齊方式
set autoindent

"設置自動縮進
set ai

set sm

"可顯示最後一行的狀態
set ruler
set showmode            "左下角那一行的狀態

"顯示行號
set nu

"底色色調
set bg=dark

"語法檢驗，顏色顯示
syntax on

"set nocompatible

nmap <leader>e :NERDTreeToggle<CR>

"taglist setting
nmap <leader>t :TlistToggle<CR>
nmap <leader>s :TlistSessionSave tag.list.session<CR>
nmap <leader>l :TlistSessionLoad tag.list.session<CR>
nmap <leader>u :TlistUpdate<CR>
nmap <leader>a :!ctags -R -h ".h .c .hpp .cpp .java"<CR>

nnoremap <leader>ff  :FufFile<CR>
nnoremap <leader>fb  :FufBuffer<CR>
nnoremap <leader>fl  :FufLine<CR>

"Line Move
vmap J <Esc>:call MoveLineDown(SelectedFirstLine(), SelectedLastLine())<CR>
vmap K <Esc>:call MoveLineUp(SelectedFirstLine(), SelectedLastLine())<CR>

"關聯搜尋
map <F3> :call GrepAuto(expand("<cword>"))<CR>
map <F4> :cn <CR>
map <F2> :cp <CR>

"Java Auto Import
noremap <F5> :JI<CR>
noremap <F6> :call UpdateJavaImport()<CR>

"Gradle Commands
map <F7> :!gradle build -i<CR>
map <F8> :!gradle test -i<CR>
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
"map <F12> :call GitStatus()<CR>:call GitCommit()<CR>
nmap <leader>gd :Gdiff<CR>

"TODO Java move class function

map <C-N> :tabnew 
map <C-L> :tabnext <CR>
map <C-H> :tabprevious <CR>
map <C-W><C-W> :tabclose <CR>
"map <C-J> <C-F> <CR>
"map <C-K> <C-B> <CR>
nmap <C-J> <C-D> <CR>
nmap <C-K> <C-U> <CR>
map zz :quit <CR>
