

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

