

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
endfunction

