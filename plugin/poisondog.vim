
" 取得目前的文字
function GetCurrentWord()
	return expand("<cword>")
endfunction

" 字串取代
function StringReplace(origin, oldChar, newChar)
	return substitute(a:origin, a:oldChar, a:newChar, "")
endfunction

" 取得目前檔案路徑
function GetCurrentFilePath()
	return expand('%')
endfunction

" 取得目前檔案完整路徑
function GetFullCurrentFilePath()
	return expand('%:p')
endfunction

" 取得父目錄路徑
function GetParentPath()
	return expand('%:p:h') . '/'
endfunction

" 取得目前檔案名稱
function GetCurrentFileName()
	return expand('%:t:r')
endfunction

" 取得目前檔案之副檔名
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

" Java: 判斷輸入內容是否為 package 開頭
function IsPackage(line)
	if stridx(a:line, "package ") == 0
		return 1
	endif
	return 0
endfunction

" Java: 從檔案開頭尋找 package 名稱
function GetPackageName()
	let i = 0
	let endLine = line("$")
	while i <= endLine
		let line = getline(i)
		if IsPackage(line) != 0
			return StringReplace(StringReplace(line, "package ", ""), ";", "")
		endif
		let i = i + 1
	endwhile
endfunction

" Java: 取得 Class 的名稱
function GetClassName()
	return GetPackageName() . "." . GetCurrentFileName()
endfunction

" Java: 尋找遊標之上的函式名稱
function FindCurrentJavaFunction()
	let endLine = line(".")
	let i = endLine
	while i > 0
		let line = getline(i)
		let command = "python ~/.vim/script/findJavaFunction.py '" . line . "'"
"		execute command
		let aresult = system(command)
		let i = i - 1
		if len(aresult) != 0
			return aresult
		endif
	endwhile
endfunction

