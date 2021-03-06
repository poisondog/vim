"Search Context
nnoremap <leader>ss :call GrepSearch()<CR>
nnoremap <leader>st :call GrepTodo()<CR>
nnoremap <leader>sc :call GrepAuto(expand("<cword>"))<CR>
map <F3> :call GrepAuto(expand("<cword>"))<CR>
map <F4> :cn <CR>
map <F2> :cp <CR>
map <F12> :call GrepTodo()<CR>
vnoremap n :call SearchSelected()<CR>

"NERDTree
nmap <leader>e :NERDTreeToggle<CR>
"Navigation
nmap <C-J> <C-D> <CR>
nmap <C-K> <C-U> <CR>
"map <C-J> <C-F> <CR>
"map <C-K> <C-B> <CR>
nnoremap <Space> zz
map <C-N> :tabnew 
map <C-L> :tabnext <CR>
map <C-H> :tabprevious <CR>
"map <C-W><C-W> :tabclose <CR>
nnoremap <BS> :quit <CR>
nnoremap <leader>w :w<CR>
nnoremap <CR> :w<CR>
"keep search not jump to next
nnoremap * *``

"create ctags
nmap <leader>a :!ctags -R -h ".h .c .hpp .cpp .m .java"<CR>
"browser source code
nmap zj <C-]>
nmap zk :pop<CR>
nmap z. :vs<CR><C-]>
nmap z, :sp<CR><C-]>
nmap z; :tab split<CR><C-]>
"nmap zl <C-W>l
"nmap zh <C-W>h
nnoremap zl zr
nnoremap zh zm
nmap zu :call CreateJavaTestFile()<CR>
nmap zo :call CreateJavaFile()<CR>

"Delete file
nnoremap <leader>fddd :call delete(GetCurrentFilePath())<CR>

"Java Auto Import
nnoremap <F5> :JI<CR>
nnoremap <F6> :call UpdateJavaImport()<CR>

"Simple Comment
vnoremap <leader><leader> <Esc>:call CommentSwitch(SelectedFirstLine(), SelectedLastLine())<CR>
vnoremap <leader>c <Esc>:call Comment(SelectedFirstLine(), SelectedLastLine())<CR>
vnoremap <leader>x <Esc>:call UnComment(SelectedFirstLine(), SelectedLastLine())<CR>

"Git Commands
"map <F9> :!git status<CR>
"map <F10> :!git diff<CR>
"nmap <F9> :Gstatus<CR>:call GitCommit()<CR>
"nmap <F10> :call GitPush()<CR>
nmap <leader>ga :Git add 
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :call GitStatus()<CR>
nmap <leader>gc :call GitCommit()<CR>
nmap <leader>gh :call GitPush()<CR>
nmap <leader>gl :call GitPull()<CR>
nmap <leader>gu :call GitUntrack(GetCurrentFilePath())<CR>

"refresh for vim or gradle dependencies
nmap <leader>grr :!gradle --refresh-dependencies<CR>
nmap <leader>rr :so $MYVIMRC<CR>

" Copy and Paste
" map Visual Block to <leader>v
nnoremap <leader>v <C-v>
" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>
nmap <F10> :call PasteToggle()<CR>

"Replace Mapping
"vnoremap // y/<C-R>"<CR>
"vnoremap <leader>f :call SearchSelected()<CR>
vnoremap <leader>r :call ReplaceSelected()<CR>
vnoremap <leader>yr :call ReplaceSelectedWithoutConfirm()<CR>
nmap <leader>r :call ReplaceVariable()<CR>
nmap <leader>cr :call ReplaceVariableCurrentEnd()<CR>
nmap <leader>yr :call ReplaceVariableWithoutConfirm()<CR>
nmap <leader>R :call ReplaceStringOn()<CR>

"Faster type
inoremap {}<Tab> {<CR>}<Esc>ko
inoremap ""<Tab> ""<Esc>i
inoremap ()<Tab> ()<Esc>i
inoremap ();<Tab> ();<Esc>hi
inoremap ''<Tab> ''<Esc>i
inoremap []<Tab> []<Esc>i

"Folding
nnoremap <leader>z za

"Build Tool Switch
call ApplyJava()
"Build Commands
"nnoremap <F7> :call BuildAllJava()<CR>
"nnoremap <F8> :call TestAllJava()<CR>
let builderIndex = 0
map <F9> :let builderIndex = builderIndex + 1<CR>:call SwitchBuilder(builderIndex)<CR>
nnoremap <leader><F8> :echo 'Current time is ' . strftime('%c')<CR>
"autocmd FileType cpp map <F7> :call BuildCMake()<CR>
"autocmd FileType cpp map <F8> :call TestX64CC()<CR>
"map <F8> :!./gradlew test -i<CR>
"map <F8> :call GradleTestPackage()<CR>

"Line Move
set timeout ttimeoutlen=50
execute "set <M-J>=\ej"
execute "set <M-K>=\ek"
"vmap <M-J> <Esc>:call MoveLineDown(SelectedFirstLine(), SelectedLastLine())<CR>
"vmap <M-K> <Esc>:call MoveLineUp(SelectedFirstLine(), SelectedLastLine())<CR>
"nmap <M-K> :call SelectCurrentWord()<CR>
nnoremap <M-J> <Esc>:cnext <CR>
nnoremap <M-K> <Esc>:cprev<CR>

"====================================================================

"taglist setting
nmap <leader>tt :TlistToggle<CR>
nmap <leader>tss :TlistSessionSave tag.list.session<CR>
nmap <leader>tsl :TlistSessionLoad tag.list.session<CR>
nmap <leader>tu :TlistUpdate<CR>

"Buffer
nnoremap <leader>ff  :FufFile<CR>
nnoremap <leader>fb  :FufBuffer<CR>
nnoremap <leader>fl  :FufLine<CR>

"Java Auto Complete 2
"nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)

"map <F9> :FindFile <cword>.*<CR>

"TODO Java move class function
