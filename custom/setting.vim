autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java setlocal tags=./tags,tags;$HOME
let g:Tlist_Ctags_Cmd = "/usr/bin/ctags"

"顯示空白字元
set list
"設定字元取代tab及空白
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
