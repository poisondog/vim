
function SelectLine(start, end)
	execute a:start
	execute "normal V"
	execute a:end
endfunction

function MoveLineUp(start, end)
	let i=a:start
	while i<=a:end
		execute i
		execute "normal dd"
		execute "normal k"
		execute "normal P"
		let i=i+1
	endwhile
	call SelectLine(a:start - 1, a:end - 1)
endfunction

function MoveLineDown(start, end)
	let i=a:end
	while i>=a:start
		execute i
		execute "normal dd"
		execute "normal p"
		let i=i-1
	endwhile
	call SelectLine(a:start + 1, a:end + 1)
endfunction
