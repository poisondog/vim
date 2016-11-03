
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
"		let result = join([result, EscapeVim(ReplaceSpaceBefore(line))], '\_s*')
		let i=i+1
	endwhile
	call Search(result)
endfunction

function ReplaceSpaceBefore(input)
	return substitute(a:input, "^\\s*", "","")
endfunction

function SearchWordWithEscape(selected)
	let temp = substitute(EscapeVim(a:selected), "^\\s*", "","")
	call Search(temp)
endfunction

function Search(input)
	let @/ = a:input
	execute "normal /" . a:input . "\<CR>"
endfunction
