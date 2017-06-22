
nmap <leader>e :NERDTreeToggle<CR>
"taglist setting
nmap <leader>t :TlistToggle<CR>
"nmap <leader>s :TlistSessionSave tag.list.session<CR>
nmap <leader>l :TlistSessionLoad tag.list.session<CR>
nmap <leader>u :TlistUpdate<CR>
nmap <leader>a :!ctags -R -h ".h .c .hpp .cpp .m .java"<CR>
nmap z] <C-]>
nmap z[ :pop<CR>
nmap zv :vs<CR><C-]>
nmap z; :tab split<CR><C-]>
nmap zl <C-W>l
nmap zh <C-W>h
nmap zu :call CreateJavaTestFile()<CR>
nmap zo :call CreateJavaFile()<CR>
nnoremap <leader>ff  :FufFile<CR>
nnoremap <leader>fb  :FufBuffer<CR>
nnoremap <leader>fl  :FufLine<CR>
"Delete file
nnoremap <leader>fd :call delete(GetCurrentFilePath())<CR>
"Line Move
set timeout ttimeoutlen=50
execute "set <M-J>=\ej"
execute "set <M-K>=\ek"
vmap <M-J> <Esc>:call MoveLineDown(SelectedFirstLine(), SelectedLastLine())<CR>
vmap <M-K> <Esc>:call MoveLineUp(SelectedFirstLine(), SelectedLastLine())<CR>
"關聯搜尋
map <F3> :call GrepAuto(expand("<cword>"))<CR>
map <F4> :cn <CR>
map <F2> :cp <CR>
"Java Auto Import
noremap <F5> :JI<CR>
noremap <F6> :call UpdateJavaImport()<CR>
"Gradle Commands
"map <F7> :!./gradlew build -i --daemon --parallel --offline<CR>
map <F7> :!./gradlew build -i --daemon --parallel<CR>
map <F8> :!./gradlew test -i<CR>
"map <F8> :call GradleTestPackage()<CR>
map <F9> :FindFile <cword>.*<CR>
map <F12> :call GrepTodo()<CR>
nmap <leader>grr :!gradle --refresh-dependencies<CR>
nmap <leader>rr :so %<CR>
"Replace Mapping
"vnoremap // y/<C-R>"<CR>
vnoremap n :call SearchSelected()<CR>
"vnoremap <leader>f :call SearchSelected()<CR>
vnoremap <leader>r :call ReplaceSelected()<CR>
nmap <leader>r :call ReplaceVariable()<CR>
nmap <leader>cr :call ReplaceVariableCurrentEnd()<CR>
nmap <leader>R :call ReplaceStringOn()<CR>
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
" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>
