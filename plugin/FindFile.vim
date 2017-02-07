" find files and populate the quickfix list

fun! FindFiles(filename)
	let error_file = tempname()
	silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
	set errorformat=%f:%l:%m
	tabnew
	exe "cfile ". error_file
	copen
	call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)
