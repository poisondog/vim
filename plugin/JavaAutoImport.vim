
"Java Auto Import
noremap <F5> :JI<CR>
noremap <F6> :call UpdateJavaImport()<CR>
let g:JavaImpPaths = $HOME."/.vim/JavaImp/java,"
			"\$HOME."/workspace/poisondog/poisondog.commons/src/main/java,".
			"\$HOME."/workspace/walton/MySkyBoxCore/src/main/java"
let g:JavaImpDataDir = $HOME."/.vim/JavaImp"
let g:JavaImpSortPkgSep = 0

function IsImport(line)
	if stridx(a:line, "import ") == 0
		return 1
	endif
	return 0
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

function UpdateJavaImport()
	let needToRemove = []
	for i in GetImports()
		let result = GetClassSimpleName(getline(i))
		if InUsed(i) == 0
			echom "Never used : " . result
			call add(needToRemove, i)
		endif
	endfor
	call reverse(needToRemove)
	for item in needToRemove
		execute item . "d"
	endfor
	:JIS
endfunction
