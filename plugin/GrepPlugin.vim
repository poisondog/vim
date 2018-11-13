
let g:fileTarget = "**/*.*"
let g:allFileTarget = "**/*.*"
let g:javaFileTarget = "**/*.java"
let g:objcFileTarget = "**/*.h **/*.m"
let g:cppFileTarget = "**/*.h **/*.cpp"
let g:vimFileTarget = "**/*.vim"
let g:pythonFileTarget = "**/*.py"

autocmd FileType java let g:fileTarget = g:javaFileTarget
autocmd FileType objc let g:fileTarget = g:objcFileTarget
autocmd FileType objcpp let g:fileTarget = g:objcFileTarget
autocmd FileType python let g:fileTarget = g:pythonFileTarget
autocmd FileType cpp let g:fileTarget = g:cppFileTarget
autocmd FileType vim let g:fileTarget = g:vimFileTarget

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

function GrepSearch()
	call inputsave()
	let name = input('Search: ')
	call Grep(name, g:fileTarget)
	call inputrestore()
endfunction
