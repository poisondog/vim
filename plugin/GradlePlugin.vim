function GradleTestInfo()
"	return system("./gradlew test -i")
	return call Shell("./gradlew test -i")
endfunction

function GradleTest()
	let response = GradleTestInfo()
	call TempTab(response)
endfunction
