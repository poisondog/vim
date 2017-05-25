

function Build()
	set makeprg=./gradlew\ build\ -q
	silent make
	tabnew
	copen
endfunction

function Test()
	set makeprg=./gradlew\ test\ -q
	silent make
	tabnew
	copen
endfunction

