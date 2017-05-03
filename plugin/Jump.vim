" find files and populate the quickfix list

function JumpToTest()
	execute "tag " . GetCurrentWord() . "Test"
endfunction

function JumpToOrigin()
	execute "tag " . StringReplace(GetCurrentWord(), "Test", "")
endfunction
