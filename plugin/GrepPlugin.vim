
let g:fileTarget = "**/*.java"
let g:javaFileTarget = "**/*.java"
let g:objcFileTarget = "**/*.h **/*.m"

autocmd FileType java let g:fileTarget = g:javaFileTarget
autocmd FileType objc let g:fileTarget = g:objcFileTarget
autocmd FileType objcpp let g:fileTarget = g:objcFileTarget

function GrepTodo()
	call GrepAuto("TODO")
endfunction

function GrepAuto(word)
	call Grep(a:word, g:fileTarget)
endfunction

function Grep(word, file)
	execute "vimgrep /" . a:word . "/j " . a:file
	execute "cw"
endfunction
