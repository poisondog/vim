
function SearchSelected()
	let selected = GetSelection()
	call SearchWordWithEscape(selected)
endfunction

"function SearchLine()
"	let line = getline(line("."))
"	echom line
"	call SearchWordWithEscape(line)
"endfunction

function SearchWordWithEscape(selected)
	let temp = EscapeVim(a:selected)
	call search(temp)
	echom substitute(temp, "^\\s*", "","")
"	execute "/" . temp
endfunction
