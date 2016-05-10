
let g:annotationSymbol = "#"
autocmd FileType java let g:annotationSymbol = "//"
autocmd FileType vim let g:annotationSymbol = "\""
autocmd FileType objc let g:annotationSymbol = "//"
autocmd FileType objcpp let g:annotationSymbol = "//"
autocmd FileType javascript let g:annotationSymbol = "//"
autocmd FileType gradle let g:annotationSymbol = "//"
autocmd FileType cpp let g:annotationSymbol = "//"
autocmd FileType cmake let g:annotationSymbol = "#"

"TODO add xml comment

function SelectedFirstLine()
	execute "'<"
	return line(".")
endfunction

function SelectedLastLine()
	execute "'>"
	return line(".")
endfunction

function CommentSwitch(fl, ll)
	let i=a:fl
	while i<=a:ll
		let cl=getline(i)
		let commentLine = matchstr(cl, "^\\s*" . g:annotationSymbol . ".*")
		if commentLine != ""
			call RemoveComment(i)
		else
			call AddComment(i)
		endif
		let i=i+1
	endwhile
endfunction

""Function for commenting a block of Visually selected text
function Comment(fl, ll)
	let i=a:fl
	while i<=a:ll
		call AddComment(i)
		let i=i+1
	endwhile
endfunction

"Function for Un-Commenting a block of
function UnComment(fl, ll)
	let i=a:fl
	while i<=a:ll
		call RemoveComment(i)
		let i=i+1
	endwhile
endfunction

function AddComment(line)
	let cl=getline(a:line)
	let cl2=g:annotationSymbol.cl
	call setline(a:line, cl2)
endfunction

function RemoveComment(line)
	let cl = getline(a:line)
	let cl2 = substitute(cl, g:annotationSymbol, "", "")
	call setline(a:line, cl2)
endfunction
