
function SearchSelected()
	let selected = GetSelection()
	call SearchWordWithEscape(selected)
endfunction

function SearchLines()
	let first = SelectedFirstLine()
	let last = SelectedLastLine()
	let result = '\_^'
	let i = first
	while i <= last
		let line = getline(i)
"		echom line
"		echom ReplaceSpaceBefore(line)
"		echom EscapeVim(ReplaceSpaceBefore(line))
		let result .=  '\_s*'
		let result .= EscapeVim(ReplaceSpaceBefore(line))
"		result = join([result, EscapeVim(ReplaceSpaceBefore(line))], '\_s*')
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
