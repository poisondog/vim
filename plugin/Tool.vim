
function GetCurrentWord()
	return expand("<cword>")
endfunction

function StringReplace(origin, oldChar, newChar)
	return substitute(a:origin, a:oldChar, a:newChar, "")
endfunction

function GetCurrentFilePath()
	return expand('%')
endfunction

function GetParentPath()
	return expand('%:p:h') . '/'
endfunction

function GetCurrentFileExtension()
	return expand('%:e')
endfunction