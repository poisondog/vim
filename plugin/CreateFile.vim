
function CreateFile(filepath)
	execute "tabnew " . a:filepath
endfunction

function CreateJavaTestFile()
	let newfilepath = StringReplace(StringReplace(GetCurrentFilePath(), "^src/main", "src/test"), "\\.java$", "Test\\.java")
	call CreateFile(newfilepath)
endfunction

function CreateJavaFile()
	let newfilepath = StringReplace(GetParentPath(), "^src/test", "src/main") . GetCurrentWord() . ".java"
	call CreateFile(newfilepath)
endfunction

