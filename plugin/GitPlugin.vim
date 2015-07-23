
function GitStatus()
	silent !clear
	call TempTab(GitStatusCommand())
endfunction

function GitDiff()
	call TempVS(GitDiffCommand())
endfunction

function GitCommit()
	call inputsave()
	let comment = input('Enter Comment: ')
	call inputrestore()
	let response = GitCommitCommand(comment)
	call TempVS(response)
endfunction

function GitAddCommand(parameter)
	return system("git add " . a:parameter)
endfunction

function GitStatusCommand()
	return system("git status")
endfunction

function GitStashCommand()
	return system("git stash")
endfunction

function GitStashPopCommand()
	return system("git stash pop")
endfunction

function GitDiffCommand()
	return system("git diff")
endfunction

function GitPushCommand(host, branch)
	return system("git push " . host . " " . branch)
endfunction

function GitCommitCommand(comment)
	return system("git commit -am \"" . a:comment . "\"")
endfunction
