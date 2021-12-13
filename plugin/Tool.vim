"常用函式

"取得目前的文字
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

" 給予符號空間
function GiveSpace()
	execute '%s/\s*=\s*/ = /g'
	execute '%s/=\s*=/==/g'
	execute '%s/,\s*/, /g'
	execute '%s/\s*$//g'
endfunction

" 取得目前的行號
function GetCurrentLine()
	return line(".")
endfunction

