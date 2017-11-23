

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

function TestOnPackage()
	let name = GetPackageName()
	let command = "./gradlew\ test\ -i\ --tests\ " . name . ".*Test"
	tabnew
	set makeprg=command
	silent make
	copen
endfunction

function BuildAllJava()
	execute "!./gradlew build -i --daemon --parallel"
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
	execute "!python3 setup.py install --user"
endfunction

function ApplyCpp()
	map <F7> :call BuildCMake()<CR>
	map <F8> :call TestX64CC()<CR>
	echo "apply Cpp builder"
endfunction

function ApplyJava()
	map <F7> :call BuildAllJava()<CR>
	map <F8> :call TestAllJava()<CR>
	echo "apply Java builder"
endfunction

function ApplyPython()
	map <F7> :call InstallAllPython()<CR>
	map <F8> :call TestAllPython()<CR>
	echo "apply Python builder"
endfunction

function SwitchBuilder(index)
	let funcs = [function("ApplyJava"), function("ApplyCpp"), function("ApplyPython")]
	call funcs[a:index % len(funcs)]()
endfunction
