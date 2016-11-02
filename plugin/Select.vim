function GetSelection()
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]
	let lines = getline(lnum1, lnum2)
	let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
	let lines[0] = lines[0][col1 - 1:]
	return join(lines, "\n")
endfunction

function SelectedFirstLine()
	execute "'<"
	return line(".")
endfunction

function SelectedLastLine()
	execute "'>"
	return line(".")
endfunction

"function CommentSwitch(fl, ll)
"	let i=a:fl
"	while i<=a:ll
"		let cl=getline(i)
"		let commentLine = matchstr(cl, "^\\s*\\S+\\s*")
"		if commentLine != ""
"			call RemoveComment(i)
"		else
"			call AddComment(i)
"		endif
"		let i=i+1
"	endwhile
"endfunction

function EscapeVim(input)
	return escape(a:input, ' \/.*~[]')
endfunction
