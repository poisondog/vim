

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

