
function SearchSelected()
	let selected = GetSelection()
	call SearchWordWithEscape(selected)
endfunction

function SearchWordWithEscape(selected)
	let temp = EscapeVim(a:selected)
	execute "/" . temp
endfunction
