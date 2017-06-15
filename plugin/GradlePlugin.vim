function GradleTestInfo()
"	return system("./gradlew test -i")
	return call Shell("./gradlew test -i")
endfunction

function GradleTest()
	let response = GradleTestInfo()
	call TempTab(response)
endfunction

function GradleTestOneClass()
	let name = GetClassName()
	execute "!./gradlew test -i --tests " . name
endfunction

function GradleTestPackage()
	let name = GetPackageName()
	execute "!./gradlew test -i --tests " . name . ".*Test"
endfunction
