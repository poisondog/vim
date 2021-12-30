
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

" find files and populate the quickfix list
" 尋找檔案並顯示於 quickfix 中
function FindFiles(filename)
	let error_file = tempname()
	silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
	set errorformat=%f:%l:%m
	tabnew
	exe "cfile ". error_file
	copen
	call delete(error_file)
endfunction
command! -nargs=1 FindFile call FindFiles(<q-args>)

" 從目前行號向下執行取代命令
function ReplaceWordFromCurrentEnd(oldWord, newWord)
	let cl=line(".")
	execute cl . ",$s/\\<" . a:oldWord . "\\>/" . a:newWord . "/gc"
endfunction

" 取代文字，每個取代都需要確認
function ReplaceWordConfirm(oldWord, newWord)
	execute "%s/\\<" . a:oldWord . "\\>/" . a:newWord . "/gc"
endfunction

" 即刻取代文字
function ReplaceWord(oldWord, newWord)
	execute "%s/\\<" . a:oldWord . "\\>/" . a:newWord . "/g"
endfunction

" 根據檔案去執行取代動作
function ReplaceString(file, oldString, newString)
	return system("find -name " . a:file . "|xargs sed -i 's/" . a:oldString . "/" . a:newString . "/g'")
endfunction

" 原始字串處理跳脫字元後執行取代
function ReplaceWordWithEscape(oldWord, newWord)
	execute "%s/" . EscapeVim(a:oldWord) . "/" . a:newWord . "/gc"
endfunction

" 取代游標所在的變數，需每個變數做確認
function ReplaceVariableConfirm()
	call inputsave()
	let newVar = input('Enter New Variable: ')
	call inputrestore()
	call ReplaceWordConfirm(expand("<cword>"), newVar)
endfunction

" 取代游標所在的變數
function ReplaceVariable()
	call inputsave()
	let newVar = input('Enter New Variable: ')
	call inputrestore()
	call ReplaceWord(expand("<cword>"), newVar)
endfunction

" 取代游標所在的變數，從游標所在行號向下搜尋
function ReplaceVariableFromHere()
	call inputsave()
	let newVar = input('Enter New Variable: ')
	call inputrestore()
	call ReplaceWordFromCurrentEnd(expand("<cword>"), newVar)
endfunction

" 取代游標選擇的範圍，需每個符合部分做確認
function ReplaceSelectedConfirm()
	call inputsave()
	let newVar = input('Enter New Variable: ')
	call inputrestore()
	let oldVar = GetSelection()
	call ReplaceWordWithEscape(oldVar, newVar)
endfunction

" 取代游標選擇的範圍
function ReplaceSelected()
	call inputsave()
	let newVar = input('Enter New Variable: ')
	call inputrestore()
	let oldVar = EscapeVim(GetSelection())
	execute "%s/" . oldVar . "/" . newVar . "/g"
endfunction

" 取代游標選擇的範圍，從游標所在行號向下搜尋
function ReplaceSelectedFromHere()
	call inputsave()
	let newVar = input('Enter New Variable: ')
	call inputrestore()
	let oldVar = GetSelection()
	call ReplaceWordFromCurrentEnd(oldVar, newVar)
endfunction

" 取代所有 Java 檔案的指定字串，使用者需要輸入舊字串、新字串
function ReplaceStringOnJava()
	call inputsave()
	let oldString = input('Enter Old String: ')
	let newString = input('Enter New String: ')
	call inputrestore()
	return system("find -name *.java |xargs sed -i 's/" . oldString . "/" . newString . "/g'")
endfunction

" 取代指定字串，使用者需要輸入副檔名、舊字串、新字串
function ReplaceStringOn()
	call inputsave()
	let fileString = input('Enter Filename Extension: ')
	let oldString = input('Enter Old String: ')
	let newString = input('Enter New String: ')
	call inputrestore()
	return system("find -name *." . fileString . " |xargs sed -i 's/" . oldString . "/" . newString . "/g'")
endfunction

" TODO 待確認
function ReplaceTab(length)
	execute "retab! " . a:length
	execute "set ts=8"
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

" 儲存目前使用的 Session
function SaveSession()
	execute 'mksession! ' . getcwd() . '/Session.vim'
endfunction

" 載入先前使用的 Session
function LoadSession()
if filereadable(getcwd() . '/Session.vim')
	execute 'so ' . getcwd() . '/Session.vim'
"	if bufexists(1)
"		for l in range(1, bufnr('$'))
"			if bufwinnr(l) == -1
"				exec 'sbuffer ' . l
"			endif
"		endfor
"	endif
endif
endfunction

" 當離開 vim 時儲存目前使用的 Session
"autocmd VimLeave * call SaveSession()
" 當進入 vim 時讀取先前使用的 Session
"autocmd VimEnter * nested call LoadSession()

" ================================================== "

" 設定編輯器顏色設定
"colorscheme default
"colorscheme torte
"colorscheme koehler
"colorscheme darkblue
"colorscheme desert
"colorscheme shine
"colorscheme ron
"colorscheme molokai
colorscheme poisondog_style

" ================================================== "
