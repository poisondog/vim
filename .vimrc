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
Plugin 'snipMate'
Plugin 'taglist.vim'
Plugin 'javacomplete'
Plugin 'neocomplcache'
Plugin 'AutoComplPop'
Plugin 'https://github.com/eraserhd/vim-ios/'
Plugin 'cocoa.vim'
Plugin 'clang-complete'

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
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java setlocal tags=./tags

set list
set listchars=tab:→-,trail:-

"這個檔案的雙引號 (") 是註解
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
nmap <leader>t :TlistToggle<CR>
nmap <leader>s :TlistSessionSave tag.list.session<CR>
nmap <leader>l :TlistSessionLoad tag.list.session<CR>
nmap <leader>u :TlistUpdate<CR>
nmap <leader>a :TlistAddFilesRecursive 

nnoremap <leader>ff  :FufFile<CR>
nnoremap <leader>fb  :FufBuffer<CR>
nnoremap <leader>fl  :FufLine<CR>

"關聯搜尋
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **/*.java" <Bar> cw<CR>
map <F4> :cn <CR>
map <F2> :cp <CR>

map <C-N> :tabnew 
map <C-L> :tabnext <CR>
map <C-H> :tabprevious <CR>
"map <C-J> <C-F> <CR>
"map <C-K> <C-B> <CR>
map <C-J> <C-D> <CR>
map <C-K> <C-U> <CR>
map zz :q <CR>

"javacomplete setting
"set omnifunc=javacomplete#Complete 
"set completefunc=javacomplete#CompleteParamsInfo 
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

"VJDE setting
"set cfu=VjdeCompletionFun
"let g:vjde_lib_path="bin:lib/*.jar:libs/*.jar:bin/classes:/usr/share/java/junit4.jar:/home/bean/workspace/android-sdk-linux/platforms/android-10/android.jar"

map <leader>c <Esc>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call Comment(fl, ll)<CR>
map <leader>x <Esc>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call UnComment(fl, ll)<CR>

""Function for commenting a block of Visually selected text
function Comment(fl, ll)
	let i=a:fl
	let comment="//"
	while i<=a:ll
		let cl=getline(i)
		let cl2=comment.cl
		call setline(i, cl2)
		let i=i+1
	endwhile
endfunction

"Function for Un-Commenting a block of
function UnComment(fl, ll)
	let i=a:fl
	let comment="//"
	while i<=a:ll
		let cl=getline(i)
		let cl2=substitute(cl, "//", "", "")
		call setline(i, cl2)
		let i=i+1
	endwhile
endfunction

"Status bar
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

"Java Auto Import
noremap <F5> :JI<CR>
noremap <F6> :call UpdateJavaImport()<CR>
let g:JavaImpPaths = $HOME."/.vim/JavaImp/java,"
			"\$HOME."/workspace/poisondog/poisondog.commons/src/main/java,".
			"\$HOME."/workspace/walton/MySkyBoxCore/src/main/java"
let g:JavaImpDataDir = $HOME."/.vim/JavaImp"
let g:JavaImpSortPkgSep = 0
let g:Tlist_Ctags_Cmd = "/usr/bin/ctags"

function IsImport(line)
	if stridx(a:line, "import ") == 0
		return 1
	endif
	return 0
endfunction

function GetClassSimpleName(line)
	let names = split(a:line, '\.')
	return strpart(names[-1], 0, strlen(names[-1])-1)
endfunction

function GetImports()
	let imports = []
	let i = 0
	let endLine = line("$")
	while i <= endLine
		let line = getline(i)
		if IsImport(line) != 0
			call add(imports, i)
		endif
		let i = i + 1
	endwhile
	return imports
endfunction

function InUsed(classline)
	let class = GetClassSimpleName(getline(a:classline))
	let j = 0
	while j <= line("$")
		if search('\<'.class.'\>') != a:classline
			return 1
		endif
		let j = j + 1
	endwhile
	return 0
endfunction

function UpdateJavaImport()
	let needToRemove = []
	for i in GetImports()
		let result = GetClassSimpleName(getline(i))
		if InUsed(i) == 0
			echom "Never used : " . result
			call add(needToRemove, i)
		endif
	endfor
	call reverse(needToRemove)
	for item in needToRemove
		execute item . "d"
	endfor
	:JIS
endfunction
