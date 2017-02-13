
" TODO 建構自動產生測試原始檔的函式
function CreateTestFile(filepath)
	let newfilepath = a:filepath . @%
	echo newfilepath
	call CreateFile(newfilepath)
endfunction

function CreateFile(filepath)
	system("touch " . a:filepath)
	open a:filepath
endfunction

