autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal noexpandtab
autocmd FileType python setlocal tabstop=8
autocmd FileType python setlocal shiftwidth=8
autocmd FileType python setlocal softtabstop=8
autocmd FileType python setlocal foldmethod=indent
autocmd FileType gradle setlocal indentexpr=GetGroovyIndent()
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
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
"自動存檔
set autowriteall
"設置自動縮進
set ai
set sm
"可顯示最後一行的狀態
set ruler
"左下角那一行的狀態
set showmode
"顯示行號
set number
"相對行號
set relativenumber
"底色色調
set bg=dark
"語法檢驗，顏色顯示
syntax on
"不分大小寫搜尋
set smartcase
"Dictionary Completion
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" yank to clipboard with Mac
"set clipboard=unnamed
" yank to clipboard with Linux
set clipboard=unnamedplus


"colorscheme default
"colorscheme torte
"colorscheme koehler
"colorscheme darkblue
"colorscheme desert
"colorscheme shine
"colorscheme ron
colorscheme solarized

"set showmatch
"set smarttab

"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
"set encoding=utf-8
