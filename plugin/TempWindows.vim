
function TempWindows(bytecode)
	normal! ggdG
	setlocal filetype=tempbytecode
	setlocal buftype=nofile
	call append(0, split(a:bytecode, '\v\n'))
endfunction
function TempVS(bytecode)
	vsplit __Temp_VSplit__
	call TempWindows(a:bytecode)
endfunction
function TempSP(bytecode)
	split __Temp_Split__
	call TempWindows(a:bytecode)
endfunction
function TempTab(bytecode)
	tabnew __Temp_Tab__
	call TempWindows(a:bytecode)
endfunction
