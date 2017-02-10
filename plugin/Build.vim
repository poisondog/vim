

function Build()
	set makeprg=./gradlew\ build\ -q
	silent make
	tabnew
	copen
endfunction

