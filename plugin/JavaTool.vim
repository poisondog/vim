
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

function GetClassName()
	return GetPackageName() . "." . GetCurrentFileName()
endfunction

function IsPackage(line)
	if stridx(a:line, "package ") == 0
		return 1
	endif
	return 0
endfunction

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

function PathToPackage()
	let s = GetFullCurrentFilePath()
	echo s
endfunction
