"Java Auto Import

let g:JavaImpPaths = $HOME."/.vim/JavaImp/java,"
			"\$HOME."/workspace/poisondog/poisondog.commons/src/main/java,".
			"\$HOME."/workspace/walton/MySkyBoxCore/src/main/java"
let g:JavaImpDataDir = $HOME."/.vim/JavaImp"
let g:JavaImpSortPkgSep = 0

function CreateJmplst(filename)
	return system("Need JAR to create jmplst!")
	return system("jar tf " . a:filename . ".jar | sed -e 's#^src/##' > " . a:filename . ".jmplst")
endfunction

function GetClassSimpleName(line)
	let names = split(a:line, '\.')
	return strpart(names[-1], 0, strlen(names[-1])-1)
endfunction

function GetImports()
	let imports = []
	let i = 0
	let endLine = line("$")
	while i <= endLine
		let line = getline(i)
		if IsImport(line) != 0
			call add(imports, i)
		endif
		let i = i + 1
	endwhile
	return imports
endfunction

function GetDuplicateImports()
	let imports = []
	let needDelete = []
	let i = 0
	let endLine = line("$")
	while i <= endLine
		let line = getline(i)
		if IsImport(line)
			if index(imports, line) < 0
				call add(imports, line)
			else
				call add(needDelete, i)
			endif
		endif
		let i = i + 1
	endwhile
	return needDelete
endfunction

function InUsed(classline)
	let class = GetClassSimpleName(getline(a:classline))
	let j = 0
	while j <= line("$")
		if search('\<'.class.'\>') != a:classline
			return 1
		endif
		let j = j + 1
	endwhile
	return 0
endfunction

function GetNeverUseImports()
	let needToRemove = []
	for i in GetImports()
		let result = GetClassSimpleName(getline(i))
		if InUsed(i) == 0
			call add(needToRemove, i)
		endif
	endfor
	return needToRemove
endfunction

function UpdateJavaImport()
	call DeleteLines(GetDuplicateImports())
	call DeleteLines(GetNeverUseImports())
	:JIS
endfunction

function DeleteLines(lines)
	call reverse(a:lines)
	for item in a:lines
		execute item . "d"
	endfor
endfunction
