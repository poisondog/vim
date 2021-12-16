
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

" 產生新檔案
function CreateFile(filepath)
	execute "tabnew " . a:filepath
endfunction

" 新增暫存視窗
function TempWindows(bytecode)
	normal! ggdG
	setlocal filetype=tempbytecode
	setlocal buftype=nofile
	call append(0, split(a:bytecode, '\v\n'))
endfunction

" 新增垂直暫存視窗
function TempVS(bytecode)
	vsplit __Temp_VSplit__
	call TempWindows(a:bytecode)
endfunction

" 新增水平暫存視窗
function TempSP(bytecode)
	split __Temp_Split__
	call TempWindows(a:bytecode)
endfunction

" 新增分頁暫存視窗
function TempTab(bytecode)
	tabnew __Temp_Tab__
	call TempWindows(a:bytecode)
endfunction

" 在 quickfix 中開啟 buffer list
function QuickBuffer()
	call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr": v:val}'))
	copen
endfunction

" ================================================== "

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
		let result = system("python ~/.vim/script/findJavaFunction.py '" . line . "'")
		if len(result) != 0
			return result
		endif
		let i = i - 1
	endwhile
endfunction

" TODO: 待確定使用範圍
function PathToPackage()
	let s = GetFullCurrentFilePath()
	echo s
endfunction

" Java: 產生 java 的單元測試檔案
function CreateJavaTestFile()
	call CreateFile(StringReplace(StringReplace(GetCurrentFilePath(), "^src/main", "src/test"), "\\.java$", "Test\\.java"))
endfunction

" Java: 產生 java file
function CreateJavaFile()
"	call CreateFile(StringReplace(GetParentPath(), "^src/test", "src/main") . GetCurrentWord() . ".java")
	call CreateFile(StringReplace(StringReplace(GetCurrentFilePath(), "^src/test", "src/main"), "\\Test.java$", "\\.java"))
endfunction

" Java: 跳至目前文字所對應的單元測試
function JumpToTest()
	execute "tag " . GetCurrentWord() . "Test"
endfunction

" Java: 跳至目前文字所對應的原始程式
function JumpToOrigin()
	execute "tag " . StringReplace(GetCurrentWord(), "Test", "")
endfunction

" ================================================== "

" Gradle: 執行目前檔案中的所有單元測試
function TestOnClass()
	let name = GetClassName()
	let command = "!./gradlew\ test\ -i\ --tests\ " . name
	execute command
"	tabnew
"	set makeprg=command
"	silent make
"	copen
endfunction

" Gradle: 執行單一方法的單元測試
function TestOnMethod()
	let command = "!./gradlew\ test\ -i\ --tests\ " . GetClassName() . "." . FindCurrentJavaFunction()
	execute command
endfunction

" Gradle: 執行目前package中的所有單元測試
function TestOnPackage()
	let name = GetPackageName()
	let command = "!./gradlew\ test\ -i\ --tests\ " . name . ".*Test"
	execute command
"	tabnew
"	set makeprg=command
"	silent make
"	copen
endfunction

" Gradle: 使用 gradlew 建置專案
function BuildAllJava()
"	execute '!./gradlew build -i --daemon --parallel'
	execute '!./gradlew build -i'
endfunction

" Gradle: 使用 gradlew 執行所有單元測試
function TestAllJava()
	execute "!./gradlew test -i"
endfunction

" Gradle: 使用 gradlew 建置專案，並且將錯誤列於 quickfix 中
function Build()
	tabnew
	set makeprg=./gradlew\ build\ -q
	silent make
	copen
endfunction

" Gradle: 使用 gradlew 執行所有單元測試，並且將錯誤列於 quickfix 中
function Test()
	tabnew
	set makeprg=./gradlew\ test\ -i
	silent make
	copen
endfunction

" Gradle: 使用 gradlew 執行單元測試並且回覆測試結果
function GradleTestInfo()
	return system("./gradlew test -i")
"	return call Shell("./gradlew test -i")
endfunction

" Gradle: 使用 gradlew 執行單元測試並且回覆測試結果於新分頁中
function GradleTest()
	let response = GradleTestInfo()
	call TempTab(response)
endfunction

" Gradle: 使用 gradlew 執行目前檔案的單元測試
function GradleTestOneClass()
	let name = GetClassName()
	execute "!./gradlew test -i --tests " . name
endfunction

" Gradle: 使用 gradlew 執行目前 package 的單元測試
function GradleTestPackage()
	let name = GetPackageName()
	execute "!./gradlew test -i --tests " . name . ".*Test"
endfunction

function TestTemp()
"	execute "silent grep! \"TODO\""
	execute "!git status"
	execute "cw"
endfunction

" ================================================== "
" Maven: 使用 mvn 建置專案，並且將錯誤列於 quickfix 中
function MavenBuild()
	tabnew
	set makeprg=mvn\ clean\ package\ -q
	set errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
	silent make
	copen
endfunction

" ================================================== "
" ================================================== "
" ================================================== "
" ================================================== "
" ================================================== "
