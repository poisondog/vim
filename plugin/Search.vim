
function SearchSelected()
	let selected = GetSelection()
	call SearchWordWithEscape(selected)
endfunction

function SearchLines()
	let first = SelectedFirstLine()
	let last = SelectedLastLine()
	let result = ""
	let i=first
	while i<=last
		let line=getline(i)
"		echom line
"		echom ReplaceSpaceBefore(line)
"		echom EscapeVim(ReplaceSpaceBefore(line))
"		result .= EscapeVim(ReplaceSpaceBefore(line))
"		result .=  "\_s*"
		result = join([result, EscapeVim(ReplaceSpaceBefore(line))], "\n")
		let i=i+1
	endwhile
	let @/ = result
	execute "normal /" . result . "\<CR>"
endfunction

function ReplaceSpaceBefore(input)
	return substitute(a:input, "^\\s*", "","")
endfunction

function SearchWordWithEscape(selected)
	let temp = substitute(EscapeVim(a:selected), "^\\s*", "","")
	let @/ = temp
"	call search(temp)
"	echom substitute(temp, "^\\s*", "","")
	execute "normal /" . temp . "\<CR>"
endfunction
