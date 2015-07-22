
autocmd FileType java let g:annotationSymbol = "//"
autocmd FileType vim let g:annotationSymbol = "\""
autocmd FileType objc let g:annotationSymbol = "//"
autocmd FileType javascript let g:annotationSymbol = "//"
autocmd FileType sh let g:annotationSymbol = "#"

map <leader>c <Esc>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call Comment(fl, ll)<CR>
map <leader>x <Esc>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call UnComment(fl, ll)<CR>

"TODO create function CommentSwitch

""Function for commenting a block of Visually selected text
function Comment(fl, ll)
	let i=a:fl
	while i<=a:ll
		let cl=getline(i)
		let cl2=g:annotationSymbol.cl
		call setline(i, cl2)
		let i=i+1
	endwhile
endfunction

"Function for Un-Commenting a block of
function UnComment(fl, ll)
	let i=a:fl
	while i<=a:ll
		let cl=getline(i)
		let cl2=substitute(cl, g:annotationSymbol, "", "")
		call setline(i, cl2)
		let i=i+1
	endwhile
endfunction
