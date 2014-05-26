filetype on
"filetype plugin on
filetype plugin indent on
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

set nocompatible

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

function UpdateJavaImport()
	let needToRemove = []
	let i = 0
	let endLine = line("$")
	while i <= endLine
		let line = getline(i)
		if stridx(line, "import ") == 0
			let names = split(line, '\.')
			let result = strpart(names[-1], 0, strlen(names[-1])-1)
			let inUsed = 0
			let j = 0
			while j <= endLine
				if search('\W\?'.result.'\W\?') != i
					let inUsed = 1
				endif
				let j = j + 1
			endwhile
			if inUsed == 0
				echom "Never used : " . result
				call add(needToRemove, i)
			endif
		endif
		let i = i + 1
	endwhile
	call reverse(needToRemove)
	for item in needToRemove
		execute item . "d"
	endfor
	:JIS
endfunction
