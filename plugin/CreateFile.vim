
function CreateFile(filepath)
	execute "tabnew " . a:filepath
endfunction

function CreateJavaTestFile()
	call CreateFile(StringReplace(StringReplace(GetCurrentFilePath(), "^src/main", "src/test"), "\\.java$", "Test\\.java"))
endfunction

function CreateJavaFile()
"	call CreateFile(StringReplace(GetParentPath(), "^src/test", "src/main") . GetCurrentWord() . ".java")
	call CreateFile(StringReplace(StringReplace(GetCurrentFilePath(), "^src/test", "src/main"), "\\Test.java$", "\\.java"))
endfunction

