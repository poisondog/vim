
function GetCurrentWord()
	return expand("<cword>")
endfunction

function StringReplace(origin, oldChar, newChar)
	return substitute(a:origin, a:oldChar, a:newChar, "")
endfunction

function GetCurrentFilePath()
	return expand('%')
endfunction

function GetFullCurrentFilePath()
	return expand('%:p')
endfunction

function GetParentPath()
	return expand('%:p:h') . '/'
endfunction

function GetCurrentFileName()
	return expand('%:t:r')
endfunction

function GetCurrentFileExtension()
	return expand('%:e')
endfunction

function PasteToggle()
	set invpaste paste?
endfunction

function GiveSpace()
	execute '%s/\s*=\s*/ = /g'
	execute '%s/=\s*=/==/g'
	execute '%s/,\s*/, /g'
endfunction

