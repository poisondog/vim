
function SearchSelected() range
"	let first = SelectedFirstLine()
"	let last = SelectedLastLine()

	if a:firstline == a:lastline
		let selected = GetSelection()
		call SearchWordWithEscape(selected)
	else
		call SearchLines();
	endif
	echom "SearchSelected"
endfunction

function Show() range
	let column_num      = virtcol('.')
	let target_pattern  = '\%' . column_num . 'v.'
	let target_line_num = search(target_pattern . '*\S', 'bnW')

	echom column_num
	echom target_pattern
	echom target_line_num

	if !target_line_num
		return ""
	else
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
	echom "selected: " . a:selected
	let temp = EscapeVim(ReplaceSpaceBefore(a:selected))
	call Search(temp)
endfunction

function Search(input)
	let @/ = a:input
	execute "normal /" . a:input . "\<CR>"
endfunction
