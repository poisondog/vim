
function RunScript(filename)
	execute "!/home/poisondog/.vim/script/" . a:filename
endfunction

function Update()
	call RunScript("CreateJmplst")
endfunction

