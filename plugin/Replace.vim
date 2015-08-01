
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
