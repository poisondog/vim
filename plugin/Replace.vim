
function ReplaceVariable()
	call inputsave()
	let newVar = input('Enter New Variable: ')
	call inputrestore()
	call ReplaceWord(expand("<cword>"), newVar)
endfunction

function ReplaceWord(oldWord, newWord)
	execute "%s/\\<" . a:oldWord . "\\>/" . a:newWord . "/gc"
endfunction

function ReplaceString(file, oldString, newString)
	return system("find -name " . a:file . "|xargs sed -i 's/" . a:oldString . "/" . a:newString . "/g'")
endfunction

function ReplaceStringOnJava()
	call inputsave()
	let oldString = input('Enter Old String: ')
	let newString = input('Enter New String: ')
	call inputrestore()
	return system("find -name *.java |xargs sed -i 's/" . oldString . "/" . newString . "/g'")
endfunction

function ReplaceStringOn()
	call inputsave()
	let fileString = input('Enter File Type: ')
	let oldString = input('Enter Old String: ')
	let newString = input('Enter New String: ')
	call inputrestore()
	return system("find -name *." . fileString . " |xargs sed -i 's/" . oldString . "/" . newString . "/g'")
endfunction
