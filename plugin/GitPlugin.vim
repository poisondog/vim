
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
	call TempTab(response)
endfunction

function GitPush()
	call inputsave()
	let host = input('Enter Host: ')
	let branch = input('Enter Branch: ')
	call inputrestore()
"	let response = GitPushCommand(host, branch)
"	call TempTab(response)
	execute "!git push " . host . " " . branch
endfunction

function GitPull()
	call inputsave()
	let host = input('Enter Host: ')
	let branch = input('Enter Branch: ')
	call inputrestore()
"	let response = GitPushCommand(host, branch)
"	call TempTab(response)
	execute "!git pull " . host . " " . branch
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
	return system("git push " . a:host . " " . a:branch)
endfunction

function GitCommitCommand(comment)
	return system("git commit -am \"" . a:comment . "\"")
endfunction

function GitUntrack(comment)
	return system("git rm -r --cached " . a:comment . "")
endfunction

