$currentBranchName = git branch | grep \* | cut -d ' ' -f2- 

Write-Host $currentBranchName

try{
	git rebase test origin/master 2>&1 | Write-Host
}
catch{
	Write-Host "ERROR CATHCED"
	Write-Host $_
}

pause