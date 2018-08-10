

function Build()
	tabnew
	set makeprg=./gradlew\ build\ -q
	silent make
	copen
endfunction

function Test()
	tabnew
	set makeprg=./gradlew\ test\ -q
	silent make
	copen
endfunction

function TestOnClass()
	let name = GetClassName()
	let command = "!./gradlew\ test\ -i\ --tests\ " . name
	execute command
"	tabnew
"	set makeprg=command
"	silent make
"	copen
endfunction

function TestOnPackage()
	let name = GetPackageName()
	let command = "!./gradlew\ test\ -i\ --tests\ " . name . ".*Test"
	execute command
"	tabnew
"	set makeprg=command
"	silent make
"	copen
endfunction

function BuildAllJava()
"	execute '!./gradlew build -i --daemon --parallel'
	execute '!./gradlew build -i'
endfunction

function TestAllJava()
	execute "!./gradlew test -i"
endfunction

function BuildCMake()
	execute "!cmake -Bbuild -H."
	execute "!make --directory=build"
	execute "!make install --directory=build"
endfunction

function TestX64CC()
	execute "!build/platforms/x64/runTest"
endfunction

function BuildAllPython()
	execute "!python3 setup.py build"
endfunction

function TestAllPython()
	execute "!python3 setup.py test"
endfunction

function InstallAllPython()
	execute "!python3 setup.py install --user --prefix="
endfunction

function ApplyCpp()
	nnoremap <F7> :call BuildCMake()<CR>
	nnoremap <F8> :call TestX64CC()<CR>
	echo "apply Cpp builder"
endfunction

function ApplyJava()
	nnoremap <F7> :call BuildAllJava()<CR>
	nnoremap <F8> :call TestAllJava()<CR>
	nnoremap <leader>tp :call TestOnPackage()<CR>
	nnoremap <leader>tt :call TestOnClass()<CR>
	echo "apply Java builder"
endfunction

function ApplyPython()
	nnoremap <F7> :call InstallAllPython()<CR>
	nnoremap <F8> :call TestAllPython()<CR>
	echo "apply Python builder"
endfunction

function SwitchBuilder(index)
	let funcs = [function("ApplyJava"), function("ApplyCpp"), function("ApplyPython")]
	call funcs[a:index % len(funcs)]()
endfunction
