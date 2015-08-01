
function GrepTodoForJava()
	call GrepForJava("TODO")
endfunction
function GrepForJava(word)
	call GrepFor(a:word, "**/*.java")
endfunction
function GrepFor(word, file)
	execute "vimgrep /" . a:word . "/j " . a:file
	execute "cw"
endfunction
